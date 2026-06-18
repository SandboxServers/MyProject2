<#
.SYNOPSIS
  Opens the project's FAB asset links in your default browser so you can claim them
  to your FAB library (then "Add to Project" in the editor).

.DESCRIPTION
  Source of truth for the asset list is docs/asset-manifest.md. This script mirrors it
  for one-click opening. By default it opens the Tier-1 "claim now" set; use -All to
  open the full list, or -List to just print them without opening.

.EXAMPLE
  pwsh docs/scripts/open-fab-assets.ps1            # opens the 7 Tier-1 assets
  pwsh docs/scripts/open-fab-assets.ps1 -All       # opens every asset in the manifest
  pwsh docs/scripts/open-fab-assets.ps1 -List      # prints the list, opens nothing
#>
param(
  [switch]$All,
  [switch]$List
)

# Tier-1: minimum set to start building (see docs/asset-manifest.md)
$tier1 = [ordered]@{
  'Drift Heaven (player car)'            = 'https://www.fab.com/listings/53d81aa6-f8a8-40b5-a80c-ae53e6fd77bc'
  'Road Blockout Kit (track meshes)'     = 'https://www.fab.com/listings/dc6b14b3-f7eb-4a53-a589-eb3d5bfbb8d5'
  'Stylized Asphalt (road surface)'      = 'https://www.fab.com/listings/687e0724-f572-4225-b80b-0d8284ad0056'
  'Dynamic Sky & Light Manager (sky)'    = 'https://www.fab.com/listings/83f525a4-4220-4e15-9382-0b45ddab9947'
  'Stylized Landscape and Grass (ground)'= 'https://www.fab.com/listings/93e420a3-f606-46c6-8e6b-fa6f1c045b9e'
  'Freeway Props (barriers)'             = 'https://www.fab.com/listings/b200bac9-1cd3-4cfc-bd69-4e3fcd6f527f'
  'Instant Chrono Kit (lap timer)'       = 'https://www.fab.com/listings/1e65a40f-8c4d-485a-8383-47c969cc6d79'
}

# Tier 2/3: nice-to-have / polish
$extra = [ordered]@{
  'Ultimate Car Racing Project (alt car)'= 'https://www.fab.com/listings/67cff605-ec31-4f50-80c8-b2aa28c8f25e'
  'Stylized Volumetric Clouds'           = 'https://www.fab.com/listings/3dcea533-24d9-4aa7-bbf6-bdf876c1f3eb'
  'Stylized Low Poly Nature Lite (pines)'= 'https://www.fab.com/listings/fef6b0c6-19a4-47bc-913f-c8328910cec4'
  'Mountain Tops (horizon)'              = 'https://www.fab.com/listings/8cdfadfb-5fa6-4b4e-99db-1a02b01295c2'
  'Grand Stadium (shell)'                = 'https://www.fab.com/listings/6d8afd3b-27a5-486b-a29c-997d75b7a4c7'
  'Street Props Vol.1 (barriers)'        = 'https://www.fab.com/listings/c1dae76b-8c31-486f-8333-a3958dd4b8f3'
  'Urban Decay Traffic Cone'             = 'https://www.fab.com/listings/987acbb1-f498-4398-93fa-66e881287916'
  'Flag Props (250+ flags)'              = 'https://www.fab.com/listings/64eed69f-2b22-4851-8ea4-3a36fc7ce136'
  'Easy Checkpoint & Respawn'            = 'https://www.fab.com/listings/733cf112-9845-409c-a1d1-3b0973981ad6'
  'Ghost Replay System'                  = 'https://www.fab.com/listings/2eb83102-6ea6-448a-a56e-64b905cc1651'
  'Custom Gauge Material (speedo)'       = 'https://www.fab.com/listings/27c280fc-f039-485a-a1b7-50e3396a148a'
  'Wall Bundle (for gantry parts)'       = 'https://www.fab.com/listings/b6515b4b-a1b6-4236-8ff9-172ae241fb37'
  'Racing Music Vol. 1'                  = 'https://www.fab.com/listings/01bdfd65-7406-4bb3-b33f-9dea333a64be'
}

$set = if ($All) { $tier1 + $extra } else { $tier1 }
$label = if ($All) { 'ALL manifest assets' } else { 'Tier-1 "claim now" assets' }

Write-Host "FAB assets — $label ($($set.Count)):" -ForegroundColor Cyan
$i = 0
foreach ($name in $set.Keys) {
  $i++
  Write-Host ("  {0,2}. {1}" -f $i, $name) -ForegroundColor Green
  Write-Host ("      {0}" -f $set[$name]) -ForegroundColor DarkGray
  if (-not $List) { Start-Process $set[$name] }
}

if ($List) {
  Write-Host "`n(-List mode: nothing opened. Run without -List to open these in your browser.)" -ForegroundColor Yellow
} else {
  Write-Host "`nOpened $($set.Count) tab(s). On each: click 'Add to Library' (free), then in UE: FAB > My Library > Add to Project." -ForegroundColor Cyan
}
