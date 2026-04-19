# Project Memory

## Stack
- Next.js 16 (App Router, Turbopack) + React 19 + TypeScript 5.9 (strict)
- React Server Components by default
- Tailwind CSS v4 + shadcn/ui
- Drizzle ORM + Postgres
- Playwright (e2e) + Vitest 3 (unit)
- Node 24 LTS

## Conventions
- Default to Server Components. Add `"use client"` only when you need state, effects, or browser APIs.
- Server Actions live next to the component that calls them: `actions.ts`.
- DB access only inside server code (server components, actions, route handlers). Never in `"use client"` files.
- UI primitives from `components/ui/` (shadcn). Feature components in `components/<feature>/`.
- Never import from `app/` into `components/` — the dependency points the other way.
- Env vars: read via `env.ts` (zod-validated). Do not use `process.env` directly.
- Ref is a prop in React 19 — no `forwardRef` in new code.

## Gotchas
<!-- fill in -->
- `middleware.ts` runs on every request including static assets — keep it cheap.
- Dynamic route `params` and `searchParams` are `Promise`s — `await` them.
- `fetch()` in RSC is not cached by default — pass `{ cache: "force-cache" }` to cache.
- `cookies()`, `headers()`, `draftMode()` are async — always `await`.

## Useful Commands
- Dev: `pnpm dev` (Turbopack)
- Type check: `pnpm tsc --noEmit`
- Unit test one file: `pnpm vitest run path/to/file.test.ts`
- E2E: `pnpm test:e2e`
- DB: `pnpm db:push`, `pnpm db:studio`

## Do Not
- Do not fetch data in Client Components. Pass as props from a Server Component.
- Do not add a global state library. Server state in RSC, URL state in search params, local state in `useState`.
- Do not commit `.env.local`.
