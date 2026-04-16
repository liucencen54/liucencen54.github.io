#!/usr/bin/env bash
set -euo pipefail

if command -v bundle >/dev/null 2>&1; then
  exec bundle exec jekyll liveserve --host 0.0.0.0
fi

if command -v docker >/dev/null 2>&1; then
  exec docker run --rm \
    -p 4000:4000 \
    -v "$PWD":/srv/jekyll \
    jekyll/jekyll:pages \
    jekyll serve --host 0.0.0.0 --livereload
fi

echo "bundle or docker is required to preview this site locally." >&2
exit 1
