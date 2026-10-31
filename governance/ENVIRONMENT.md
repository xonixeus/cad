# CAD Environment Configuration

**Owner:** the operator. **Purpose:** the single place for the platform, repository layout, tools and fonts. Other instruction files refer to these names instead of repeating details. When something here changes, the operator updates it here only and logs the change in `CHANGELOG.md`.

## Platform

The department runs on **Multica**.

| Multica concept | How CAD uses it |
| --- | --- |
| Workspace | Holds the department's agents, projects, issues and autopilots. One workspace can serve several clients. |
| Agents | Maestro, Sherlock, Watson, Scribe. Each agent's Instructions field holds a copy of its `cad:agents/<name>/AGENTS.md`. |
| Skills | Workspace skills imported from `cad:skills/<name>/` (GitHub folder import) and attached to agents as listed in each `AGENTS.md` and `cad:docs/SETUP.md` A4. After a skill changes in `cad`, refresh it in Multica (`multica skill refresh <id>`); agent assignments are kept. |
| Projects | One project per client (for example **CAD: Alex**), optionally plus one project per base resume (for example **CAD: Alex — Base: Data Analytics**). Every project of a client links the same two repositories. |
| Issues | All assignments, handoffs, findings, proposals, questions and approval records |
| Autopilots | Scheduled runs per client: Sherlock's research and Maestro's report. The operator sets their timing; agents never define or track run times. |

## Repositories

Every client project links two repositories as project resources. Each task runs in a temporary workspace; check a repository out with `multica repo checkout <url>` if it is not already present. `.multica/project/resources.json` lists the project's repositories.

| Repository | Visibility | Contents | Who pushes |
| --- | --- | --- | --- |
| `cad` | Public | `TEAM.md`, `agents/`, `skills/`, `governance/` (this file, change log), `docs/`, `templates/client/` | The operator only |
| Client repository (for example `cad-alex`) | Private | `CLIENT.md`, `governance/`, `knowledge/`, `personality_profile/`, `operations/`, `deliverables/`, `scripts/` | Maestro, within the client's approvals |

**Git permissions.** All agents can read both repositories. Only Maestro holds push credentials, and they cover client repositories only. Sherlock, Watson and Scribe cannot push.

**Persistence.** Task workspaces are temporary. Anything that must survive a task goes in a Multica issue (all agents) or a commit to the client repository (Maestro only). Never rely on a file left in a task workspace.

**Maestro's commits.** Pull before you change anything (`git fetch origin && git rebase origin/main`). Make small commits with clear messages that name the issue. Agent checkouts start on a task branch, so push with `git push origin HEAD:main`. Never force-push, rewrite history, delete branches or change repository settings. Every change to `client:knowledge/` or `client:governance/` also gets a `client:governance/CHANGELOG.md` entry.

**Instructions fields.** The `AGENTS.md` files in `cad` are the source. When the operator changes `TEAM.md` or an `AGENTS.md`, the operator also updates the matching agent's Instructions field in Multica.

## Browser (runtime requirements)

Sherlock gets a headless browser through the **Playwright MCP server** (`@playwright/mcp`), attached as that agent's MCP configuration in Multica. Other agents use plain web fetch and search unless the operator adds it to them. The `research-methods` skill says when and how to use it (read only).

- Node.js 22 and npm, the `@playwright/mcp` package pinned to an exact version, and Playwright's Chromium with its system libraries.
- Run it headless and isolated (`--headless --isolated --browser chromium`) so each run has a fresh in-memory profile with no saved cookies or logins. Set `--output-dir` to a directory outside task workspaces.

## PDF production (runtime requirements)

The runtime that executes Scribe's tasks must provide the following. Verify them on first use and report anything missing.

Fonts (Liberation Sans; Ubuntu/Debian `fonts-liberation` default paths):

- Regular: `/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf`
- Bold: `/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf`
- Italic: `/usr/share/fonts/truetype/liberation/LiberationSans-Italic.ttf`
- Bold Italic: `/usr/share/fonts/truetype/liberation/LiberationSans-BoldItalic.ttf`

Validation tools (`poppler-utils`): `pdfinfo` (page count and size), `pdftotext` (text extraction and reading order), `pdffonts` (font embedding), `pdftoppm` (page rendering). The `resume-pdf` skill's `scripts/check_pdf.sh` runs them together.

Production libraries: `python3-reportlab` (PDF) and `python3-docx` (editable DOCX source). On Ubuntu or Debian:

```
sudo apt install fonts-liberation poppler-utils python3-reportlab python3-docx
```

## Report delivery

How Maestro's report reaches each client is recorded in that client's `CLIENT.md`. Until it is confirmed, Maestro posts each report as a comment on the standing report issue in the client's project.
