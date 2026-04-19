# CLAUDE.md Gallery

Framework-ready `CLAUDE.md` templates. Drop one into your project root, edit the `<!-- fill in -->` parts, and you're done.

| Framework | File |
|---|---|
| React (Vite + TS) | [react.md](react.md) |
| Next.js 15 (App Router) | [nextjs.md](nextjs.md) |
| Django | [django.md](django.md) |
| Go | [go.md](go.md) |
| Rust | [rust.md](rust.md) |
| Node API (Express/Fastify) | [node-api.md](node-api.md) |

## How to use

```bash
# Pick one and copy to your project root
curl -fsSL https://raw.githubusercontent.com/berkcangumusisik/claude-code-practices/main/templates/claude-md/nextjs.md -o CLAUDE.md
```

## Why these are short

A good `CLAUDE.md` is under ~100 lines. Anything bigger gets skimmed and wastes tokens every session. These templates tell Claude what it **cannot infer from the code** — conventions, gotchas, commands — not what the repo already shows.
