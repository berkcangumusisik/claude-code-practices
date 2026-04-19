# Auto-Format on Edit

Run your formatter on every file Claude writes or edits. No more "please run prettier" reminders.

## JS / TS (Prettier)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | xargs -r -I{} npx prettier --write {} 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

## Python (ruff)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | xargs -r -I{} ruff format {} 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

## Go (gofmt)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | xargs -r gofmt -w 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

## Rust (rustfmt)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | xargs -r rustfmt 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

## Why `|| true`

If the formatter fails (syntax error mid-edit), we don't want to block Claude. The next edit will try again.
