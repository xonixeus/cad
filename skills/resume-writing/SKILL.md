---
name: resume-writing
description: Write and tailor the client's resumes from the claims ledger — base resumes, tailoring from a base, content standards, bullets, and the tailoring note with its claim map — and check a resume's claim map against the ledger. Use when drafting, revising or reviewing any resume.
---

# Resume Writing

How the department writes resumes and how a reviewer checks them. Formatting and PDF production are in the `resume-pdf` skill; naming and handoff in `document-handoff`.

## When to use

- Scribe: every base or tailored resume, and every revision.
- Maestro: reviewing a resume's content and claim map before acceptance.

## Before you start

1. `client:knowledge/CLAIMS_LEDGER.md` (follow the `claims-ledger` skill). Historical resumes are never sources to copy from; none is a master resume.
2. `client:knowledge/POSITIONING.md`: approved positioning, summary and any base resumes.
3. For a tailored resume: a posting analysis (`job-posting-analysis`) and any guidance from Watson.
4. `client:personality_profile/QUALITY_STANDARDS.md` if it exists. Where it, or `POSITIONING.md`, differs from the defaults below, follow the client.

## Base resumes

A client may approve one or more base resumes, defined in `POSITIONING.md` (each base's targets, lead, claim IDs and skills).

- Build each base from the ledger and the positioning file. A base needs the client's approval before it becomes a baseline.
- Tailor every resume from the most relevant approved base. Change only what the posting justifies.
- When the ledger changes, update the affected bases and note which IDs changed.
- If the client has no approved bases, build tailored resumes directly from the ledger.

## Preparing a tailored resume

1. Identify the posting's core requirements from the posting analysis.
2. Select the most relevant Verified, Use `Resume` claims.
3. Tailor from the right base, applying Watson's guidance (and the `profile-alignment` skill when the posting stresses values or culture).
4. Produce and validate the PDF (`resume-pdf` skill).
5. Write the tailoring note with its claim map (`templates/tailoring-note.md`).

## Content standards (defaults)

**Length:** two pages by default; three when necessary to represent substantial relevant experience. Relevance and readability come before page count.

**Sections:** recognizable headings in a clean, single-column layout. Default order:

1. PROFESSIONAL SUMMARY (only when a short, role-specific summary adds context)
2. PROFESSIONAL HISTORY
3. PROFESSIONAL EXPERIENCE (skills and functional expertise)
4. DIGITAL LITERACY (platforms, applications, tools)
5. EDUCATION, CERTIFICATES, & AWARDS

Reorder, combine or omit sections when that improves relevance. Keep ATS-recognizable terms in or beside headings.

**Employment history:** reverse chronological. Keep employer, title and dates together in a predictable order, formatted like `Jan 2020 – Feb 2022`. Three to five bullets for recent relevant roles, fewer for older ones. Present tense for ongoing work, past tense for completed work.

**Bullets:** start with a specific action verb, and state the action, scope and outcome when the evidence supports it. Use metrics only when Verified, in their recorded wording. Never turn team results into individual results without evidence. Avoid clichés, repetition, excess adjectives and keyword stuffing.

**Accuracy rules:**

- Use official or approved alternative titles exactly as recorded; never invent or substitute a title.
- Preserve date precision; never invent a month or transition date.
- Employer terminology may be used only when it accurately describes documented experience. Never copy a posting's requirements into a resume.
- A needed fact that is Pending stays out; list its ID in the tailoring note as a question for the client.
- When sources conflict or a fact is unresolved, ask Maestro; never reconcile it silently.

## The claim map

List every substantive line of the resume with the ledger ID(s) it rests on, for example "Summary line 2 → CAR-01, CAR-03"; "Most recent role, bullet 3 → EXP-10, EXP-12". Contact details, headings and section labels need no ID; everything that states a fact does.

## Reviewing a resume (Maestro)

1. Every substantive statement appears in the claim map.
2. Every cited ID is Verified with Use `Resume`, and the wording respects its Limits.
3. No statement lacks an ID; no unsupported qualification, accomplishment or metric appears as fact.
4. Titles are official or approved alternatives; dates keep their recorded precision.
5. Tailoring changes match what the tailoring note lists, and the gaps against the posting are disclosed.
6. Content standards above (or the client's) are met.

Return specific corrections to Scribe for any failure.

## Stop and ask

- A core requirement can only be met with Pending claims.
- The client has no positioning yet and the resume needs one (ask Maestro to involve Watson).
