#!/usr/bin/env bash
set -euo pipefail
keep_branches=("main" "feat/homepage-parity" "feat/fix-ci-required-files")
git checkout main && git pull --ff-only
for b in $(git branch --format='%(refname:short)'); do
  skip=0; for k in "${keep_branches[@]}"; do [[ "$b" == "$k" ]] && skip=1; done
  [[ $skip -eq 0 ]] && git branch -D "$b" || true
done
for rb in $(git branch -r | sed 's|origin/||' | sort -u); do
  skip=0; for k in "${keep_branches[@]}"; do [[ "$rb" == "$k" ]] && skip=1; done
  [[ $skip -eq 0 ]] && git push origin --delete "$rb" || true
done
git fetch --prune
echo "Branches after cleanup:" && git branch -vv
