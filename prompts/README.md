# Prompt Templates

Copy-paste prompt patterns for the most common tasks. Not skills — just shapes.

Each template fills three roles Claude Code needs in every prompt:

1. **Anchor** — an exact file path, line, function, or commit
2. **Goal** — what "done" looks like
3. **Guardrail** — what not to touch

| Template | Use when |
|---|---|
| [bug-fix.md](bug-fix.md) | You have a reproducing bug |
| [feature-add.md](feature-add.md) | Adding a new feature or endpoint |
| [refactor.md](refactor.md) | Reshaping existing code without changing behavior |
| [code-review.md](code-review.md) | Asking Claude to review a diff or branch |
| [debug.md](debug.md) | Something's broken and you don't know why |
| [test-add.md](test-add.md) | Adding tests to existing code |
| [migration.md](migration.md) | Upgrading a dependency or framework version |
| [explain.md](explain.md) | Understanding unfamiliar code |

## Why these work

Compare:

```
❌ "fix the login bug"
```

vs.

```
✅ src/auth/login.ts:87 — validateEmail() accepts "foo@" as valid.
   Goal: reject emails without a TLD; match RFC 5322.
   Do not touch the callers.
```

The second prompt uses **8× fewer tokens** to get to the same fix because Claude doesn't have to hunt for the file or guess at scope.
