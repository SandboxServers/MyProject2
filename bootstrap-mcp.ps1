<#
.SYNOPSIS
    Wires an existing Unreal Engine 5.8 project for Claude Code / MCP control.

.DESCRIPTION
    Copies the MCPFullControl content-only plugin into the target project,
    drops a .mcp.json, and enables the stock UE 5.8 experimental plugins
    (ModelContextProtocol + EditorToolset) in the .uproject.

    No engine modification and no C++ compilation required.

.PARAMETER ProjectPath
    Path to the target .uproject file, OR the folder that contains it.

.EXAMPLE
    .\bootstrap-mcp.ps1 -ProjectPath "C:\Users\me\Documents\Unreal Projects\MyGame"
    .\bootstrap-mcp.ps1 "C:\...\MyGame\MyGame.uproject"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$ProjectPath
)

$ErrorActionPreference = 'Stop'
$kit = $PSScriptRoot
$payload = Join-Path $kit 'payload'

function Fail($msg) { Write-Host "ERROR: $msg" -ForegroundColor Red; exit 1 }

# --- Resolve the .uproject ---------------------------------------------------
if (-not (Test-Path $ProjectPath)) { Fail "Path not found: $ProjectPath" }
$item = Get-Item $ProjectPath
if ($item.PSIsContainer) {
    $uproject = Get-ChildItem $item.FullName -Filter *.uproject | Select-Object -First 1
    if (-not $uproject) { Fail "No .uproject found in $($item.FullName)" }
} elseif ($item.Extension -eq '.uproject') {
    $uproject = $item
} else {
    Fail "ProjectPath must be a .uproject file or a folder containing one."
}
$projRoot = Split-Path $uproject.FullName -Parent
Write-Host "Target project: $($uproject.FullName)" -ForegroundColor Cyan

# --- Sanity: payload present -------------------------------------------------
if (-not (Test-Path (Join-Path $payload 'MCPFullControl\MCPFullControl.uplugin'))) {
    Fail "Kit payload missing (expected $payload\MCPFullControl). Run this script from inside the kit folder."
}

# --- 1) Copy the MCPFullControl plugin --------------------------------------
$pluginsDir = Join-Path $projRoot 'Plugins'
New-Item -ItemType Directory -Force -Path $pluginsDir | Out-Null
$dest = Join-Path $pluginsDir 'MCPFullControl'
robocopy (Join-Path $payload 'MCPFullControl') $dest /E /XD __pycache__ /XF *.pyc /NFL /NDL /NJH /NJS /NP | Out-Null
# robocopy exit codes 0-7 are success (>=8 is failure); normalize so the script exits 0.
if ($LASTEXITCODE -ge 8) { Fail "robocopy failed copying the plugin (code $LASTEXITCODE)" }
$global:LASTEXITCODE = 0
Write-Host "  [+] Plugin -> $dest"

# --- 2) Drop .mcp.json -------------------------------------------------------
$mcpDest = Join-Path $projRoot '.mcp.json'
Copy-Item (Join-Path $payload '.mcp.json') $mcpDest -Force
Write-Host "  [+] .mcp.json -> $mcpDest"

# --- 3) Enable engine plugins in the .uproject ------------------------------
$backup = "$($uproject.FullName).bak"
Copy-Item $uproject.FullName $backup -Force
$proj = Get-Content $uproject.FullName -Raw | ConvertFrom-Json
$plugins = @()
if ($proj.PSObject.Properties.Name -contains 'Plugins' -and $proj.Plugins) { $plugins = @($proj.Plugins) }
$have = $plugins | ForEach-Object { $_.Name }
foreach ($need in @('ModelContextProtocol', 'EditorToolset')) {
    if ($have -notcontains $need) {
        $plugins += [pscustomobject]@{ Name = $need; Enabled = $true }
        Write-Host "  [+] Enabled plugin: $need"
    } else {
        Write-Host "  [=] Already present: $need"
    }
}
if ($proj.PSObject.Properties.Name -contains 'Plugins') { $proj.Plugins = $plugins }
else { $proj | Add-Member -NotePropertyName Plugins -NotePropertyValue $plugins }
$proj | ConvertTo-Json -Depth 20 | Set-Content $uproject.FullName -Encoding UTF8
Write-Host "  [+] .uproject patched (backup: $backup)"

# --- Done --------------------------------------------------------------------
Write-Host ""
Write-Host "Done. Next steps:" -ForegroundColor Green
Write-Host "  1. Open the project in Unreal Editor (UE 5.8). Accept any 'enable plugins / restart' prompt."
Write-Host "  2. In the editor console (` (tilde) ), run:  ModelContextProtocol.RefreshTools"
Write-Host "     - The Output Log should report the MCP server on http://127.0.0.1:8000/mcp and an adapter count (~257)."
Write-Host "  3. Launch Claude Code in the project folder and run  /mcp  to connect (tools load at connect time)."
Write-Host ""
Write-Host "Requires: Unreal Engine 5.8 (the ModelContextProtocol/EditorToolset/ToolsetRegistry"
Write-Host "experimental plugins ship with it). No engine edits or C++ build needed."
