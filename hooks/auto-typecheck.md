# Auto Type-Check

Run the type checker after every edit. Claude sees the errors in the next turn and fixes them — instead of you copying them back by hand.

## TypeScript

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "npx tsc --noEmit 2>&1 | head -50"
          }
        ]
      }
    ]
  }
}
```

## Python (mypy)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "mypy . 2>&1 | head -50"
          }
        ]
      }
    ]
  }
}
```

## Go (build)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "go build ./... 2>&1 | head -50"
          }
        ]
      }
    ]
  }
}
```

## Rust (cargo check)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "cargo check --message-format=short 2>&1 | head -50"
          }
        ]
      }
    ]
  }
}
```

## Why `head -50`

A catastrophic refactor can produce 2,000 errors. Piping through `head -50` keeps the hook output bounded so Claude doesn't blow its context budget on a single failed edit.
