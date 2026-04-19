# Feature Add Prompt

```
Add <feature> to <module/path>.

What it does: <one sentence>
Public surface: <new functions, endpoints, props, or CLI flags>
Data shape: <input → output, or request/response schema>

Reference similar pattern: <existing file that already does something close>

Out of scope:
- <explicit non-goal 1>
- <explicit non-goal 2>

When done:
- Add tests next to the source file.
- Run <test command>.
- Update CLAUDE.md if a new convention was introduced.
```

## Example

```
Add rate limiting to src/api/login.ts.

What it does: 5 attempts per IP per 15 min; return 429 with Retry-After.
Public surface: no new exports — middleware added to the existing POST /login route.
Data shape: reads req.ip, stores counters in Redis at key `ratelimit:login:<ip>`.

Reference similar pattern: src/api/signup.ts already uses the rateLimiter() helper.

Out of scope:
- User-level rate limiting (we do IP-level only for now).
- Configurable window/limit (hardcode; we'll extract later).

When done:
- Add tests next to src/api/login.ts.
- Run `pnpm test src/api/login.test.ts`.
- Do not touch src/api/signup.ts.
```
