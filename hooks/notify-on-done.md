# Notify When Done

Desktop notification when Claude finishes responding. Useful for long sessions where you context-switch to other work.

## macOS

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Claude finished\" with title \"Claude Code\" sound name \"Glass\"'"
          }
        ]
      }
    ]
  }
}
```

## Linux (notify-send)

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "notify-send 'Claude Code' 'Claude finished'"
          }
        ]
      }
    ]
  }
}
```

## Terminal bell (universal)

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          { "type": "command", "command": "printf '\\a'" }
        ]
      }
    ]
  }
}
```

## Only after long sessions

Gate on session duration so short Q&A doesn't buzz your desk. Replace the command with:

```bash
test $SECONDS -gt 60 && osascript -e 'display notification "Claude finished" with title "Claude Code"'
```
