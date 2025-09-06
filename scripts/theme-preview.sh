#!/usr/bin/env bash
set -euo pipefail
store=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --store) store="$2"; shift 2 ;;
    *) shift ;;
  esac
done
if [[ -z "$store" ]]; then
  read -r -p "Shopify store domain (e.g. mystore.myshopify.com): " store
fi
if [[ -z "${store}" ]]; then echo "Missing store"; exit 1; fi
shopify theme list --store "$store" | awk '/unpublished/ {print $1}'
