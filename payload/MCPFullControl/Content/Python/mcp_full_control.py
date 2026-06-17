"""MCP Full Control toolset.

Registers two tools with the Unreal MCP Toolset Registry:

  * execute_python          - run arbitrary Python in the editor interpreter
  * execute_console_command - run an Unreal console command

The Python tool is the real "full control" surface: it has access to the
``unreal`` module, so it can spawn / edit / delete actors, edit assets,
materials, blueprints, levels, run editor automation, and invoke console
commands. Output is captured and returned to the caller.
"""

import unreal
import toolset_registry
from toolset_registry.registration import Registration


# A namespace that persists across execute_python calls, so helpers/variables
# defined in one call remain available in the next. Seeded with `unreal`.
_EXEC_NAMESPACE = {"unreal": unreal, "__name__": "__mcp_exec__"}


@unreal.uclass()
class FullControlTools(unreal.ToolsetDefinition):
    """Provides full control over the Unreal Editor by executing arbitrary
    Python code or console commands."""

    @toolset_registry.tool_call
    @staticmethod
    def execute_python(code: str) -> str:
        """Executes arbitrary Python code in the editor's Python interpreter.

        The ``unreal`` module is pre-imported and the namespace persists
        between calls. Use ``print(...)`` to return values to the caller -
        stdout and stderr are captured. Exceptions are caught and their
        traceback is returned instead of raised.

        Args:
            code: The Python source to execute.

        Returns:
            Captured stdout/stderr, or a formatted traceback on failure.
        """
        import io
        import contextlib
        import traceback

        buffer = io.StringIO()
        try:
            with contextlib.redirect_stdout(buffer), contextlib.redirect_stderr(buffer):
                exec(code, _EXEC_NAMESPACE)
        except Exception:
            buffer.write(traceback.format_exc())

        output = buffer.getvalue()
        return output if output.strip() else "(executed successfully, no output)"

    @toolset_registry.tool_call
    @staticmethod
    def execute_console_command(command: str) -> str:
        """Executes an Unreal console command in the editor world.

        Args:
            command: The console command string, e.g. ``stat fps``.

        Returns:
            Confirmation that the command was issued, or a traceback on failure.
        """
        import traceback

        try:
            editor_subsystem = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
            world = editor_subsystem.get_editor_world()
            unreal.SystemLibrary.execute_console_command(world, command)
            return f"Executed console command: {command}"
        except Exception:
            return "Failed to execute console command:\n" + traceback.format_exc()


# --- Registration -----------------------------------------------------------
# Associates the toolset class with the Toolset Registry. init_unreal.py calls
# register() at editor startup; register() returns False if the native registry
# is not yet available (mirrors toolset_registry.registration.Registration).
_registration = Registration([FullControlTools])


def register() -> bool:
    """Registers the Full Control toolset with the Toolset Registry.

    Returns:
        True if the registry was available and the toolset was registered.
    """
    return _registration.register()
