# Claude Code - Comprehensive English Guide

[← Home](../README.md) · [Türkçe](../tr/README.md) · [Skills](../skills/README.md)

---

## Table of Contents

1. [Keyboard Shortcuts](#1-keyboard-shortcuts)
2. [Slash Commands](#2-slash-commands)
3. [Token Optimization](#3-token-optimization)
4. [CLAUDE.md](#4-claudemd)
5. [Settings.json](#5-settingsjson)
6. [Hooks System](#6-hooks-system)
7. [Skills](#7-skills)
8. [MCP Servers](#8-mcp-servers)
9. [Permission Modes](#9-permission-modes)
10. [Subagents](#10-subagents)
11. [CLI Flags](#11-cli-flags)
12. [Environment Variables](#12-environment-variables)
13. [Best Practices](#13-best-practices)

---

## 1. Keyboard Shortcuts

### General Controls

| Shortcut | Action |
|---|---|
| `Ctrl+C` | Cancel current input or generation |
| `Ctrl+D` | Exit Claude Code session |
| `Ctrl+L` | Clear prompt input (keeps history) |
| `Ctrl+R` | Reverse search command history |
| `Ctrl+T` | Toggle task list |
| `Ctrl+O` | Toggle transcript viewer |
| `Ctrl+G` / `Ctrl+X Ctrl+E` | Open prompt in external editor |
| `Ctrl+V` / `Cmd+V` | Paste image from clipboard |
| `Esc + Esc` | Rewind or summarize conversation |
| `Shift+Tab` / `Alt+M` | Cycle permission modes |
| `Option+P` | Switch model |
| `Option+T` | Toggle extended thinking |
| `Option+O` | Toggle fast mode |
| `↑ / ↓` | Navigate command history |
| `← / →` | Cycle through dialog tabs |
| `Ctrl+X Ctrl+K` | Kill all background agents |

### Text Editing

| Shortcut | Action |
|---|---|
| `Ctrl+K` | Delete to end of line |
| `Ctrl+U` | Delete from cursor to line start |
| `Ctrl+Y` | Paste deleted text |
| `Alt+B` | Move cursor back one word |
| `Alt+F` | Move cursor forward one word |

### Multiline Input

| Method | Terminal |
|---|---|
| `\` + `Enter` | All terminals |
| `Shift+Enter` | iTerm2, WezTerm, Ghostty, Kitty |
| `Option+Enter` | macOS default |
| `Ctrl+J` | Any terminal |

### Custom Keybindings

```bash
# Open keybindings config
/keybindings
```

```json
// ~/.claude/keybindings.json
{
  "bindings": [
    { "context": "Chat", "key": "ctrl+s", "action": "submit" },
    { "context": "Global", "key": "ctrl+k ctrl+s", "action": "clear" }
  ]
}
```

> `Ctrl+C`, `Ctrl+D`, `Ctrl+M` cannot be rebound.

---

## 2. Slash Commands

### Session Management

| Command | Description |
|---|---|
| `/clear` | Clear conversation history |
| `/compact` | Compress conversation context |
| `/compact [focus]` | Focused compact: `/compact Keep only changed functions and test output` |
| `/rename [name]` | Rename session |
| `/resume` | Resume previous session |
| `/rewind` | Restore to previous checkpoint |
| `/memory` | View/edit memory files |
| `/cost` | Show token usage and costs |
| `/status` | Show session status |
| `/context` | Display context window usage |

### Configuration

| Command | Description |
|---|---|
| `/config` | Open interactive settings menu |
| `/model` | Switch models |
| `/effort` | Set effort level (low / medium / high / max) |
| `/init` | Initialize CLAUDE.md for project |
| `/terminal-setup` | Configure Shift+Enter for multiline |
| `/mcp` | Configure MCP servers |
| `/hooks` | Browse configured hooks |
| `/agents` | List subagents |
| `/plugins` | Manage plugins |
| `/keybindings` | Customize keyboard shortcuts |
| `/permission-mode` | Set permission mode |

### Other Commands

| Command | Description |
|---|---|
| `/help` | Show help information |
| `/release-notes` | Display changelog |
| `/doctor` | Run diagnostics |
| `/vim` | Enable/disable vim mode |
| `/fast` | Toggle fast mode |
| `/plan` | Enter plan mode |
| `/btw [question]` | Side question without saving to history |
| `!command` | Execute bash directly |

---

## 3. Token Optimization

### Context Reduction Strategies

**1. `/clear` between tasks**
Clear history when switching to unrelated work. Prevents stale context from interfering.

**2. Focused `/compact`**
```
/compact Keep only changed functions and test output
```

**3. Write specific prompts**
```
# Bad - triggers broad scanning
"Improve this project"

# Good - focused work
"Add email validation to login() in src/auth/login.ts:142"
```

**4. Reduce extended thinking budget**
```bash
MAX_THINKING_TOKENS=4000 claude
```

**5. Subagent isolation**
Delegate heavy operations (log analysis, large file scanning) to subagents. Get only summaries back.

**6. Keep CLAUDE.md under 200 lines**
Move detailed workflows to skills - skills only load when invoked.

**7. Disable unused MCP servers**
```bash
/mcp  # Open management panel
```

### .claudeignore

```gitignore
# .claudeignore
node_modules/
dist/
build/
*.log
.env
coverage/
*.lock
*.min.js
```

### Model Selection Guide

| Model | When to Use |
|---|---|
| `claude-haiku-4-5` | Simple subagent tasks, repetitive operations |
| `claude-sonnet-4-6` | Most coding tasks - default choice |
| `claude-opus-4-6` | Complex architectural decisions, hard algorithms |

---

## 4. CLAUDE.md

### File Locations and Scope

| Location | Scope | In Git? |
|---|---|---|
| `~/.claude/CLAUDE.md` | All projects (user) | No |
| `./CLAUDE.md` | Project root | Yes |
| `./.claude/CLAUDE.md` | Project (alternative) | Yes |
| `./CLAUDE.local.md` | Personal local preferences | No |
| `/Library/Application Support/ClaudeCode/CLAUDE.md` (macOS) | Organization-wide | Yes (admin) |

### Precedence Order

```
Managed Policy
    └── Project CLAUDE.md
            └── User CLAUDE.md
                    └── CLAUDE.local.md
                            └── Subdirectory CLAUDE.md (loaded on demand)
```

### Import Syntax

```markdown
@README.md
@docs/architecture.md
@~/.claude/shared-rules.md
```

- Shows approval dialog on first external use
- Maximum 5 levels of recursion
- Expanded at session start

### Example CLAUDE.md

```markdown
# Project Name

## Commands
- Build: `bun run build`
- Test: `bun test`
- Lint: `bun run lint`
- Type check: `bun run typecheck`

## Code Standards
- 2-space indentation
- TypeScript strict mode
- Use project logger instead of `console.log`: `import { logger } from '@/lib/logger'`
- Use async/await over Promise chains

## Architecture
@docs/architecture.md

## Prohibitions
- Never use `npm`, always use `bun`
- Never use `any` type
- Never leave `only` in test files
```

### Modular Structure

```
.claude/
├── CLAUDE.md                  # Main instructions (use @imports)
├── rules/
│   ├── code-style.md
│   ├── testing.md
│   ├── api-design.md
│   └── frontend/
│       └── react.md
```

### Path-Scoped Rules

```markdown
---
paths:
  - "src/api/**/*.ts"
---

# API Rules
- All endpoints must include Zod input validation
- Include rate limiting middleware
```

---

## 5. Settings.json

### File Locations

| Location | Scope | In Git? |
|---|---|---|
| `~/.claude/settings.json` | Global user | No |
| `.claude/settings.json` | Project | Yes |
| `.claude/settings.local.json` | Local personal | No |

**Precedence:** Managed > Project > User > Local

### All Settings Keys

```json
{
  "model": "claude-sonnet-4-6",
  "modelAliases": { "fast": "claude-haiku-4-5" },
  "effort": "medium",
  "thinkingBudget": 8000,
  "disableThinking": false,

  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Bash(git *)",
      "Bash(bun *)",
      "Edit(src/**/*.ts)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl * | bash)",
      "Bash(sudo *)"
    ]
  },

  "autoMemoryEnabled": true,
  "ignoreGitignore": false,

  "env": {
    "NODE_ENV": "development"
  },

  "hooks": {}
}
```

---

## 6. Hooks System

### Available Hook Events

| Event | When | Can Block? |
|---|---|---|
| `SessionStart` | Session begins | No |
| `UserPromptSubmit` | Before prompt is processed | No |
| `PreToolUse` | Before tool executes | **Yes** |
| `PostToolUse` | After tool succeeds | No |
| `PostToolUseFailure` | After tool fails | No |
| `PermissionRequest` | Permission dialog appears | **Yes** |
| `Notification` | Claude awaiting input | No |
| `Stop` | Claude finishes responding | No |
| `SubagentStop` | Subagent finishes | No |
| `PreCompact` | Before compaction | No |
| `PostCompact` | After compaction | No |
| `SessionEnd` | Session terminates | No |

### Hook Structure

```json
// .claude/settings.json
{
  "hooks": {
    "EventName": [
      {
        "matcher": "ToolName|OtherTool",
        "hooks": [
          {
            "type": "command",
            "command": "your command here",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

### Exit Codes

| Code | Behavior |
|---|---|
| `0` | Action proceeds; stdout added to context |
| `2` | **Action blocked;** stderr becomes feedback to Claude |
| Other | Action proceeds; error logged |

### Ready-to-Use Hook Recipes

#### Notification - Claude Is Waiting for You

```json
{
  "hooks": {
    "Notification": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "osascript -e 'display notification \"Claude needs your input\" with title \"Claude Code\"'"
      }]
    }]
  }
}
```

#### Auto-format with Prettier

```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Edit|Write",
      "hooks": [{
        "type": "command",
        "command": "jq -r '.tool_input.file_path // empty' | xargs -I{} npx prettier --write {} 2>/dev/null || true"
      }]
    }]
  }
}
```

#### Block Protected Files

```bash
#!/bin/bash
# ~/.claude/hooks/protect-files.sh
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
if [[ "$FILE" == *".env"* ]] || [[ "$FILE" == *"secrets"* ]]; then
  echo "Protected file cannot be modified: $FILE" >&2
  exit 2
fi
exit 0
```

#### Re-inject Context After Compact

```json
{
  "hooks": {
    "PostCompact": [{
      "hooks": [{
        "type": "command",
        "command": "cat .claude/context-reminder.md"
      }]
    }]
  }
}
```

#### Filter Test Output (Token Savings)

```bash
#!/bin/bash
# Show only failing tests
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
if [[ "$COMMAND" == *"test"* ]]; then
  eval "$COMMAND" 2>&1 | grep -E "FAIL|Error|✗|×|failed" || echo "All tests passed ✓"
  exit 0
fi
echo "$INPUT"
```

---

## 7. Skills

Skills are reusable workflows invokable as `/command-name`.

### Skill Locations

| Location | Scope | Shared? |
|---|---|---|
| `~/.claude/skills/<name>/SKILL.md` | All projects | No |
| `.claude/skills/<name>/SKILL.md` | Project | Yes (git) |

### SKILL.md Frontmatter

```yaml
---
name: skill-name
description: What it does - shown in menu
argument-hint: <arg1> [arg2]
user-invocable: true
allowed-tools: Bash(git *) Edit Read
model: claude-sonnet-4-6
effort: medium
context: fork
---
```

### Placeholders

| Placeholder | Description |
|---|---|
| `$ARGUMENTS` | All arguments |
| `$ARGUMENTS[0]` or `$1` | First argument |
| `${CLAUDE_SESSION_ID}` | Current session ID |
| `${CLAUDE_SKILL_DIR}` | Skill directory |

### Dynamic Context Injection

```markdown
---
name: pr-review
---

## PR Status
- Diff: !`gh pr diff`
- Comments: !`gh pr view --comments`
- CI: !`gh pr checks`

Review this PR and list all issues...
```

→ Ready-made skill examples: [../skills/](../skills/)

---

## 8. MCP Servers

### Adding Servers

```bash
# Via CLI
claude mcp add stdio /path/to/server
claude mcp add sse https://api.example.com/mcp

# Manage
claude mcp list
claude mcp remove server-name
```

### Configuration via Settings

```json
{
  "mcpServers": {
    "github": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "$GH_TOKEN" }
    },
    "filesystem": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/project/path"]
    }
  }
}
```

### Permission Rules

```json
{
  "permissions": {
    "allow": ["mcp__github__*", "mcp__filesystem__read_file"],
    "deny": ["mcp__github__delete_repository"]
  }
}
```

**Tool naming:** `mcp__<server>__<tool>` - e.g., `mcp__github__search_repositories`

---

## 9. Permission Modes

| Mode | Auto-approves | Use Case |
|---|---|---|
| `default` | Reads only | Sensitive work, initial exploration |
| `acceptEdits` | Reads + edits + safe bash | Code iteration |
| `plan` | Reads only (proposes changes) | Review before implementation |
| `auto` | Everything + classifier checks | Long, trusted tasks |
| `dontAsk` | Pre-approved only | CI pipeline |
| `bypassPermissions` | Everything | Isolated VM/container |

### Switching Modes

```bash
# At startup
claude --permission-mode plan

# During session
Shift+Tab
```

### Protected Paths (Never Auto-approved)

```
.git/  .vscode/  .idea/  .gitconfig  .gitmodules
.bashrc  .zshrc  .profile  .env  .mcp.json
```

### Custom Permission Rules

```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Bash(git *)",
      "Bash(bun *)",
      "Bash(npx *)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl * | bash)",
      "Bash(sudo *)"
    ]
  }
}
```

---

## 10. Subagents

### Built-in Types

| Type | Description |
|---|---|
| `Explore` | Read-only exploration and research |
| `Plan` | Planning and analysis |
| `general-purpose` | General purpose tasks |

### Custom Subagent

```yaml
# .claude/agents/code-reviewer.md
---
name: code-reviewer
description: Code quality and security review
model: claude-sonnet-4-6
tools: Read Grep Bash(npm test)
permissionMode: plan
---

You are a code reviewer. Focus on:
- Security vulnerabilities
- Missing test coverage
- Performance issues
- Code duplication
```

### Parallel Subagents

```bash
# Experimental agent teams
CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude

# Parallel worktree work
claude -w feature-auth "Implement auth system"
claude -w feature-api  "Write REST API endpoints"
```

---

## 11. CLI Flags

### Session Management

```bash
claude                              # Interactive session
claude "initial prompt"             # Start with prompt
claude -p "query"                   # Non-interactive (print mode)
claude -c                           # Continue last session
claude -r "session-name"            # Resume named session
claude -n "my-name"                 # Name the session
```

### Model & Effort

```bash
claude --model sonnet
claude --model opus
claude --model claude-haiku-4-5
claude --effort high
claude --effort low "Fix typo"
```

### File Access

```bash
claude --add-dir ../apps ../lib
claude --allowedTools "Bash(git *)" "Edit(*.ts)"
claude --disallowedTools "Bash(rm *)"
```

### Input/Output

```bash
claude -p --output-format json "query"
cat logs.txt | claude -p "Find and summarize errors"
claude --system-prompt "You are a security expert"
```

### Worktree

```bash
claude -w feature-branch
claude -w feature --tmux
```

---

## 12. Environment Variables

| Variable | Description | Example |
|---|---|---|
| `MAX_THINKING_TOKENS` | Thinking budget | `4000` |
| `CLAUDE_CODE_DEBUG_LOGS_DIR` | Debug log directory | `/tmp/claude-logs` |
| `CLAUDE_CODE_DISABLE_AUTO_MEMORY` | Disable auto memory | `1` |
| `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` | Enable agent teams | `1` |
| `CLAUDE_CODE_TASK_LIST_ID` | Named task list | `project-name` |
| `CLAUDE_SESSION_ID` | Override session ID | UUID |
| `CLAUDE_ENV_FILE` | Hook environment file | `/tmp/claude.env` |
| `CLAUDE_CODE_SIMPLE` | Minimal mode | `1` |

---

## 13. Best Practices

### Effective Prompting

```
✅ "Add RFC 5322 validation to validateEmail() in src/auth/login.ts:87"
✅ "Find all React components missing prop-types in src/components/ and add them"
✅ "Update dependencies in package.json, list any breaking changes"

❌ "Fix the code"
❌ "Make it better"
❌ "Check what's wrong"
```

### Daily Workflow

```bash
# 1. Starting a task
claude -n "auth-refactor" --permission-mode acceptEdits

# 2. Before complex changes
/plan

# 3. During work - save tokens
/compact Keep only changes in the auth module

# 4. End of task
/cost    # Review spending
/clear   # Clean up for next task
```

### CLAUDE.md Checklist

- [ ] Build, test, lint commands
- [ ] Framework/library version constraints
- [ ] Prohibited tools (e.g., npm → bun)
- [ ] File/folder naming conventions
- [ ] Team-specific conventions
- [ ] Under 200 lines - pull extras with @import

### Automation with Hooks

```
On save  → Prettier (PostToolUse)
On edit  → Lint check (PostToolUse)
On start → Load context (SessionStart)
On compact → Re-inject key rules (PostCompact)
On wait  → Send notification (Notification)
```

---

[← Home](../README.md) · [Türkçe](../tr/README.md) · [Skills →](../skills/README.md)
