# Test Add Prompt

```
Add tests for <file or function>.

Coverage target:
- Happy path (1 test)
- Edge cases: <list the ones that matter for this code>
- Error paths: <list the ones that matter>

Out of scope:
- Implementation details — test behavior, not internals.
- Mocks for <X> — <X> is already covered by its own tests.

Style:
- Match the existing test style in <neighbor test file>.
- One behavior per test. Descriptive names.

When done:
- Run only the new tests first: <command>
- Then run the file's whole suite.
- Show me any tests you skipped and why.
```

## Example

```
Add tests for src/billing/invoice.ts → calculateTotal().

Coverage target:
- Happy path: line items + tax + discount
- Edge cases: empty line items, zero tax, discount > subtotal
- Error paths: negative quantity throws, unknown currency throws

Out of scope:
- DB persistence — calculateTotal is pure.
- Currency conversion — owned by src/billing/fx.ts.

Style:
- Match src/billing/discount.test.ts.

When done:
- Run `pnpm vitest run src/billing/invoice.test.ts`.
```
