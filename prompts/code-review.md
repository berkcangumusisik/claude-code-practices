# Code Review Prompt

```
Review the diff against <base branch>.

Focus on:
- Correctness bugs — off-by-one, null checks, race conditions
- Security — input validation, auth boundaries, secret handling
- Performance — N+1 queries, unbounded loops, synchronous I/O on the hot path
- Test gaps — behavior changes that aren't covered

Skip:
- Style / formatting — the linter owns that
- Naming debates — unless a name is actively misleading
- Architectural rewrites — note them only if the PR makes them harder later

Output shape:
- Group findings by severity: blocker / should-fix / nit
- For each finding: file:line, one-sentence problem, one-sentence fix
- End with a one-paragraph overall verdict
```

## Example

```
Review the diff against main.

Focus on: correctness, security, performance, test gaps.
Skip: style, naming, architecture suggestions.

Output shape:
- blocker / should-fix / nit
- file:line — problem — fix
- one-paragraph verdict at the end
```
