# nightnightloveyou.com

A small, quiet place. Built to last — every page is a single self-contained file
with no dependencies, no build step, and nothing loaded from anywhere, so it runs anywhere
(including offline) and is meant to keep working for decades.

One exception (2026-10-02): after "tap to begin", the Storm page sends small
fire-and-forget beacons to this site's own `/api/hello` so real visitors can be counted.
No ID, no cookie, no third party; skipped offline. Plan and reasoning:
`docs/tracking-and-donate-plan.md`.

## Pages / scenes

- **`index.html`** — *Storm*: a calm thunderstorm. Drawn forked lightning with a
  procedural, relaxing (distant) thunder synth. Works beautifully muted. Tap to begin;
  tap the sky for your own bolt.

## Visitor count

- `functions/api/hello.js` — Cloudflare Pages Function; adds 1 to a daily tally in D1.
- `db/schema.sql` — the one table. `db/readout.sql` — the weekly read-out:

      npx wrangler d1 execute nnly-visits --remote --file db/readout.sql

## Hosting

Static files served by Cloudflare Pages, auto-deployed on push to `main`. No server,
no cost. Domain: nightnightloveyou.com.
