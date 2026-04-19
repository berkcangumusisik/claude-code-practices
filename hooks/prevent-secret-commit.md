# Prevent Secret Commits

Block `Edit` and `Write` if the incoming content contains obvious secret patterns. Fails loudly — Claude sees the error and rewrites.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.content // .tool_input.new_string // empty' | grep -qE '(AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{32,}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----)' && echo 'Blocked: content looks like a secret (API key, token, or private key). Use an env var.' >&2 && exit 2 || exit 0"
          }
        ]
      }
    ]
  }
}
```

## What it catches

| Pattern | Matches |
|---|---|
| `AKIA...` | AWS access keys |
| `sk-...` | OpenAI / Anthropic-style keys |
| `ghp_...` | GitHub personal access tokens |
| `xox[bapr]-...` | Slack tokens |
| `BEGIN PRIVATE KEY` | PEM-formatted private keys |

## Extend

Add more patterns to the `grep -qE` alternation. Exit code `2` is what Claude Code treats as a hard block — anything else is ignored.

## Caveat

This is a belt — not a substitute for a suspenders-level solution. Pair with:
- A pre-commit secret scanner (`gitleaks`, `trufflehog`)
- `.env*` in `.gitignore` and `.claudeignore`
