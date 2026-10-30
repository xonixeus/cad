---
name: claims-ledger
description: Read, cite and propose changes to the client's claims ledger (client:knowledge/CLAIMS_LEDGER.md), the only source of the client's career facts. Use whenever you state, assess, write or check anything about the client's background, qualifications, titles, dates or results.
---

# Claims Ledger

The claims ledger is the single source of truth for the client's career facts (`cad:TEAM.md` §7). This skill is how every agent uses it.

## When to use

- Before making any statement about the client's background, qualifications, titles, dates, metrics or credentials.
- When assessing fit, writing a document, preparing a coaching pack, or reviewing someone else's work.
- When you find new information or an error about the client.

## Before you start

1. Open `client:knowledge/CLAIMS_LEDGER.md` from the client repository of **this** project. Never use another client's ledger.
2. Read its "How to use this ledger", "Named limits" and "Standing rules" sections; they can add client-specific rules.

## Reading a row

| Column | Meaning |
| --- | --- |
| **ID** | Stable identifier. Cite it; never renumber or reuse it. |
| **Class** | `Verified` (client-confirmed or established by an approved source), `Pending` (resume-reported or unconfirmed), `Disputed`, `Superseded` (follow its pointer to the replacement). |
| **Use** | `Resume` (may appear in external documents), `Eligibility` (internal assessment only), `Internal` (guardrail or context, never presented), `No` (not in any external document until Verified). |
| **Limits** | Wording rules on top of Class and Use, for example "present as a range" or "do not attach to a named employer". A name in capitals refers to the Named limits section. |
| **Source** | Document IDs from `client:knowledge/SOURCE_REGISTER.md`, or "Client" for the client's own statement. |

## What you may use where

| Purpose | Allowed rows |
| --- | --- |
| External documents (resumes, letters, LinkedIn, application answers) | `Verified` **and** Use `Resume`, worded within Limits |
| Internal assessment (fit, gaps, coaching) | `Verified` rows, and `Pending` rows **labeled as Pending** |
| Never | `Disputed` or `Superseded` rows as fact; `Use: No` rows outside internal discussion |

Rules that always apply:

- Ranges stay ranges. Never quote only the top of a range or a single figure.
- Never sum or combine percentages or results from different rows, and never imply more causality than the wording states.
- Career-level claims stay unattributed to any single employer.
- Use official titles or approved alternative titles exactly as recorded.
- Preserve date precision as recorded; never invent a month.
- Approved or suggested wordings in the ledger may be used as written.
- Repetition across historical resumes does not verify a claim. A job posting is never evidence about the client.

## Citing

Cite IDs wherever a claim is used: `Leads cross-team program (EXP-04, CAR-02)`. In internal work, mark Pending evidence: `(EXP-07, Pending)`.

## Proposing a change

You cannot edit the ledger (only Maestro writes `client:knowledge/`). When you find new information, an error, or a conflict between sources, post a proposal on a Multica issue in the client's project, addressed to Maestro:

```
Ledger proposal
- Claim: <the fact, in neutral wording>
- Affects: <existing ID, or "new">
- Evidence: <source document / link / client statement, with date>
- Proposed class / use / limits: <…>
- Why it matters: <which work it unblocks or corrects>
```

Never reconcile conflicting sources silently, and never promote a Pending claim yourself.

## Stop and ask

- The ledger is missing, unreadable, or belongs to a different client than `client:CLIENT.md` names.
- A fact you need exists only as Pending: leave it out of external work and list its ID as a question for the client.
- Two rows conflict, or a row's Limits are unclear for your use.
