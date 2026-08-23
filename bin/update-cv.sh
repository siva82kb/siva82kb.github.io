#!/usr/bin/env bash
#
# update-cv.sh — copy the current CV PDF into the site and stamp its date.
#
# Copies $CV_DIR/$CV_FILE to <repo>/cv.pdf and updates `cv_updated:` in
# _config.yml to that file's month and year.
#
# The source filename is pinned deliberately: the CV folder holds several
# different documents (cv-sb.pdf, cv-sb-extnd.pdf, ...), and picking by
# timestamp would silently publish the wrong one if an older file is touched.
#
# Usage:
#   bin/update-cv.sh                 # copy the pinned CV
#   bin/update-cv.sh --dry-run       # show what would happen, change nothing
#   bin/update-cv.sh path/to/cv.pdf  # use a specific file instead
#   bin/update-cv.sh --latest        # newest cv*.pdf in the folder (opt-in)
#
# Overrides:  CV_DIR=/other/folder  CV_FILE=cv-other.pdf  bin/update-cv.sh

set -euo pipefail

CV_DIR="${CV_DIR:-$HOME/Documents/work/CV}"
CV_FILE="${CV_FILE:-cv-sb.pdf}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$REPO_ROOT/cv.pdf"
CONFIG="$REPO_ROOT/_config.yml"

DRY_RUN=0
USE_LATEST=0
EXPLICIT_SRC=""

for arg in "$@"; do
  case "$arg" in
    --dry-run|-n) DRY_RUN=1 ;;
    --latest)     USE_LATEST=1 ;;
    -h|--help)    sed -n '2,19p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*)           echo "unknown option: $arg" >&2; exit 2 ;;
    *)            EXPLICIT_SRC="$arg" ;;
  esac
done

# --- Locate the source PDF ------------------------------------------------

if [[ -n "$EXPLICIT_SRC" ]]; then
  SRC="$EXPLICIT_SRC"
  [[ -f "$SRC" ]] || { echo "error: no such file: $SRC" >&2; exit 1; }
else
  [[ -d "$CV_DIR" ]] || { echo "error: CV folder not found: $CV_DIR" >&2; exit 1; }

  if (( USE_LATEST )); then
    # Newest cv*.pdf by modification time. Handles spaces in filenames.
    SRC="$(find "$CV_DIR" -maxdepth 1 -type f -iname 'cv*.pdf' -print0 \
           | xargs -0 stat -f '%m %N' 2>/dev/null \
           | sort -rn | head -1 | cut -d' ' -f2-)"
    [[ -n "$SRC" ]] || { echo "error: no cv*.pdf found in $CV_DIR" >&2; exit 1; }
    echo "note: --latest picked this by timestamp, not by name."
  else
    SRC="$CV_DIR/$CV_FILE"
    if [[ ! -f "$SRC" ]]; then
      echo "error: pinned CV not found: $SRC" >&2
      echo "       set CV_FILE=... or pass a path explicitly." >&2
      exit 1
    fi
  fi
fi

# --- Sanity checks --------------------------------------------------------

if ! file -b "$SRC" | grep -qi '^PDF document'; then
  echo "error: not a PDF: $SRC" >&2
  exit 1
fi

SIZE=$(stat -f '%z' "$SRC")
if (( SIZE < 10000 )); then
  echo "error: suspiciously small ($SIZE bytes), refusing: $SRC" >&2
  exit 1
fi

PAGES=$(file -b "$SRC" | sed -n 's/.*, \([0-9]*\) pages*/\1/p')
STAMP=$(date -r "$SRC" '+%B %Y')
MTIME=$(date -r "$SRC" '+%Y-%m-%d %H:%M')

echo "source : $SRC"
echo "         ${SIZE} bytes, ${PAGES:-?} pages, modified $MTIME"
echo "dest   : $DEST"
echo "stamp  : cv_updated: $STAMP"

if [[ -f "$DEST" ]] && cmp -s "$SRC" "$DEST"; then
  echo
  echo "Already up to date — cv.pdf is identical to the source. Nothing to do."
  exit 0
fi

if (( DRY_RUN )); then
  echo
  echo "(dry run — nothing written)"
  exit 0
fi

# --- Copy and stamp -------------------------------------------------------

cp "$SRC" "$DEST"

if grep -q '^cv_updated:' "$CONFIG"; then
  # BSD sed needs the empty -i argument.
  sed -i '' "s/^cv_updated:.*/cv_updated: $STAMP/" "$CONFIG"
else
  echo "warning: no 'cv_updated:' line in $CONFIG — add one to show the date" >&2
fi

echo
echo "Copied. Review and commit:"
echo "  git add cv.pdf _config.yml && git commit -m 'Update CV ($STAMP)' && git push"
