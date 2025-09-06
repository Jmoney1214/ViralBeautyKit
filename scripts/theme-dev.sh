#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   export SHOPIFY_STORE="f83av4-0j.myshopify.com"
#   export SHOPIFY_CLI_THEME_TOKEN="shptka_..."  # DO NOT COMMIT
#   ./scripts/theme-dev.sh

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

# Try token-based auth if provided; otherwise rely on interactive login session
if [[ -n "${TOKEN}" ]]; then
  echo "Starting theme dev for ${STORE} using token auth..."
  # Some CLI versions accept --password for Theme Access tokens.
  # If it fails, the CLI will print a helpful message; fallback to interactive login.
  exec shopify theme dev --store "${STORE}" --password "${TOKEN}" --theme-editor-sync
else
  echo "No SHOPIFY_CLI_THEME_TOKEN provided. Using interactive login/session..."
  exec shopify theme dev --store "${STORE}" --theme-editor-sync
fi

