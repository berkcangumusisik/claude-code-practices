<div align="center">

# Claude Code Cheatsheet

**Bookmark this. You'll use it every day.**

[← Back to README](README.md)

</div>

---

## Shortcuts

```
NAVIGATION & SESSION
  Ctrl+C          Cancel generation
  Ctrl+D          Exit
  Ctrl+R          Search history
  Esc + Esc       Rewind last response
  Ctrl+T          Toggle task list
  Ctrl+O          View transcript

MODES
  Shift+Tab       Cycle: default → acceptEdits → plan → ...
  Option+P        Switch model
  Option+T        Extended thinking on/off
  Option+O        Fast mode on/off

EDITING
  Ctrl+K          Delete to end of line
  Ctrl+U          Delete to start of line
  Alt+B / Alt+F   Move word by word
  Ctrl+G          Open in external editor

MULTILINE INPUT
  \ + Enter       All terminals
  Shift+Enter     iTerm2, WezTerm, Ghostty
  Option+Enter    macOS default
```

---

## Slash Commands

```
SESSION
  /clear          Clear history
  /compact [focus]  Compress context
  /cost           Token usage & cost
  /context        Context window status
  /rewind         Go back to checkpoint

CONFIG
  /init           Create CLAUDE.md
  /model          Switch model
  /config         Settings menu
  /mcp            MCP servers
  /hooks          View hooks
  /plan           Enter plan mode

MISC
  /vim            Vim mode toggle
  /fast           Fast mode toggle
  /btw [q]        Side question (not saved)
  !command        Run bash directly
```

---

## Token Optimization

```bash
# Between unrelated tasks
/clear

# Focused compression
/compact Keep only changed functions and test output

# Reduce thinking budget
MAX_THINKING_TOKENS=4000 claude

# Low effort for simple tasks
claude --effort low "Fix typo in README"

# Exclude noisy files
echo "node_modules/\ndist/\n*.log\ncoverage/" > .claudeignore
```

---

## Permission Modes

```
default       Read-only auto-approval
acceptEdits   Reads + edits + safe bash  ← daily driver
plan          Read-only, proposes changes
auto          Everything (trusted tasks only)
dontAsk       Pre-approved tools only (CI)
```

Switch: `Shift+Tab` or `claude --permission-mode <mode>`

---

## CLAUDE.md Quick Template

```markdown
## Commands
- Build: `bun run build`
- Test: `bun test`

## Rules
- Use bun, not npm
- No `any` types
- Use logger, not console.log

## Architecture
@docs/architecture.md
```

Locations:
- `./CLAUDE.md` — project (committed)
- `./CLAUDE.local.md` — personal (gitignored)
- `~/.claude/CLAUDE.md` — all projects

---

## Hook Quick Reference

```json
PostToolUse  → runs after tool succeeds (can't block)
PreToolUse   → runs before tool (exit 2 to block)
Notification → Claude waiting for input
PostCompact  → after context is compressed
SessionStart → on every session start
```

Exit codes: `0` = proceed · `2` = **block** · other = proceed + log error

---

## CLI Flags

```bash
claude -c                   # Continue last session
claude -r "name"            # Resume named session
claude -n "name"            # Name current session
claude -p "query"           # Non-interactive / pipe
claude -w branch-name       # Create git worktree
claude --effort low/medium/high/max
claude --model sonnet/opus/haiku
claude --permission-mode plan
claude --add-dir ../shared
cat file.txt | claude -p "Summarize this"
```

---

## Skills (copy to `.claude/skills/`)

```
/fix-issue 123    → Read issue → implement fix → commit
/pr-review        → Full code review with findings report
/test-runner      → Run tests → analyze failures → fix
/commit           → Staged diff → Conventional Commit message
/debug-helper err → Root cause analysis → fix
```

---

<div align="center">
<sub>Full docs: <a href="en/README.md">English</a> · <a href="tr/README.md">Türkçe</a></sub>
</div>
