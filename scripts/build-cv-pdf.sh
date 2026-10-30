#!/usr/bin/env bash
# Render the profile homepage to a PDF CV with headless Chrome, using the site's print stylesheet.
# Usage: scripts/build-cv-pdf.sh [output.pdf]   (default: ~/Downloads/david-al-kanani-cv.pdf)
# Set CHROME to override the browser binary.
set -euo pipefail

cd "$(dirname "$0")/.."

target="${1:-$HOME/Downloads/david-al-kanani-cv.pdf}"
out="$(cd "$(dirname "$target")" && pwd)/$(basename "$target")"
chrome="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
port=1314
url="http://localhost:${port}/"

hugo server --port "$port" --baseURL "$url" --disableLiveReload --renderToMemory >/dev/null 2>&1 &
server=$!
trap 'kill "$server"' EXIT

for _ in $(seq 60); do
  curl -sf "$url" >/dev/null && break
  sleep 0.5
done
curl -sf "$url" >/dev/null || { echo "hugo server did not start" >&2; exit 1; }

# The virtual time budget lets the async-loaded stylesheets and web fonts apply before printing.
"$chrome" --headless --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=10000 --print-to-pdf="$out" "$url" 2>/dev/null

echo "CV written to $out"
