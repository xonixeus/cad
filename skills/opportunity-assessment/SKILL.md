---
name: opportunity-assessment
description: Assess whether a job opportunity suits the client — hard constraints, fit against verified evidence, alignment with approved career paths, and compensation — and rate it Top-tier, Qualified or Not qualified, flagging strategic ambiguity. Use for Sherlock's assessments, Watson's second opinions, and Maestro's triage.
---

# Opportunity Assessment

The department's single method for judging an opportunity, so ratings mean the same thing whoever produces them.

## When to use

- Sherlock: every discovered opportunity.
- Watson: second opinions on Top-tier or strategically ambiguous opportunities.
- Maestro: deciding what happens next, and checking an assessment before presenting it.

## Before you start

1. A posting analysis from the `job-posting-analysis` skill.
2. `client:knowledge/JOB_SEARCH_PREFERENCES.md` and `client:knowledge/CAREER_OBJECTIVES.md` for constraints and career paths.
3. `client:knowledge/CLAIMS_LEDGER.md` for evidence (see the `claims-ledger` skill).
4. `client:operations/PIPELINE.md`: if the client applied to or passed on this role, stop unless it materially changed.

## Steps

1. **Hard constraints.** Check each against the posting text: work arrangement and location (verified, not assumed), employment type and contract length, industry exclusions, seniority range, and any other must-have in the client's preferences. One failure means **Not qualified**; record which.
2. **Fit.** Map each hard requirement and the most important preferred qualifications to ledger evidence:
   - Verified match (cite IDs).
   - Transferable experience (label it as transferable, cite IDs).
   - Pending evidence (label Pending).
   - Gap or potential disqualifier.
3. **Alignment.** How the role serves the client's approved career paths and long-term direction; growth potential; whether it would be a step sideways or down in scope.
4. **Compensation.** Compare the posted range with the client's benchmark. If undisclosed, say so; never infer a salary.
5. **Rate** using evidence, not a numeric score:
   - **Top-tier:** meets every hard constraint, matches the core requirements with Verified evidence, strongly aligned with the client's objectives.
   - **Qualified:** meets every hard constraint; fit or alignment is reasonable, with gaps explained.
   - **Not qualified:** fails a hard constraint, or the gaps outweigh the fit.
6. **Strategic ambiguity.** Flag it when fit is strong but career value is unclear (unusual role, step down in scope, adjacent field).
7. **Urgency.** Note a verified near deadline.

A target company never exempts a role from constraints, and priority never lowers the qualification bar.

## Output

Use `templates/assessment.md`. For Not qualified roles, a one-line entry with the reason is enough.

## Second opinions (Watson)

State whether you agree with the rating and why, focusing on long-term value, risks and fit with the positioning. Keep it short. Disagreement goes to Maestro with evidence.

## Stop and ask

- An essential constraint is undefined in the client's preferences.
- A target company appears to conflict with an exclusion.
- Evidence for a core requirement exists only as Pending and would change the rating.
