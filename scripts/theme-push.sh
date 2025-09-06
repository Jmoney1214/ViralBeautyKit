#!/usr/bin/env bash
set -euo pipefail

# Usage examples:
#   export SHOPIFY_STORE="f83av4-0j.myshopify.com"
#   export SHOPIFY_CLI_THEME_TOKEN="shptka_a957bfc348b20aba82aff7e7c5b53516"
#   ./scripts/theme-push.sh --live      # push and publish live
#   ./scripts/theme-push.sh             # push as an unpublished draft (safe)
# Optional:
#   export SHOPIFY_THEME_NAME="ViralBeautyKit Draft"  # to avoid interactive name prompt for new draft

if ! command -v shopify >/dev/null 2>&1; then
  echo "Shopify CLI not found. Install via: brew tap shopify/shopify && brew install shopify-cli" >&2
  exit 1
fi

STORE="${SHOPIFY_STORE:-}"
TOKEN="${SHOPIFY_CLI_THEME_TOKEN:-}"
THEME_NAME="${SHOPIFY_THEME_NAME:-}"
# Prefer staging theme id, fallback to generic theme id
THEME_ID="${SHOPIFY_STAGING_THEME_ID:-}"
if [[ -z "${THEME_ID}" && -n "${SHOPIFY_THEME_ID:-}" ]]; then
  THEME_ID="${SHOPIFY_THEME_ID}"
fi

if [[ -z "${STORE}" ]]; then
  echo "Missing SHOPIFY_STORE env var (e.g., f83av4-0j.myshopify.com)." >&2
  exit 1
fi
if [[ -z "${TOKEN}" ]]; then
  echo "Missing SHOPIFY_CLI_THEME_TOKEN env var (Theme Access token)." >&2
  exit 1
fi

# Determine destination flags
DEST_ARGS=()
if [[ -n "${THEME_ID}" ]]; then
  # Target a specific existing theme to avoid creating new drafts
  DEST_ARGS+=(--theme "${THEME_ID}")
  echo "Pushing to existing theme ID ${THEME_ID} on ${STORE}..."
else
  LIVE_FLAG="--unpublished"
  if [[ "${1:-}" == "--live" ]]; then
    LIVE_FLAG="--live"
  fi
  DEST_ARGS+=(${LIVE_FLAG})
  if [[ -n "${THEME_NAME}" && "${LIVE_FLAG}" == "--unpublished" ]]; then
    DEST_ARGS+=(--theme "${THEME_NAME}")
  fi
  echo "Pushing to ${STORE} (${LIVE_FLAG})..."
fi

# Run push without echoing secrets
shopify theme push \
  --store "${STORE}" \
  --password "${TOKEN}" \
  "${DEST_ARGS[@]}"

echo "Done."
