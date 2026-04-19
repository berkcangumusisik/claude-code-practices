# Hook Recipes

Hooks are shell commands Claude Code runs on certain events (file edits, session stop, user prompt submit). They're configured in `.claude/settings.json`.

This folder has ready-to-copy recipes. Each one is a small `settings.json` snippet you can drop in.

| Recipe | What it does |
|---|---|
| [auto-format.md](auto-format.md) | Run Prettier / ruff / gofmt after every edit |
| [auto-typecheck.md](auto-typecheck.md) | Block Claude from continuing if types break |
| [prevent-secret-commit.md](prevent-secret-commit.md) | Reject edits that add API keys or `.env` contents |
| [notify-on-done.md](notify-on-done.md) | Desktop notification when Claude finishes a long session |
| [auto-test.md](auto-test.md) | Run tests for just the changed file after each edit |
| [block-dangerous-commands.md](block-dangerous-commands.md) | Deny `rm -rf`, `git push --force`, `DROP TABLE` |

## How to add a hook

Edit `.claude/settings.json` (project) or `~/.claude/settings.json` (global):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "your command here" }
        ]
      }
    ]
  }
}
```

Available events:

| Event | Fires |
|---|---|
| `PreToolUse` | Before any tool runs. Can block. |
| `PostToolUse` | After a tool runs successfully |
| `UserPromptSubmit` | Before Claude sees your message. Can inject context. |
| `Stop` | When Claude finishes responding |
| `SubagentStop` | When a subagent finishes |
| `PreCompact` | Before `/compact` runs |
| `SessionStart` | At the start of any session |

## Debugging

If a hook doesn't fire, check:

```bash
claude --debug
```

The startup banner lists which hooks loaded and which failed to parse.
