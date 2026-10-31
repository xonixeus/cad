# CAD Setup Guide

**For the operator.** How to run the Career Advancement Department on [Multica](https://github.com/multica-ai/multica) and add a client. Each step says how to check it worked.

## Part A — One-time setup

### A1. Runtime

Run the agents on a Multica runtime that supports per-agent environment variables and the `multica` CLI inside tasks (Claude Code works). Scribe also needs Liberation Sans fonts, the poppler PDF tools, and ReportLab and python-docx to produce documents. On Ubuntu or Debian:

```
sudo apt install fonts-liberation poppler-utils python3-reportlab python3-docx
```

**Check:** the `resume-pdf` skill's `scripts/check_pdf.sh`, run with no arguments, prints "tools and fonts OK"; `python3 -c "import reportlab, docx"` succeeds.

**Browser for Sherlock and Watson (recommended).** Many careers sites load their listings with JavaScript, which plain web fetch cannot read. As the user the daemon runs as, install the Playwright MCP server at a pinned version and its Chromium; install Chromium's system libraries with sudo:

```
sudo apt install nodejs npm
mkdir -p ~/.local/share/playwright-mcp && cd ~/.local/share/playwright-mcp
npm init -y && npm install --save-exact @playwright/mcp@<version>
sudo node_modules/.bin/playwright install-deps chromium
node_modules/.bin/playwright install chromium
```

Then attach it to Sherlock and Watson from a JSON file (mode 0600). Do not attach it to Maestro, which holds the push and email credentials:

```json
{"mcpServers":{"playwright":{"command":"<home>/.local/share/playwright-mcp/node_modules/.bin/playwright-mcp","args":["--headless","--isolated","--browser","chromium","--output-dir","<home>/.cache/playwright-mcp-output"]}}}
```

```
multica agent update <sherlock-id> --mcp-config-file browser-mcp.json
multica agent update <watson-id> --mcp-config-file browser-mcp.json
```

**Check:** an issue asking Sherlock to list its `mcp__playwright` tools and open a JavaScript-rendered careers board returns the board's real role titles.

### A2. The `cad` repository

Fork or copy this repository. Register it in Multica (**Settings → Code**). If it is public, agents can read it without credentials.

### A3. Agents

Create the four agents and paste the **entire** contents of each file into its Instructions field:

| Agent | Instructions file | Push credentials |
| --- | --- | --- |
| Maestro | `agents/maestro/AGENTS.md` | Yes: client repositories only |
| Sherlock | `agents/sherlock/AGENTS.md` | No |
| Watson | `agents/watson/AGENTS.md` | No |
| Scribe | `agents/scribe/AGENTS.md` | No |

Each file tells its agent to read `TEAM.md` from `cad` first, so the charter does not need to be pasted. When you change `TEAM.md` or an `AGENTS.md`, paste the new version into that agent's Instructions field.

### A4. Skills

Import each folder in `skills/` as a workspace skill, from its GitHub URL, then attach it to the agents marked below:

```
multica skill import --url https://github.com/<owner>/cad/tree/main/skills/<name>
multica agent skills add <agent-id> --skill-ids <skill-id>,<skill-id>,…
```

| Skill | Sherlock | Watson | Scribe | Maestro |
| --- | :-: | :-: | :-: | :-: |
| `claims-ledger` | ✓ | ✓ | ✓ | ✓ |
| `research-methods` | ✓ | ✓ | | |
| `job-posting-analysis` | ✓ | ✓ | ✓ | |
| `company-research` | | ✓ | ✓ | |
| `opportunity-assessment` | ✓ | ✓ | | ✓ |
| `profile-alignment` | | ✓ | ✓ | |
| `market-signals` | ✓ | ✓ | | |
| `resume-writing` | | | ✓ | ✓ |
| `resume-pdf` | | | ✓ | ✓ |
| `cover-letter-and-answers` | | ✓ | ✓ | |
| `linkedin-content` | | ✓ | ✓ | |
| `document-handoff` | | | ✓ | ✓ |
| `interview-and-offer-prep` | | ✓ | | |
| `client-repo-maintenance` | | | | ✓ |

When you change a skill in `cad`, run `multica skill refresh <skill-id>` (or **Update** on the skill page). Agent assignments are kept. Give temporary specialists only the skills their task needs.

**Check:** each agent's **Skills** tab lists its skills.

### A5. Git credentials

- **Read access (all agents):** the runtime's git credentials must be able to read every client repository. For example, one read-only deploy key per client repository, or a read-only token.
- **Push access (Maestro only):** give only Maestro a credential that can push to client repositories, for example a fine-grained GitHub token with **Contents: Read and write** on the client repositories, stored in Maestro's agent environment variables (for example `GH_TOKEN`) and supplied to git by a credential helper. Never give Maestro push access to `cad`.

**Check:** a task run by Sherlock can read a client repository but a push fails; a task run by Maestro can push.

## Part B — Add a client

### B1. Consent

Get the client's agreement before storing their career history, contact details or profile. Tell them where the data lives (the client repository, Multica, and the model provider your runtime uses).

### B2. Create the client repository

1. Create a **private** repository, for example `cad-alex`.
2. Copy everything in `templates/client/` into its root and push.
3. Fill in `CLIENT.md` with the client.

**Check:** the repository shows `CLIENT.md`, `governance/`, `knowledge/`, `personality_profile/`, `operations/`, `deliverables/` and `scripts/`.

### B3. Create the client's project

Create a project (for example **CAD: Alex**) and add two resources: `cad` and the client repository, both on `main`. If the client will use base resumes, add one project per base, linked to the same two repositories.

Every issue for this client must belong to one of their projects so the agent gets the right repositories.

### B4. Build the client's knowledge base

Create an issue in the client's project, assigned to Maestro:

> Onboard this client. Read `client:CLIENT.md` and the README of every folder in the client repository. Gather the client's career history, objectives and preferences from the materials I attach and from the client's answers, and build `knowledge/CLAIMS_LEDGER.md`, `CAREER_OBJECTIVES.md` and `JOB_SEARCH_PREFERENCES.md`. Mark every claim Pending until the client confirms it. Send me the questions that need the client's confirmation in one list.

Then ask Watson for a first `POSITIONING.md` proposal once the ledger has Verified rows.

### B5. Report delivery

Choose how Maestro's reports reach the client and record it in `CLIENT.md`:

- **Multica notifications (simplest):** a standing issue in the client's project named "CAD Report", subscribed to by the client (or by you, if you relay). Maestro posts each report as a comment.
- **Email:** give Maestro an email-sending credential in its agent environment variables and record the recipient in `CLIENT.md`.

### B6. Autopilots

Create two autopilots for the client. You set the schedules; agents never define run times.

**Research** — agent Sherlock, the client's project. Prompt:

> Run your scheduled opportunity research as defined in your instructions and TEAM.md for the client of this project. Check the current operating mode first. Post your results on a new issue in this project titled with today's date: target-company coverage (complete, partial or failed for each company), each Top-tier or Qualified opportunity with its handoff details, and any blockers. If the run could not be completed, say so plainly.

**Report** — agent Maestro, the client's project. Prompt:

> Prepare and deliver the department report for the client of this project as defined in your instructions. Use Sherlock's research issue from the latest run. If that research is missing, incomplete or failed, say so at the top of the report and do not present older research as current. Update `client:operations/PIPELINE.md` and commit it.

### B7. Deployment checks

Create one issue per agent in the client's project:

**Maestro:**

> Deployment check (read-only except as noted). Confirm you can read `cad:TEAM.md`, `cad:governance/ENVIRONMENT.md`, `client:CLIENT.md` and `client:knowledge/CLAIMS_LEDGER.md`. Quote one line from each. State whether a resume-approval delegation exists for this client. Then confirm write access by adding today's date and "Multica deployment check" as the first row of `client:operations/IMPROVEMENT_LOG.md`, committing, and linking the commit. Make no other changes.

**Sherlock, Watson and Scribe (same text for each):**

> Deployment check (read-only). Confirm you can read `cad:TEAM.md`, your own instructions in `cad:agents/`, `client:CLIENT.md` and `client:knowledge/CLAIMS_LEDGER.md`. Quote one line from each. List the skills available to you. State in two sentences what your role does and what you must never do. Scribe only: also confirm whether Liberation Sans and the poppler tools are available in your runtime (run the `resume-pdf` skill's `check_pdf.sh` with no arguments; it reports missing tools). Make no changes.

**Check:** all four quote real lines from the right client's files, and Maestro's commit appears in the client repository.
