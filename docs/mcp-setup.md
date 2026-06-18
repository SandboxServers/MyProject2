# MCP Control Setup & Reconnect

This project is wired for **Unreal Engine 5.8 MCP control**, so an AI agent can drive
the editor (actors, assets, materials, blueprints, levels, Python/console). Setup is
already done — this doc is for reconnecting and troubleshooting.

## Reconnect (normal case)
1. Launch the editor (double-click `MyProject2.uproject`, or `Start-Process` it).
2. Wait for it to fully load. The ModelContextProtocol server comes up on
   `http://127.0.0.1:8000/mcp` and `init_unreal.py` auto-registers the toolset.
3. In Claude Code run **`/mcp`** to connect (tools load at connect time).
4. Sanity check: call a read-only tool (e.g. SceneTools `get_current_level`).

## Troubleshooting
- **`/mcp` → `ConnectionRefused` at 127.0.0.1:8000:** the editor isn't running, OR the
  MCP server's **auto-start-with-editor** setting is off so it never started. Check for
  a listener: `Get-NetTCPConnection -LocalPort 8000 -State Listen`. No listener +
  editor running ⇒ enable auto-start (UE plugin/project settings) or start it in-editor.
- **First-launch "enable plugins / restart" dialog:** a human must accept it (the agent
  can't click editor UI).
- **`.uproject` won't open from Windows / "no program":** register the file association
  with `UnrealVersionSelector.exe /fileassociations` (elevated).

## What's installed
- Engine plugins (stock UE 5.8 experimental): ModelContextProtocol, ToolsetRegistry, EditorToolset.
- Project plugin: `Plugins/MCPFullControl/` (Python-only, content plugin).
- `.mcp.json` at project root (Claude Code reads it to find the `unreal-mcp` server).

## Re-applying to another project
The shareable bootstrap kit lives at `C:\Users\derek\Documents\MCP-Bootstrap-Kit\`:
`.\bootstrap-mcp.ps1 -ProjectPath "<project folder or .uproject>"`.
