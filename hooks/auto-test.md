# Auto-Test the Changed File

Run tests for just the file Claude edited. Fast feedback, no full-suite cost.

## JS / TS (Vitest)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | xargs -r -I{} sh -c 'npx vitest run --related \"{}\" --reporter=dot 2>&1 | tail -30'"
          }
        ]
      }
    ]
  }
}
```

## Python (pytest)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | grep -E '\\.py$' | xargs -r -I{} pytest --testmon-noselect {} -q 2>&1 | tail -20"
          }
        ]
      }
    ]
  }
}
```

## Go

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path // empty' | grep -E '\\.go$' | xargs -r -I{} dirname {} | xargs -r -I{} go test -count=1 -run . {} 2>&1 | tail -20"
          }
        ]
      }
    ]
  }
}
```

## Rust

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "cargo test --quiet 2>&1 | tail -30"
          }
        ]
      }
    ]
  }
}
```

## Gotcha

On a slow test file (>30s) this blocks every edit. Use the project-level `auto-typecheck` hook instead for very slow suites — cheaper signal, similar value.
