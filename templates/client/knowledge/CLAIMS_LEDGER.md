# Claims Ledger

The only source of the client's career facts (`cad:TEAM.md` §7). Maintained by Maestro. Every agent consults it before making any claim about the client.

## How to use this ledger

- Every career fact has a stable **ID** (prefix by area, for example `PRO-` profile, `EMP-` employment, `CAR-` career-level, `EXP-` experience at one employer, `EDU-` education and credentials, `SK-` skills). Cite IDs in tailoring notes, assessments and prep packs.
- **Class:** `Verified` (client-confirmed or established by an approved source) or `Pending` (resume-reported or unconfirmed). Also `Disputed` and `Superseded`.
- **Use:**
    - `Resume`: may appear in external documents, within its Limits.
    - `Eligibility`: for internal assessment only; never put on a resume unless the client asks.
    - `Internal`: a guardrail or context for agents; not a claim to present.
    - `No`: may not appear in any external document until Verified.
- **Limits** apply on top of Class and Use. Ranges stay ranges. Never sum percentages or imply more causality than the wording states. Longer limits can be defined once under **Named limits** and referenced by name.
- **Source:** IDs from `SOURCE_REGISTER.md` (for example `R1` for a historical resume), or "Client" for the client's direct statement. Confirmations are the client's own account, not independent third-party verification, unless a document says otherwise.
- **Changes:** Maestro adds new IDs and never reuses or renumbers them. A replaced claim stays in place, marked `Superseded`, with a pointer to its replacement. Log every change in `governance/CHANGELOG.md`.

## Profile and contact

| ID | Claim | Class | Use | Limits | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- |

## Employment record

Official titles, approved alternative titles, dates at the precision the client confirmed, and work mode.

| ID | Employer | Title(s) | Dates | Work mode | Class | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Career-level

Claims that span employers (for example, years of experience in a field). Never attach these to a single employer.

| ID | Claim | Class | Use | Limits | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- |

## Experience by employer

Add one section per employer, for example `## Example Corp (ROLE-EX)`, with the same columns:

| ID | Claim | Class | Use | Limits | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- |

## Education, credentials and recognition

| ID | Claim | Class | Use | Limits | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- |

## Skills and tools

| ID | Claim | Class | Use | Limits | Source | Confirmed |
| --- | --- | --- | --- | --- | --- | --- |

## Named limits

Referenced in the Limits column above. Format: **NAME:** the limit, and why it exists.

## Standing rules

- Repetition across historical resumes does not verify a claim.
- A job posting is never evidence of the client's qualifications or preferences.
- A historical resume showing "Present" does not establish current employment; confirm it with the client.
- List here any documents the client has not supplied (for example transcripts or certificates), so no one assumes they were checked.
