---
name: resume-pdf
description: Lay out, produce and validate ATS-safe resume and career-document PDFs — single-column formatting, typography defaults, text-based PDF production with embedded Liberation Sans, and the required text, font, rendering, visual and page checks (with a script). Use when producing any PDF deliverable or verifying one.
---

# Resume PDF

Formatting, production and validation for every PDF the department delivers. Content rules are in `resume-writing`.

## When to use

- Scribe: producing any PDF (resumes, and cover letters when a PDF is requested).
- Maestro: confirming the checks were actually performed and their results.

## Before you start

The runtime must provide the fonts and tools listed in `cad:governance/ENVIRONMENT.md` (Liberation Sans; `pdftotext`, `pdffonts`, `pdftoppm`). Verify them on first use; report anything missing instead of substituting.

## Formatting and ATS

- Single column. No tables, text boxes, columns, graphics or icons.
- Nothing essential in headers or footers. Name and contact details at the top of the body.
- No hidden text, invisible keywords or decorative character spacing.
- Never claim guaranteed ATS compatibility or assign an ATS score.

**Typography defaults** (adjust only when it improves readability, or when the client's quality standards say otherwise):

- Font: Arial, Calibri, Aptos, or Liberation Sans (preferred on Linux runtimes).
- Body 10.5–11 pt; section headings 11–12 pt bold; name 16–18 pt bold.
- Margins about 0.65–0.75 in; left-aligned; line spacing about 1.0–1.15; consistent section spacing.
- Black or dark text on white; standard bullet characters and consistent indentation.

## Production

- Produce a text-based PDF with selectable text, US Letter unless the client's location calls for A4. Never deliver a scanned or image-only PDF.
- Use the Liberation Sans font files from `cad:governance/ENVIRONMENT.md`, and never fall back to built-in fonts such as Helvetica.
- **ReportLab (default on CAD runtimes):** register each variant you use with `pdfmetrics.registerFont(TTFont("LiberationSans", ".../LiberationSans-Regular.ttf"))` (likewise `-Bold`, `-Italic`, `-BoldItalic`), and create the canvas with `initialFontName="LiberationSans"`. Without `initialFontName`, ReportLab silently adds an unembedded Helvetica to every page even if no text uses it, and the font check fails. With Platypus (`SimpleDocTemplate`), set `fontName` on every paragraph style, including the base style.
- **PDFKit (alternative):** register each variant with `registerFont()` and select a registered font before writing any text.
- Do not copy or redistribute the font files.
- Keep an editable source for every PDF. Default: a DOCX built with python-docx from the same content (Liberation Sans or Arial, same section order), attached alongside the PDF.
- If PDF creation is unavailable, provide the completed content and disclose the limitation. Never claim a PDF exists when it does not.

## Validation

Run `scripts/check_pdf.sh <file.pdf> [max_pages] [letter|a4]`. It performs the mechanical checks and renders every page to PNG:

1. **Text:** `pdftotext -layout` extraction; flags empty output and replacement characters.
2. **Fonts:** `pdffonts`; every font must be embedded Liberation Sans, with no substitutions.
3. **Rendering:** `pdftoppm -scale-to 1400 -png` for every page.
4. **Page count and size.**

Then do what the script cannot:

5. **Read the extracted text** for missing content, wrong reading order, broken characters and artifacts. Confirm contact details, headings, employers, titles, dates and bullets are intact.
6. **Visually inspect each rendered page image** for clipping, overlap, margins, spacing and page breaks. Generating an image is not inspecting it. If you cannot view images, say so and request review.

Record the commands you ran and their actual results in the handoff (`document-handoff`). Successful extraction is a basic parsing check, not proof of compatibility with every ATS. A PDF that fails a required check is not ready for review.

## Stop and ask

- Fonts or tools are missing from the runtime.
- The content cannot fit the page limit without dropping material the tailoring requires (ask Maestro which to cut).
