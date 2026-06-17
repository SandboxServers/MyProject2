# AGENT.md — instructions for an AI coding agent (e.g. Claude Code)

You are setting up **Unreal Engine 5.8 MCP control** for the user using this kit.
Follow these steps. Do the file operations yourself; stop and ask the human only
where noted. Everything here is local filesystem + PowerShell — you do NOT need an
Unreal/MCP connection to perform the setup itself.

## Prerequisites to confirm with the user first
- **Unreal Engine 5.8** is installed (ships the required experimental engine plugins:
  ModelContextProtocol, ToolsetRegistry, EditorToolset). If they're on a different
  engine version, STOP — this kit targets 5.8.
- You know the **path to their UE 5.8 project** (a folder containing a `.uproject`,
  or the `.uproject` itself). If you don't, ask.

## Steps you perform
1. Locate this kit folder (it contains `bootstrap-mcp.ps1` and `payload/`).
2. Run the installer, passing the user's project path:
   ```powershell
   .\bootstrap-mcp.ps1 -ProjectPath "<their project folder or .uproject>"
   ```
   If script execution is blocked, run it in a process-scoped bypass:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\bootstrap-mcp.ps1 -ProjectPath "<...>"
   ```
   (Equivalent manual steps, if you prefer not to use the script: copy
   `payload/MCPFullControl` into `<project>/Plugins/`, copy `payload/.mcp.json` to the
   project root, and add `{"Name":"ModelContextProtocol","Enabled":true}` and
   `{"Name":"EditorToolset","Enabled":true}` to the `Plugins` array in the `.uproject`.)
3. Verify the result: `<project>/Plugins/MCPFullControl/MCPFullControl.uplugin` exists,
   `<project>/.mcp.json` exists, and the `.uproject` lists both plugins. The script also
   leaves a `.uproject.bak` backup.
4. (Optional) Launch the editor so the MCP server comes up:
   ```powershell
   Start-Process "<...>\YourProject.uproject"
   ```
   The ModelContextProtocol server starts on editor launch (http://127.0.0.1:8000/mcp)
   and `init_unreal.py` registers the full-control toolset automatically. You do NOT
   need to run `ModelContextProtocol.RefreshTools` on a fresh launch — that's only for
   after toolsets are added/edited mid-session.

## Where you MUST hand back to the human
- **You cannot connect yourself to the new MCP server.** Your MCP tools load when your
  session starts and reads `.mcp.json`. After you create that file, tell the human:
  > "Setup complete. Run `/mcp` (or restart me) so I pick up the `unreal-mcp` server,
  >  then I can drive the editor."
- If the editor shows any first-launch dialog about enabling plugins, ask the human to
  accept it (you can't click editor UI).

## After reconnect — sanity check
Once reconnected, confirm tools are live by calling a read-only MCP tool, e.g. get the
current level or list actors. If the `unreal-mcp` tools aren't present, the editor isn't
running or `.mcp.json` wasn't picked up — re-launch the editor and reconnect.
