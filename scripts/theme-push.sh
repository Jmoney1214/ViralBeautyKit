#!/usr/bin/env bash
set -euo pipefail

# Usage examples:
#   export SHOPIFY_STORE="f83av4-0j.myshopify.com"
#   export SHOPIFY_CLI_THEME_TOKEN="shptka_a957bfc348b20aba82aff7e7c5b53516"
#   ./scripts/theme-push.sh --live      # push and publish live
#   ./scripts/theme-push.sh             # push as an unpublished draft (safe)

if ! command -v shopify >/dev/null 2>&1; then
  echo "Shopify CLI not found. Install via: brew tap shopify/shopify && brew install shopify-cli" >&2
  exit 1
fi

STORE="${SHOPIFY_STORE:-}"
TOKEN="${SHOPIFY_CLI_THEME_TOKEN:-}"

if [[ -z "${STORE}" ]]; then
  echo "Missing SHOPIFY_STORE env var (e.g., f83av4-0j.myshopify.com)." >&2
  exit 1
fi
if [[ -z "${TOKEN}" ]]; then
  echo "Missing SHOPIFY_CLI_THEME_TOKEN env var (Theme Access token)." >&2
  exit 1
fi

LIVE_FLAG="--unpublished"
if [[ "${1:-}" == "--live" ]]; then
  LIVE_FLAG="--live"
fi

echo "Pushing theme to ${STORE} (${LIVE_FLAG})..."
set -x
shopify theme push \
  --store "${STORE}" \
  --password "${TOKEN}" \
  ${LIVE_FLAG}
set +x
echo "Done."

