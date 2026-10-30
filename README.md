# CAD — Career Advancement Department

An AI career team that runs on [Multica](https://github.com/multica-ai/multica). Four agents work together for a person — the **client** — across their whole career, not just the next job:

| Agent | Role |
| --- | --- |
| **Maestro** | Project manager: priorities, assignments, quality acceptance, reports, and the client's records |
| **Sherlock** | Reverse recruiter: finds and assesses opportunities, monitors target companies, tracks market signals |
| **Watson** | Career coach: positioning, development planning, interview and offer preparation, career reviews |
| **Scribe** | Writer: resumes, cover letters, application answers, LinkedIn content |

The department prepares materials and advice. It never applies, contacts employers, or posts anything; the client decides and acts.

## How it works

The department and the people it serves are kept in separate repositories:

- **`cad` (this repository, public):** the charter every agent follows (`TEAM.md`), each agent's instructions (`agents/`), the environment and setup guides, and a template for client repositories. It contains no personal data.
- **One private client repository per person** (for example `cad-alex`), created from `templates/client/`: their verified career facts (a claims ledger), objectives, preferences, target companies, owner profile, opportunity pipeline and accepted documents.

Each client gets a Multica project linked to both repositories, so the same agents tailor their work to whoever the project is for, and never mix clients.

Principles that run through everything:

- **Evidence first.** Every claim about the client comes from the claims ledger, and only client-verified facts reach a resume.
- **The client decides.** Objectives, constraints, what to pursue, and every external action belong to the client.
- **No wasted activity.** An agent is involved only when its judgment is needed.

## Get started

Read [`docs/SETUP.md`](docs/SETUP.md). In short: set up a Multica runtime, create the four agents from `agents/`, create a private client repository from `templates/client/`, link both repositories to a project, and run the deployment checks.

## Repository layout

```
TEAM.md                     Shared operating charter
agents/<name>/AGENTS.md     Role instructions (paste into each Multica agent)
governance/ENVIRONMENT.md   Platform, repository layout, tools and fonts
governance/CHANGELOG.md     Changes to the department
docs/SETUP.md               Setup and onboarding guide for the operator
templates/client/           Skeleton for a new client repository
```

## License

[CC BY 4.0](LICENSE). You may share and adapt this material for any purpose, including commercially, if you give appropriate credit.
