---
name: client-repo-maintenance
description: Maestro's procedure for changing the client repository safely — checkout, rebase, small commits, pushing to main, ledger and changelog rules — and for proposing changes to the public cad repository without exposing client data. Use for any commit to a client repository or any "Proposal for cad".
---

# Client Repository Maintenance

## When to use

- Maestro: any change to the client repository (`client:CLIENT.md`, `knowledge/`, `governance/`, `operations/`, `personality_profile/`, `deliverables/`).
- Maestro (and any agent drafting one for Maestro): a proposal to change `cad`.

Only Maestro pushes, and only to the client repository linked to the current project (`cad:governance/ENVIRONMENT.md`).

## Making a change

1. **Check out** the client repository: `multica repo checkout <client repo URL from .multica/project/resources.json>`. Confirm `CLIENT.md` names the client of this project.
2. **Start from the latest main:** `git fetch origin && git rebase origin/main`.
3. **Edit** only what the decision or task requires. Keep the existing structure and formatting.
4. **Ledger rules** (`knowledge/CLAIMS_LEDGER.md`): new IDs for new claims; never reuse or renumber an ID; mark replaced rows `Superseded` with a pointer to the replacement; record source and confirmation date on every row you add or change.
5. **Log** every change to `knowledge/` or `governance/` in `governance/CHANGELOG.md` (date, change, files, issue). Record client decisions in `governance/DECISIONS.md`.
6. **Commit** small, focused changes with a clear message naming the issue: `<area>: <what changed> (<ISSUE-ID>)`.
7. **Push:** `git push origin HEAD:main` (agent checkouts start on a task branch). If it is rejected because main moved, `git fetch origin && git rebase origin/main` and push once more. If the rebase conflicts, `git rebase --abort` and report what conflicted.
8. **Report** on the issue: files changed, a one-line summary, and the commit link.

Never force-push, rewrite history, delete branches, change repository settings, or commit secrets. Never print or log credentials such as `GH_TOKEN`.

## Proposing a change to `cad`

`cad` is public and only the operator changes it. When a charter rule, agent instruction, skill or template should change for **every** client:

1. Confirm it is general: it would help any client, not just this one. Client-specific needs go in the client repository instead.
2. Open a Multica issue titled `Proposal for cad: <short description>`, using `templates/cad-proposal.md`.
3. **Write it in general terms.** No client names, contact details, career facts, profile content, employers, documents or issue links that reveal them. Describe the situation abstractly ("a client whose target roles require…").
4. Assign it to the operator (`client:CLIENT.md`).

## Stop and ask

- `CLIENT.md` does not match the project's client, or the project links no (or more than one) client repository.
- A change would need a fact the client has not confirmed.
- A push fails for any reason other than main having moved.
