# Bug Fix Prompt

```
Bug in <file>:<line>, <function()>.

Current behavior: <what happens — one sentence>
Expected behavior: <what should happen — one sentence>
Reproduction: <minimal steps or input that triggers it>

Fix scope:
- Touch only <file> and its direct tests.
- Do not refactor surrounding code.
- Do not change public signatures.

When done:
- Run <test command for the affected file>.
- Show me the diff before committing.
```

## Example

```
Bug in src/auth/login.ts:87, validateEmail().

Current behavior: "foo@" is treated as valid.
Expected behavior: reject — RFC 5322 requires a TLD.
Reproduction: validateEmail("foo@") returns true.

Fix scope:
- Touch only src/auth/login.ts and src/auth/login.test.ts.
- Do not refactor surrounding code.
- Do not change the function signature.

When done:
- Run `pnpm test src/auth/login.test.ts`.
- Show me the diff before committing.
```
