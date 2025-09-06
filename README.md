# Local Theme Dev

- Copy `.env.example` to `.env.local` and set your token (do NOT commit):
  - `SHOPIFY_STORE=f83av4-0j.myshopify.com`
  - `SHOPIFY_CLI_THEME_TOKEN=shptka_...`

- Export env vars in your shell, then run the helper:
  - `export $(grep -v '^#' .env.local | xargs)`
  - `chmod +x scripts/theme-dev.sh && ./scripts/theme-dev.sh`

Notes
- If your Shopify CLI doesn’t accept `--password`, run:
  - `shopify login --store f83av4-0j.myshopify.com`
  - `shopify theme dev --store f83av4-0j.myshopify.com --theme-editor-sync`

# Push Theme

- Export your env (you can reuse `.env.local` or `envlocal.env`):
  - `export SHOPIFY_STORE=f83av4-0j.myshopify.com`
  - `export SHOPIFY_CLI_THEME_TOKEN=shptka_a957bfc348b20aba82aff7e7c5b53516`

- Push as a draft (safe):
  - `chmod +x scripts/theme-push.sh && ./scripts/theme-push.sh`

- Push and publish live:
  - `./scripts/theme-push.sh --live`

Direct command (equivalent):
- `shopify theme push --store f83av4-0j.myshopify.com --password shptka_a957bfc348b20aba82aff7e7c5b53516 --live`
# ViralBeautyKit
