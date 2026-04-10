#!/bin/bash
# MARP Slides PDF Unit Test
# Tests PDF export with proper HTML support

set -e

echo "=== MARP Slides PDF Unit Test ==="
echo ""

# Test 1: Check marp-cli is installed
echo "Test 1: Checking marp-cli installation..."
if command -v npx &> /dev/null; then
    MARP_VERSION=$(npx @marp-team/marp-cli --version 2>&1 | head -1)
    echo "  ✓ $MARP_VERSION"
else
    echo "  ✗ marp-cli not found"
    exit 1
fi

# Test 2: Create test file with CSS classes
echo ""
echo "Test 2: Creating test slide with CSS classes..."
cat > /tmp/test-marp.md << 'EOF'
---
marp: true
theme: default
paginate: true
title: Unit Test
style: |
  @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Raleway:wght@100;200;300&display=swap');
  :root {
    --a: #ff6b1a; --bg: #000; --s: #080808; --b: #111;
    --m: #555; --t: #fff; --g: #22c55e; --body: #999; --label: #666;
  }
  section { background: var(--bg); color: var(--t); font-family: 'Raleway', sans-serif; padding: 56px 72px; }
  h1 { font-family: 'Outfit'; font-weight: 800; font-size: 3em; color: var(--t); }
  h2 { font-family: 'Raleway'; font-weight: 100; font-size: 1.3em; color: #888; }
  .card { background: var(--s); border: 1px solid var(--b); border-radius: 10px; padding: 18px; }
  .metric-label { font-size: 0.6em; color: var(--m); text-transform: uppercase; }
  .metric-value { font-size: 2em; font-weight: 800; color: var(--t); }
  .flex-row { display: flex; gap: 14px; }
  .flex-1 { flex: 1; }
---

# Unit Test

## Metrics Test

<div class="flex-row">
  <div class="flex-1 card">
    <div class="metric-label">Revenue</div>
    <div class="metric-value">$45,000</div>
  </div>
  <div class="flex-1 card">
    <div class="metric-label">Customers</div>
    <div class="metric-value">1,234</div>
  </div>
</div>
EOF
echo "  ✓ Test file created"

# Test 3: Export to PDF with --html flag
echo ""
echo "Test 3: Exporting to PDF with --html flag..."
npx @marp-team/marp-cli /tmp/test-marp.md --pdf --allow-local-files --html -o /tmp/test-marp.pdf 2>&1 | grep -E "INFO|WARN"
echo "  ✓ PDF generated"

# Test 4: Verify PDF content
echo ""
echo "Test 4: Verifying PDF content..."
if command -v pdftotext &> /dev/null; then
    TEXT=$(pdftotext /tmp/test-marp.pdf - 2>/dev/null)
    if echo "$TEXT" | grep -qi "Revenue"; then
        echo "  ✓ 'Revenue' text found"
    else
        echo "  ✗ 'Revenue' text NOT found"
        echo "  PDF content: $TEXT"
        exit 1
    fi
    if echo "$TEXT" | grep -q "45,000"; then
        echo "  ✓ '45,000' text found"
    else
        echo "  ✗ '45,000' text NOT found"
        exit 1
    fi
    if echo "$TEXT" | grep -q "style="; then
        echo "  ✗ Raw HTML 'style=' found in PDF (rendering issue)"
        exit 1
    else
        echo "  ✓ No raw HTML tags in PDF"
    fi
else
    echo "  ⚠ pdftotext not available, skipping content verification"
fi

# Test 5: Check PDF file size
echo ""
echo "Test 5: Checking PDF file size..."
PDF_SIZE=$(ls -l /tmp/test-marp.pdf | awk '{print $5}')
if [ "$PDF_SIZE" -gt 10000 ]; then
    echo "  ✓ PDF size: $PDF_SIZE bytes (valid)"
else
    echo "  ✗ PDF size too small: $PDF_SIZE bytes"
    exit 1
fi

# Cleanup temp files
rm -f /tmp/test-marp.md /tmp/test-marp.pdf

# Convert all examples/*.md to PDF
echo ""
echo "=== Converting all examples to PDF ==="
cd examples
COUNT=0
for mdfile in *.md; do
    if [ -f "$mdfile" ]; then
        pdffile="${mdfile%.md}.pdf"
        echo "Converting: $mdfile => $pdffile"
        npx @marp-team/marp-cli "$mdfile" --pdf --html --allow-local-files -o "$pdffile" 2>&1 | grep -E "INFO" || true
        COUNT=$((COUNT + 1))
    fi
done
cd ..
echo "  ✓ Converted $COUNT example files to PDF"

echo ""
echo "=== All Tests Passed ==="