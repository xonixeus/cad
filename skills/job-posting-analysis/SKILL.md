---
name: job-posting-analysis
description: Break a job posting into its core requirements, hard constraints, preferred qualifications, responsibilities, compensation details, and culture and values signals, in a standard structure other agents can reuse. Use before assessing fit, tailoring a document, or preparing interview or profile-alignment work.
---

# Job Posting Analysis

Produces one structured breakdown of a posting so Sherlock, Watson and Scribe all work from the same reading of it.

## When to use

- Sherlock: before assessing an opportunity.
- Scribe: before tailoring a resume, cover letter or application answers.
- Watson: before a second opinion, interview pack, or profile alignment.

If a breakdown for the same posting is already on the issue and the posting has not changed, reuse it instead of redoing it.

## Before you start

Open the posting itself (see the `research-methods` skill) and record its URL and the date you read it.

## Steps

1. **Basics:** employer, title, team or department, location and work arrangement as stated, employment type and length, seniority signals, posting or requisition ID, date posted, deadline.
2. **Hard requirements:** items stated as required or minimum ("must", "required", "minimum"). Separate legal or eligibility items (work authorization, clearance, licenses).
3. **Preferred qualifications:** "preferred", "nice to have", "bonus".
4. **Core responsibilities:** the three to six activities the role exists for, in your own words. Weight by emphasis and repetition, not by list order alone.
5. **Keywords:** recurring skills, tools, methods and domain terms, in the employer's exact wording (Scribe uses these only where they truthfully describe documented experience).
6. **Compensation and benefits:** the posted range and what it covers, or "not disclosed". Never infer a salary.
7. **Culture and values signals:** quoted phrases about how the team works, values, pace, autonomy, collaboration, learning, mission. Label each as **explicit** (stated values, "we value…") or **implied** (inferred from wording). These feed the `profile-alignment` skill.
8. **Red flags and unknowns:** vague scope, mismatched title and duties, unrealistic requirement combinations, missing information that matters to the client's constraints.

## Output

Post it on the issue as:

```
Posting analysis — <Employer>, <Title>
Source: <URL> (read <date>) · ID: <req ID or none>
Basics: <…>
Hard requirements: <bullets>
Preferred: <bullets>
Core responsibilities: <bullets>
Keywords: <comma-separated>
Compensation: <range / not disclosed>
Culture & values signals: <bullet> (explicit|implied) …
Red flags / unknowns: <bullets>
```

This is a description of the posting only. It says nothing about whether the client qualifies; that is the `opportunity-assessment` skill.

## Stop and ask

- The posting cannot be opened or appears closed.
- Key constraint details (location, employment type) are missing or contradictory; report the gap rather than guessing.
