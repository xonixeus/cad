---
name: profile-alignment
description: Match the client's owner profile (values, work style, strengths, motivations) to a role's culture and values signals, and recommend how to express that alignment truthfully in documents and interviews — or warn of a mismatch. Use when tailoring a cover letter, summary or LinkedIn content, preparing an interview, or judging culture fit.
---

# Profile Alignment

Connects who the client is (their owner profile) with what a role and employer value, without turning personality into unsupported claims.

## When to use

- Watson: culture-fit judgment in second opinions, interview preparation, positioning advice.
- Scribe: cover letters, resume summaries, application answers and first-person LinkedIn content, when the posting signals that values or work style matter.

Use it only when the posting or company brief contains real culture or values signals. If there are none, say so and skip it.

## Before you start

1. The posting analysis (culture and values signals) from `job-posting-analysis`, and a company brief from `company-research` if one exists.
2. The profile files you are allowed to read (`cad:TEAM.md` §13): Watson reads all of `client:personality_profile/`; Scribe reads `QUALITY_STANDARDS.md` and `CONTEXT.md`. Use only files that exist and are not empty.
3. Remember: the profile describes values and preferences. **It is never evidence of career facts.**

## Steps

1. **List the signals** from the posting and company brief, each labeled explicit or implied.
2. **Find matches** in the profile. Prefer points labeled *Client-stated* over *Operational translation*. Quote or paraphrase the profile point and name the file.
3. **Find tensions:** signals that conflict with the client's stated preferences or boundaries (for example, a stated dislike of a working style the role demands). These matter as much as matches.
4. **Find proof:** for each match you want to use externally, look for a Verified, Use `Resume` ledger row that shows the trait in action. A trait without proof can shape tone and emphasis, but it is not stated as an accomplishment.
5. **Recommend expression,** for each strong match:
   - **Documents (Scribe):** where it belongs (cover letter opening, summary line, an answer), the proof (ledger IDs), and wording that shows rather than asserts ("built a peer-review process adopted by three teams" instead of "I am collaborative").
   - **Interviews (Watson):** a story built on Verified claims, and how to discuss any tension honestly.
6. **Respect privacy and dignity.** Never disclose profile content the client would not expect in a professional document (health, family, beliefs, assessment results) unless the client asked for it. Self-reported assessments (for example, work-style or strengths tools) may inform emphasis but are named in a document only if the client approves.

## Output

```
Profile alignment — <Employer>, <Title>
Signals used: <list with explicit/implied>
Strong matches: <signal> ↔ <profile point (file)> · proof: <IDs or "none — tone only">
Tensions: <signal> ↔ <profile point> · how to handle
Recommended expression: <document placements / interview stories>
Not recommended: <anything that would overstate or overshare>
```

## Stop and ask

- A recommendation would require stating a trait as fact without ledger proof.
- A tension looks material enough to affect whether the client should pursue the role (send to Maestro).
- You would need a profile file your role may not read.
