#!/usr/bin/env bash
# Mechanical checks for a CAD PDF deliverable: text extraction, embedded
# Liberation Sans fonts, page count and size, and a PNG render of every page.
# The reader still has to read the text and look at every image.
#
# Usage: check_pdf.sh <file.pdf> [max_pages=2] [letter|a4]
# Exit status: 0 = all mechanical checks passed, 1 = a check failed, 2 = usage or tool error.
set -uo pipefail

pdf=${1:-}
max_pages=${2:-2}
paper=${3:-letter}

missing=0
for tool in pdfinfo pdftotext pdffonts pdftoppm; do
  command -v "$tool" >/dev/null 2>&1 || { echo "MISSING TOOL: $tool (install poppler-utils)" >&2; missing=1; }
done
font_dir=${LIBERATION_DIR:-/usr/share/fonts/truetype/liberation}
for variant in Regular Bold Italic BoldItalic; do
  [ -f "$font_dir/LiberationSans-$variant.ttf" ] || { echo "MISSING FONT: $font_dir/LiberationSans-$variant.ttf (install fonts-liberation, or set LIBERATION_DIR)" >&2; missing=1; }
done
[ "$missing" -eq 0 ] || exit 2
if [ -z "$pdf" ] || [ ! -f "$pdf" ]; then
  echo "tools and fonts OK" >&2
  echo "usage: $0 <file.pdf> [max_pages] [letter|a4]" >&2
  exit 2
fi

out_dir="${pdf%.pdf}_check"
mkdir -p "$out_dir"
fail=0
pass() { echo "PASS  $*"; }
flag() { echo "FAIL  $*"; fail=1; }

# Page count and size
pages=$(pdfinfo "$pdf" | awk -F: '/^Pages:/ {gsub(/ /, "", $2); print $2}')
size=$(pdfinfo "$pdf" | awk -F': *' '/^Page size:/ {print $2}' | sed 's/ *(.*)$//')
if [ -n "$pages" ] && [ "$pages" -le "$max_pages" ]; then pass "pages: $pages (max $max_pages)"; else flag "pages: ${pages:-unknown} (max $max_pages)"; fi
case "$paper" in
  letter) expect="612 x 792" ;;
  a4)     expect="595.276 x 841.89|595 x 842" ;;
  *)      echo "paper must be letter or a4" >&2; exit 2 ;;
esac
if echo "$size" | grep -Eq "$expect"; then pass "page size: $size ($paper)"; else flag "page size: $size (expected $paper)"; fi

# Text extraction
pdftotext -layout "$pdf" "$out_dir/text.txt"
chars=$(tr -d '[:space:]' < "$out_dir/text.txt" | wc -c | tr -d ' ')
if [ "$chars" -gt 200 ]; then pass "text extracted: $chars non-space characters -> $out_dir/text.txt"; else flag "text extraction: only $chars characters (image-only or broken PDF?)"; fi
if grep -q $'\xEF\xBF\xBD' "$out_dir/text.txt"; then flag "text contains replacement characters (broken glyph mapping)"; else pass "no replacement characters"; fi

# Fonts: every font embedded and Liberation Sans
pdffonts "$pdf" > "$out_dir/fonts.txt"
font_rows=$(tail -n +3 "$out_dir/fonts.txt")
if [ -z "$font_rows" ]; then
  flag "no fonts found (image-only PDF?)"
else
  not_embedded=$(echo "$font_rows" | awk '{ if ($(NF-4) != "yes") print $1 }')
  not_liberation=$(echo "$font_rows" | awk '{print $1}' | grep -v 'LiberationSans' || true)
  [ -z "$not_embedded" ] && pass "all fonts embedded" || flag "fonts not embedded: $not_embedded"
  [ -z "$not_liberation" ] && pass "all fonts are Liberation Sans" || flag "non-Liberation fonts: $not_liberation"
fi

# Render every page for visual review
pdftoppm -scale-to 1400 -png "$pdf" "$out_dir/page"
rendered=$(ls "$out_dir"/page*.png 2>/dev/null | wc -l | tr -d ' ')
if [ "$rendered" = "$pages" ]; then pass "rendered $rendered page image(s) -> $out_dir/page-*.png (inspect each one)"; else flag "rendered $rendered of ${pages:-?} pages"; fi

echo
if [ "$fail" -eq 0 ]; then
  echo "RESULT: mechanical checks passed. Now read text.txt and inspect every page image before handoff."
else
  echo "RESULT: one or more checks FAILED. The PDF is not ready for review."
fi
exit "$fail"
