# Project Memory

## Stack
- React 19 + TypeScript 5.9 (strict)
- Vite 7
- Tailwind CSS v4 (CSS-first config, `@theme` blocks — no `tailwind.config.js`)
- Vitest 3 + React Testing Library
- Node 24 LTS

## Conventions
- Function components only. No class components.
- One component per file. File name matches the default export.
- Tests live next to source: `Button.tsx` + `Button.test.tsx`.
- No default exports except for pages/routes — everything else is a named export.
- Use `cn()` helper from `src/lib/cn.ts` for conditional classes, not template strings.
- Imports ordered: React → third-party → `@/` aliases → relative.
- Prefer React 19's `use()` + Suspense over `useEffect` for data reads.

## Gotchas
<!-- fill in: non-obvious things that bite newcomers -->
- `src/api/client.ts` is a singleton; do not instantiate new clients.
- `useTheme()` must be inside `<ThemeProvider>` (mounted in `src/main.tsx`).
- React 19 removed `forwardRef` requirement — `ref` is now a regular prop.

## Useful Commands
- Dev: `pnpm dev`
- Test one file: `pnpm test src/path/to/file.test.tsx`
- Type check: `pnpm tsc --noEmit`
- Build: `pnpm build`

## Do Not
- Do not add new global state libraries. We use React Context + `useReducer`.
- Do not install UI kits; primitives live in `src/ui/`.
- Do not re-introduce `forwardRef` — pass `ref` as a prop.
