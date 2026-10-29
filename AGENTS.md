# AGENTS.md

## Working agreement

- Inspect relevant files before proposing changes.
- Do not modify, create, delete, rename, or format files without explicit approval.
- First present proposed changes as a unified diff.
- Wait for explicit approval before applying the patch.
- A request to fix, update, or implement something is not itself approval to edit files.

## Communication

- Lead with the outcome.
- Be as concise as possible; I don't have time to read your long messages. I prefer short, on-point explanations over verbose stories.
- State assumptions when requirements are ambiguous.
- When asked for feedback on something, do not give me a long list of things that are done right. Only list all the things that need some improvements unless asked otherwise.

## Code changes

- Preserve existing conventions.
- Prefer small, focused changes.
- Do not introduce dependencies without approval.
- Do not add comments to my code unless explicitly asked for it.
- Avoid verbose comments, and do not use comments if the name of the member is self-explanatory.

## Verification

- Suggest appropriate checks alongside the proposed diff.
- Run checks only after the change has been approved and applied.
