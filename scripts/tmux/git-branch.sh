#!/bin/bash
cd "$1" 2>/dev/null || exit 0
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$branch" ]; then
  echo " $branch"
fi
