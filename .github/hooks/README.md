# Agent safety hooks

[agent-safety.json](./agent-safety.json) contains Copilot `preToolUse` hooks. They apply to Copilot CLI and to VS Code sessions that use the **Copilot** session target, which share one hook format. They do not apply to VS Code's older **Local** harness, and cloud sessions see them only from the cloned repository.

| Hook | Runs for | Effect |
|---|---|---|
| Shell confirmation | `bash`, `powershell`, `write_bash`, `write_powershell` | Asks before every agent shell command, including input sent to an already-running shell. |
| Protected-edit guard | `create`, `edit`, `str_replace_editor`, `apply_patch` | Asks before edits to the protected configuration listed in [copilot-instructions.md](../copilot-instructions.md). Also asks when the target path cannot be identified. |

Behavior to know:

- Each hook runs only for the tools above (`matcher`), so reads and searches are not slowed down.
- If a hook crashes or exits with an error, the tool call is denied. If it times out, the call falls through to the normal permission prompts.
- Where no one can answer (cloud agent, Copilot CLI autopilot), "ask" is treated as deny.
- Hooks guide permissions; they are not a sandbox. Keep VS Code tool and terminal auto-approval disabled.
- The edit guard reads paths only from tool arguments. A shell command could still change protected files, which is why every shell command needs confirmation.
- The PowerShell entry loads its script with `[scriptblock]::Create` so it works under the default Windows execution policy without starting a second process.
- Copilot ignores the `handoffs` and `argument-hint` fields in agent files; switch agents manually there.

Test after any change: in a new Copilot session, ask an agent to run `git status` (expect a prompt), edit a file in `docs/` (no prompt), and edit `.vscode/settings.json` (expect a prompt; decline it).
