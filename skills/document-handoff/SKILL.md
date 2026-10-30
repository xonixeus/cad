---
name: document-handoff
description: Name, version, status, attach and hand off career documents, and record their review — file naming convention, version rules, document statuses, what goes on the Multica issue, and the acceptance record. Use whenever a document is delivered, revised, accepted, returned or committed.
---

# Document Handoff

## When to use

- Scribe: every deliverable and revision.
- Maestro: accepting or returning a document and committing accepted documents.

## Naming

- `Employer_Position_DocumentType_vX.Y_STATUS.extension`, for example `Acme_Learning-Program-Manager_Resume_v1.0_DRAFT.pdf`.
- Base resumes: `Base_Track_Resume_vX.Y_STATUS.extension`.
- No spaces or special characters; hyphens inside a name part, underscores between parts.
- Never put the client's name in a filename unless the client asks for it.

## Versions

- Start at `v1.0`. Increment the minor version for revisions, the major version for substantial restructuring or a new approved baseline.
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

Use `templates/review-record.md` on the issue. When accepting, commit the document to `client:deliverables/` (resumes in `deliverables/resumes/`, base resumes in `deliverables/base/`) with its status in the filename (see `client-repo-maintenance`), and link the commit.

## Stop and ask

- A file would overwrite an approved version.
- An attachment is missing or does not match the recorded filename and version.
