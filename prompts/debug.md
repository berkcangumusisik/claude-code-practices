# Debug Prompt

```
Something is broken. I don't know why yet.

Symptom: <what I see — exact error message or wrong output>
When it started: <commit, deploy, or "always">
What I already tried: <1-3 things you ruled out — saves Claude from repeating them>

Reproduction: <steps or command>

Ground rules:
- Form hypotheses before making changes. List the top 3.
- Investigate the highest-probability one first.
- No speculative fixes — find the cause, then fix.
- If you need to add logging or a test to prove the hypothesis, do that first.

When you find the cause:
- Tell me what it is before you write the fix.
- Then propose the minimal fix.
```

## Why "what I already tried" matters

Without it, Claude will cheerfully suggest the three things you already ruled out, burning 5–10k tokens. One line saves a lot.
