# Explain Prompt

```
Explain <file, function, or flow> at <path>.

What I want to know:
- What does it do, in plain English?
- What calls it, and what does it call?
- What's the one thing I'd get wrong if I edited it blind?

What I don't need:
- Line-by-line walkthrough.
- A refactor suggestion.
- General background on the language/framework.

Format:
- 3–5 bullets, one sentence each.
- Link to file:line for every claim so I can jump in.
```

## Example

```
Explain src/queue/worker.ts.

What I want to know:
- What does it do?
- What triggers it?
- What's the one thing I'd get wrong if I edited it blind?

3–5 bullets. file:line links for every claim.
```
