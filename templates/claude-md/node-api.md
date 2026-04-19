# Project Memory

## Stack
- Node.js 24 LTS + TypeScript 5.9 (strict, ESM)
- Fastify 5 (HTTP)
- Prisma 6 + Postgres
- Zod 4 for validation
- Vitest 3 for tests

## Conventions
- Layered: `routes/` → `services/` → `repositories/`. Routes are thin.
- Every request body/query/param goes through a Zod schema at the route boundary.
- No shared mutable state across requests. If you need state, it lives in a service class.
- Errors thrown in services; translated to HTTP in a central error handler.
- Logger from Fastify's `req.log` — never `console.log`.

## Gotchas
<!-- fill in -->
- Prisma client is a singleton exported from `src/db.ts`. Do not `new PrismaClient()` anywhere else.
- `pnpm install` must be run after schema changes; `postinstall` regenerates the client.
- In ESM, relative imports need the `.js` extension even in `.ts` sources.

## Useful Commands
- Dev: `pnpm dev`
- Test one file: `pnpm vitest run src/path/to/file.test.ts`
- Type check: `pnpm tsc --noEmit`
- Migrate: `pnpm prisma migrate dev`
- Studio: `pnpm prisma studio`

## Do Not
- Do not catch errors in routes unless you're adding context and rethrowing.
- Do not put business logic in Prisma middleware.
- Do not use `any`. If the type is genuinely unknown, use `unknown` and narrow.
