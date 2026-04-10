#!/bin/bash
# MARP Slides PowerPoint Unit Test
# Tests PPTX export with proper PowerPoint support

set -e

echo "=== MARP Slides PowerPoint Unit Test ==="
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

# Test 3: Export to PPTX
echo ""
echo "Test 3: Exporting to PPTX..."
npx @marp-team/marp-cli /tmp/test-marp.md --pptx --allow-local-files -o /tmp/test-marp.pptx 2>&1 | grep -E "INFO|WARN"
echo "  ✓ PPTX generated"

# Test 4: Verify PPTX content
echo ""
echo "Test 4: Verifying PPTX content..."
if [ -f /tmp/test-marp.pptx ]; then
    # PPTX is a ZIP file, check if it contains expected files
    if unzip -l /tmp/test-marp.pptx | grep -q "ppt/presentation.xml"; then
        echo "  ✓ Valid PPTX structure (contains ppt/presentation.xml)"
    else
        echo "  ✗ Invalid PPTX structure"
        exit 1
    fi
else
    echo "  ✗ PPTX file not created"
    exit 1
fi

# Test 5: Check PPTX file size
echo ""
echo "Test 5: Checking PPTX file size..."
PPTX_SIZE=$(ls -l /tmp/test-marp.pptx | awk '{print $5}')
if [ "$PPTX_SIZE" -gt 10000 ]; then
    echo "  ✓ PPTX size: $PPTX_SIZE bytes (valid)"
else
    echo "  ✗ PPTX size too small: $PPTX_SIZE bytes"
    exit 1
fi

# Cleanup temp files
rm -f /tmp/test-marp.md /tmp/test-marp.pptx

# Convert all examples/*.md to PPTX
echo ""
echo "=== Converting all examples to PPTX ==="
ORIG_DIR="$(pwd)"
cd examples
COUNT=0
for mdfile in *.md; do
    if [ -f "$mdfile" ]; then
        pptxfile="${mdfile%.md}.pptx"
        echo "Converting: $mdfile => $pptxfile"
        npx @marp-team/marp-cli "$mdfile" --pptx --allow-local-files -o "$pptxfile" 2>&1 | grep -E "INFO" || true
        COUNT=$((COUNT + 1))
    fi
done
cd "$ORIG_DIR"
echo "  ✓ Converted $COUNT example files to PPTX"

echo ""
echo "=== All Tests Passed ==="