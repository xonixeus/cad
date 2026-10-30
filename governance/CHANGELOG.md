# CAD Change Log

Changes to the universal department (`cad`): charter, agent instructions, environment, setup guide and client template. Newest first. Each client's own changes are logged in that client's `governance/CHANGELOG.md`.

## v5.0 — 2026-10-30 — Universal department

The department now serves any number of clients, each with a private client repository, instead of one owner.

| Change | Files |
| --- | --- |
| Department and client data split into two repositories: public `cad` (this repo) and one private client repository per person | All |
| `TEAM.md` v5.0: "client" and "operator" defined; `cad:` / `client:` path prefixes; one-client-per-task rule; public-repo rule for proposals; resume-approval delegation is per client and optional | `TEAM.md` |
| Agent instructions generalized: owner-specific career paths, base resumes, target-company scopes and profile references now point to the client repository | `agents/*/AGENTS.md` |
| Agent instructions moved from `Agents/<Name (Role)>/` to `agents/<name>/` | `agents/` |
| Maestro pushes only to client repositories and proposes `cad` changes to the operator | `TEAM.md`, `agents/maestro/AGENTS.md`, `governance/ENVIRONMENT.md` |
| Client repository template added | `templates/client/` |
| Setup guide rewritten for adding a client | `docs/SETUP.md` |
| Licensed under CC BY 4.0 | `LICENSE`, `README.md` |

Earlier versions (v1.0–v4.0) were single-owner and are not part of this repository's history.
