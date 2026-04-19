# Refactor Prompt

```
Refactor <file or directory>.

Goal: <what the shape should become — one sentence>
Why: <the concrete pain — duplicated logic, testability, readability>

Constraints:
- No behavior change. Existing tests must pass unchanged.
- No public API changes. Callers must not need edits.
- Keep commits small — one logical step per commit.

Out of scope:
- <related cleanup you don't want right now>

When done:
- Run the full test suite.
- Show me the diff. Do not commit until I say go.
```

## Example

```
Refactor src/checkout/ — three files duplicate the same price-calculation logic.

Goal: extract a single pricePipeline() in src/checkout/pricing.ts.
Why: we had two bugs last month that only got fixed in one of the three copies.

Constraints:
- No behavior change. Existing tests in src/checkout/*.test.ts must pass unchanged.
- pricePipeline() stays internal to src/checkout/.
- Do not touch the tax module — it's being rewritten separately.

When done:
- Run `pnpm test src/checkout`.
- Show me the diff. Do not commit until I say go.
```
