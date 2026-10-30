---
name: document-handoff
description: Name, version, status, attach and hand off career documents, and record their review — file naming convention, version rules, document statuses, what goes on the Multica issue, and the acceptance record. Use whenever a document is delivered, revised, accepted, returned or committed.
---

# Document Handoff

## When to use

- Scribe: every deliverable and revision.
- Maestro: accepting or returning a document and committing accepted documents.

## Naming

Each employer has its own folder, so documents for several positions at one employer stay together:

```
deliverables/<Employer>/<Position>_<CODE>_v<N>.<extension>
deliverables/base/<Track>_RES_v<N>.<extension>
```

For example, `deliverables/Acme/Learning-Program-Manager_RES_v1.pdf` and its source `Learning-Program-Manager_RES_v1.docx`.

| Code | Document |
| --- | --- |
| `RES` | Resume |
| `CL` | Cover letter |
| `ANS` | Application answers |
| `LI` | LinkedIn content |

- **Employer:** the employer's common name, for example `Acme` or `Blue-Origin`.
- **Position:** the title as posted, without requisition numbers. If two postings at one employer share a title, add a short distinguisher (location or requisition ID), for example `Program-Manager-Denver`.
- No spaces or special characters; hyphens inside a name part, underscores between parts.
- For a document type with no code, use a short descriptive word (for example `Thank-You`) and propose a new code to the operator.
- The status is never part of the filename, so a file is not renamed when its status changes. It is recorded on the issue and in the employer folder's `INDEX.md` (see Acceptance record).
- Never put the client's name in a filename unless the client asks for it.

## Versions

- Start at `v1`. Increment for every revision (`v2`, `v3`, …).
- Keep prior versions unless the client authorizes removal. Never overwrite an approved document with an unapproved revision.
- Keep an editable source for every document.

## Statuses

| Status | Meaning |
| --- | --- |
| `DRAFT` | Internal working document |
| `PENDING_VERIFICATION` | Relies on a claim that needs the client's confirmation |
| `READY_FOR_REVIEW` | Internal quality checks complete; awaiting approval |
| `APPROVED_FOR_USE` | Approved for the client's external use |

Only Maestro (under a granted resume delegation, resumes only) or the client sets `APPROVED_FOR_USE`. Scribe never does.

## Handoff (Scribe)

Task workspaces are temporary, and you cannot push to any repository. On the Multica issue:

1. Attach the PDF and its editable source.
2. Record filename, version, status, target employer and position, source base, knowledge-base review date, date, and significant changes.
3. Include the tailoring note with its claim map (resumes) or the claim-ID note (other documents).
4. Record the validation commands you actually ran and their results (`resume-pdf`), and any checks you could not perform.
5. Notify Maestro. Address requested revisions as a new version.

An assignment is not complete until the document and its review information are on the issue.

## Acceptance record (Maestro)

Use `templates/review-record.md` on the issue. When accepting, commit the PDF and its editable source to the employer folder (`client:deliverables/<Employer>/`, or `deliverables/base/` for base resumes) following `client-repo-maintenance`, and link the commit.

Each folder has an `INDEX.md` that you keep current, newest first, using `templates/index.md`. Add a row when you commit a document, and update its status in the same way when the client approves it, so the repository always shows each file's current status.

## Stop and ask

- A file would overwrite an approved version.
- An attachment is missing or does not match the recorded filename and version.
