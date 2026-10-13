#!/usr/bin/env bash
set -euo pipefail

# Dev-only: link every skill in this repo into local skill directories so that
# a `git pull` keeps them current. Plugin installs do not use this script.
# Override the destinations with SKILL_LINK_DESTS (colon-separated paths).

REPO="$(cd "$(dirname "$0")/.." && pwd)"
IFS=':' read -r -a DESTS <<< "${SKILL_LINK_DESTS:-$HOME/.claude/skills:$HOME/.codex/skills}"

status=0
for DEST in "${DESTS[@]}"; do
  mkdir -p "$DEST"
  for src in "$REPO"/skills/*/; do
    src="${src%/}"
    [ -f "$src/SKILL.md" ] || continue
    target="$DEST/$(basename "$src")"
    # A real directory may hold a hand-edited copy: leave it for the user.
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "skip $target: not a symlink; move it aside and re-run" >&2
      status=1
      continue
    fi
    ln -sfn "$src" "$target"
    echo "linked $target -> $src"
  done
done
exit "$status"
