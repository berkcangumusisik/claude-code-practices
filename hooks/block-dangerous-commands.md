# Block Dangerous Commands

Hard-deny a list of commands Claude should never run unattended. Fails with exit code 2 so Claude reads the reason and adapts.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.command // empty' | grep -qE '(rm -rf[[:space:]]+/|rm -rf[[:space:]]+~|git push[[:space:]]+.*--force|git push[[:space:]]+.*-f[[:space:]]|git reset[[:space:]]+--hard[[:space:]]+origin|DROP[[:space:]]+TABLE|TRUNCATE[[:space:]]+TABLE|DELETE[[:space:]]+FROM[[:space:]]+[a-z_]+[[:space:]]*;|chmod[[:space:]]+-R[[:space:]]+777|:\\(\\)\\{:\\|:\\&\\};:)' && echo 'Blocked: command matches a dangerous pattern. Ask the user first.' >&2 && exit 2 || exit 0"
          }
        ]
      }
    ]
  }
}
```

## What it blocks

| Pattern | Risk |
|---|---|
| `rm -rf /` or `rm -rf ~` | Wipes the filesystem or home |
| `git push --force` / `-f` | Overwrites remote history |
| `git reset --hard origin/...` | Destroys local work |
| `DROP TABLE` / `TRUNCATE TABLE` | Data loss in SQL |
| Unqualified `DELETE FROM x;` | Full-table delete |
| `chmod -R 777` | Security regression |
| Fork bomb `:(){ :|:& };:` | DoS |

## Philosophy

This is a net, not a policy. It blocks the patterns that would ruin your day if Claude ever ran them by accident. For intentional use, run them outside Claude Code or temporarily remove the hook.
