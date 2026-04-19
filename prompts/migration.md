# Migration Prompt

```
Migrate <dependency> from <old version> to <new version>.

Scope:
- <list of files or directories that actually use it>
- Codemod first where possible, manual edits after.

Strategy:
1. Read the release notes / migration guide (link: <url>).
2. List every breaking change that touches our code. Skip the ones that don't.
3. Apply changes one breaking change at a time — separate commits.
4. Run tests after each commit.

Stop and ask me if:
- A breaking change requires a product decision.
- A deprecation has no drop-in replacement.
- Tests fail for a reason that's not a migration issue.

Do not:
- Upgrade unrelated dependencies.
- "Modernize" code style while you're in there.
```

## Example

```
Migrate Next.js from 15 to 16.

Scope: app/, middleware.ts, next.config.ts.

Strategy:
1. Read https://nextjs.org/docs/app/guides/upgrading/version-16
2. List breaking changes affecting our code.
3. Commit by breaking change. Run `pnpm build && pnpm test` after each.

Stop and ask me if a change requires product input.
Do not touch non-Next deps.
```
