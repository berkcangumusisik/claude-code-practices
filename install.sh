#!/usr/bin/env bash
#
# claude-code-practices installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/berkcangumusisik/claude-code-practices/main/install.sh | bash
#   curl -fsSL ... | bash -s -- --skills cost-audit,commit,pr-review
#   curl -fsSL ... | bash -s -- --all
#
set -euo pipefail

REPO="berkcangumusisik/claude-code-practices"
RAW="https://raw.githubusercontent.com/${REPO}/main"
ARCHIVE="https://github.com/${REPO}/archive/refs/heads/main.tar.gz"

MODE="core"
SELECTED=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all) MODE="all"; shift ;;
    --skills) MODE="selected"; SELECTED="$2"; shift 2 ;;
    --help|-h)
      cat <<EOF
claude-code-practices installer

Options:
  (no args)              Install core set: cost-audit, commit, pr-review, test-generate, security-audit
  --all                  Install every skill in the repo
  --skills a,b,c         Install only the named skills
  -h, --help             Show this help

Also installs, if missing:
  .claudeignore          Default ignore list
  CLAUDE.md              Minimal project memory scaffold
EOF
      exit 0 ;;
    *) echo "Unknown arg: $1" >&2; exit 1 ;;
  esac
done

if [[ ! -d .git ]] && [[ ! -f package.json ]] && [[ ! -f pyproject.toml ]] && [[ ! -f Cargo.toml ]] && [[ ! -f go.mod ]]; then
  echo "Warning: this does not look like a project root (no .git, package.json, pyproject.toml, Cargo.toml, or go.mod)."
  read -r -p "Continue installing into $(pwd)? [y/N] " ans
  [[ "$ans" == "y" || "$ans" == "Y" ]] || exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading claude-code-practices..."
curl -fsSL "$ARCHIVE" | tar -xz -C "$TMP"
SRC="$TMP/claude-code-practices-main"

mkdir -p .claude/skills

copy_skill() {
  local name="$1"
  if [[ -d "$SRC/skills/$name" ]]; then
    cp -R "$SRC/skills/$name" .claude/skills/
    echo "  + $name"
  else
    echo "  ! skill not found: $name" >&2
  fi
}

case "$MODE" in
  core)
    echo "Installing core skills..."
    for s in cost-audit commit pr-review test-generate security-audit; do
      copy_skill "$s"
    done
    ;;
  all)
    echo "Installing all skills..."
    find "$SRC/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | while read -r s; do
      copy_skill "$s"
    done
    ;;
  selected)
    echo "Installing selected skills..."
    IFS=',' read -ra names <<< "$SELECTED"
    for s in "${names[@]}"; do
      copy_skill "$(echo "$s" | xargs)"
    done
    ;;
esac

if [[ ! -f .claudeignore ]]; then
  cat > .claudeignore <<'EOF'
node_modules/
dist/
build/
.next/
coverage/
*.log
*.lock
*.min.js
*.min.css
.venv/
__pycache__/
target/
EOF
  echo "Created .claudeignore"
else
  echo "Skipped .claudeignore (already exists)"
fi

if [[ ! -f CLAUDE.md ]]; then
  cat > CLAUDE.md <<'EOF'
# Project Memory

<!-- Short, factual notes Claude should load every session. Keep under ~100 lines. -->

## Stack
<!-- e.g. Next.js 15, TypeScript, Postgres, Tailwind -->

## Conventions
<!-- e.g. function components only, tests next to source, no default exports -->

## Gotchas
<!-- e.g. `db.ts` uses a singleton; never construct a new Pool -->

## Useful Commands
<!-- e.g. `pnpm dev`, `pnpm test path/to/file`, `pnpm db:migrate` -->
EOF
  echo "Created CLAUDE.md"
else
  echo "Skipped CLAUDE.md (already exists)"
fi

echo ""
echo "Done. Try one:"
echo "  claude"
echo "  > /cost-audit"
