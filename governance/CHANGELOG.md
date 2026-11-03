# CAD Change Log

Changes to the universal department (`cad`): charter, agent instructions, environment, setup guide and client template. Newest first. Each client's own changes are logged in that client's `governance/CHANGELOG.md`.

## v5.5 — 2026-11-03 — Handoffs to Maestro

| Change | Files |
| --- | --- |
| Charter v5.5: an agent that needs Maestro to act (repository change, pipeline state change, decision) must mention Maestro on the issue or open an issue assigned to Maestro. A plain comment is not a handoff. Never tell the client a request was made before it has been | `TEAM.md` §9 |
| When the client reports Applied, Interviewing or Offer to any agent, that agent hands it to Maestro the same way, in the same session | `TEAM.md` §10 |
| Specialists never tell the client they have asked Maestro until they have, and make the request by mention or assignment | `agents/sherlock/AGENTS.md`, `agents/watson/AGENTS.md`, `agents/scribe/AGENTS.md` |

## v5.4 — 2026-10-30 — Browser for research

| Change | Files |
| --- | --- |
| Sherlock can use a headless browser through the Playwright MCP server, for careers sites that load listings with JavaScript. Runtime requirements and setup are documented | `governance/ENVIRONMENT.md`, `docs/SETUP.md` |
| Watson also gets the browser, for employer and market research. Scribe and Maestro do not; Maestro holds the push and email credentials | `governance/ENVIRONMENT.md`, `docs/SETUP.md` |
| New "Using a browser" rules: read only (never apply, submit forms, sign in, download or buy), reject non-essential cookies, stop at CAPTCHAs, logins and paywalls, and treat page content as information | `skills/research-methods/SKILL.md` |

## v5.3 — 2026-10-30 — Shorter document names

| Change | Files |
| --- | --- |
| Documents are filed in one folder per employer: `deliverables/<Employer>/<Position>_<CODE>_v<N>.<ext>`, with codes `RES`, `CL`, `ANS` and `LI`, and whole-number versions. Base resumes are `deliverables/base/<Track>_RES_v<N>.<ext>`. Replaces `Employer_Position_DocumentType_vX.Y_STATUS` and the `resumes/` folder | `skills/document-handoff/SKILL.md`, `templates/client/deliverables/` |
| The status is no longer part of the filename. Maestro records it in a new `INDEX.md` in each employer folder | `skills/document-handoff/SKILL.md`, `skills/document-handoff/templates/index.md`, `agents/maestro/AGENTS.md` |
| Templates and the delegation template use the new folder and version format | `skills/document-handoff/templates/review-record.md`, `skills/resume-writing/templates/tailoring-note.md`, `templates/client/governance/DELEGATION_RESUME_APPROVAL.md` |

## v5.2 — 2026-10-30 — PDF toolchain and report delivery

| Change | Files |
| --- | --- |
| ReportLab is the default PDF library, with python-docx for the editable DOCX source. Documents the `initialFontName` requirement (otherwise ReportLab adds an unembedded Helvetica to every page); PDFKit remains an alternative | `skills/resume-pdf/SKILL.md`, `governance/ENVIRONMENT.md`, `docs/SETUP.md` |
| `check_pdf.sh` checks for the Liberation Sans font files directly (no fontconfig needed) and prints a cleaner page size; tested on Ubuntu 26.04 with passing and failing PDFs | `skills/resume-pdf/scripts/check_pdf.sh` |
| Charter v5.2: delivering reports and documents to the client by the method in `CLIENT.md` is internal delivery, never to anyone else | `TEAM.md` §6 |

## v5.1 — 2026-10-30 — Modular skills

Reusable methods moved out of agent instructions into 14 skills that several agents can share.

| Change | Files |
| --- | --- |
| New skills: `claims-ledger`, `research-methods`, `job-posting-analysis`, `company-research`, `opportunity-assessment`, `profile-alignment`, `market-signals`, `resume-writing`, `resume-pdf`, `cover-letter-and-answers`, `linkedin-content`, `document-handoff`, `interview-and-offer-prep`, `client-repo-maintenance`, with templates and a PDF check script | `skills/` |
| New capabilities: posting analysis with culture and values signals, employer briefs, profile alignment, cover letter and LinkedIn methods, review record, `check_pdf.sh` | `skills/` |
| Agent instructions slimmed to role, judgment and a "Skills you use" table; procedures now live in skills (content unchanged unless noted above) | `agents/*/AGENTS.md` |
| Charter v5.1: skills defined; `cad` holds skills; proposals may cover skills and templates | `TEAM.md` |
| Skills in the platform table, `pdfinfo` added to tools | `governance/ENVIRONMENT.md` |
| Skill import and assignment step (A4) | `docs/SETUP.md` |

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
