# Bootstrap for the MCP Full Control toolset.
#
# Unreal's Python only auto-runs init_unreal.py at startup; it does NOT
# auto-import arbitrary modules. So this file imports the toolset module and
# registers it with the Toolset Registry (mirroring how the shipped
# EditorToolset bootstraps via toolsets._registration.register()).

import unreal

try:
    import mcp_full_control

    registered = mcp_full_control.register()
    unreal.log(
        f"[MCPFullControl] init_unreal complete: registered={registered}"
    )
except Exception:
    import traceback
    unreal.log_error(
        "[MCPFullControl] init_unreal FAILED:\n" + traceback.format_exc()
    )
