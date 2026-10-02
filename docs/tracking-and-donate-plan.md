# Visitor counting + a donate link — plan (2026-10-02)

> Status: **APPROVED 2026-10-02 — Phase 1 (counting) built on branch, not yet live — needs Cloudflare setup (below) then merge. Phase 2 (donate link) waits ~4 weeks for numbers.**
> Source: the donations study, section 7 (`TDM_Vault/reviews/phone-market-research-2026-10-02/10-donations-and-tips.md`).
> Decisions here are dated direction, re-arguable.

## What the study says, for this page

- **Expect pocket money.** Rough guess: $0.40–$5 a month per 1,000 *real* visitors, from one quiet link. (estimate, thin data)
- **Bots skew the count.** About half of web traffic is bots. Cloudflare's built-in request counts include them. Every donation estimate multiplies by the real-human number, so that number comes first.
- **The ask that fits a calm page:** one small text link, never a pop-up, never before the first tap, never while the storm plays. Concrete framing works ("keeps this page running").
- **A plain link keeps the contract.** An `<a href>` loads nothing until tapped. Widgets, iframes and button scripts would break the no-network-calls rule.

## The core tension

The page's design contract says **"no network calls — runs offline by double-click."**
- Cloudflare's own Web Analytics script is an outside call. **Ruled out by the contract.**
- Cloudflare's dashboard numbers need no code but count bots too.
- The cleanest real-human signal is the **"tap to begin" moment** — bots almost never tap. Counting that needs one small call back to the site itself.

## Phase 0 — look at what's already there (no code)

- Read the Cloudflare dashboard numbers for nightnightloveyou.com (requests, visits, countries, last 30 days). This is a baseline that includes bots.
- Tim's to do or hand me the screen (it's his account).

## Phase 1 — count real visitors (needs Tim's yes on the contract change)

**What changes:** when someone taps "tap to begin", the page sends one tiny message to its own address (`/api/hello`). Nothing goes to any other company. Offline or on a double-clicked copy it fails silently and the storm runs exactly as now.

**What gets recorded, per tap — nothing that identifies a person:**
- day
- first visit on this device, or returning (a "seen before" flag kept on the device in the same storage the page already uses for settings — no ID ever leaves the device)
- rough country (Cloudflare provides this; no IP stored)
- phone / tablet / desktop
- optionally: which features got turned on (lightning, thunder, sleep timer) and whether the sleep timer ran out — a "fell asleep to it" signal

**No cookies, no IDs, no IP addresses, no third parties.** "Who uses the site" means counts and patterns, never individuals. Children are the audience, so this line is firm.

**How it's built (mechanical — mine once approved):**
- A `functions/api/hello.js` file. Cloudflare Pages runs it next to the page.
- Storage: Cloudflare's Workers Analytics Engine or a small D1 table. Free-tier limits **need checking** before choosing.
- A short read-out: a script or a query I run that prints weekly numbers (real taps, returning share, countries, devices).
- Contract text in `index.html` and the README updated to say exactly what's sent and why.

**What it shows after ~4 weeks:** real humans per month, how many come back, how they use it. That number replaces every guess in the donations estimate.

## Phase 2 — the donate link (evaluation, then maybe build)

**Decision gate:** with Phase 1 numbers, the study's estimate becomes a real range. Example: 2,000 real monthly visitors → roughly $1–$10 a month. Tim judges whether that's worth a link on this page. One read: even small, a link costs almost nothing and some people want to say thanks.

**If yes:**
- **One plain text link** — no script, no widget. Loads nothing until tapped.
- **Where:** a small dim line at the bottom of the controls panel (only visible after "tap to begin"), e.g. *"made by one person · free, no ads, no tracking of you · help keep it running"*. Never on the start screen, never a pop-up, never during the scene by itself.
- **Kid-safety:** the link opens a payment page that needs an adult's card anyway. Could add "for grown-ups" wording.
- **Service:** Tim's call, and his account to create (Ko-fi, a Stripe Payment Link under TDM Technologies LLC, GitHub Sponsors, Liberapay). Fewest steps for the giver matters most (Dwarf Fortress doubled income by cutting steps).
- **Measure it:** count taps on the link through the same Phase 1 call (still no IDs).
- **License note:** the site is CC BY-NC-ND. A donation link is fine; it doesn't sell the work.

## Decisions (Tim, 2026-10-02 — re-arguable)

1. Contract change: **yes** — one same-site, fail-silently call, starting at "tap to begin".
2. "Returning" flag on the device: **yes**.
3. Feature-use counts (lightning, sleep timer finishing): **yes**.
4. Donate link: **wait ~4 weeks** for real numbers.
5. Donate service: open until the link is a yes.

**Follow-up:** calendar event Fri 2026-10-30, 10:00 Central — "nightnightloveyou.com — 4-week visitor results + donate-link call". Slide it if counting goes live later than early October.

## Calls that were Tim's (original questions)

1. **Contract change:** allow one same-site, fail-silently call on "tap to begin"? Or stay with dashboard-only numbers (bots included)?
2. **"Returning" flag** on the device: OK, or count first visits only?
3. **Feature-use details** (lightning on, sleep timer ran out): count them, or keep it to visits only?
4. **Donate timing:** wait ~4 weeks for real numbers, or add the link now alongside counting?
5. **Donate service** — later, only if the link goes ahead.

## Guards

- No outside calls, ever, from page load.
- No personal data stored; nothing tied to a person or device ID.
- The page works identically offline and as a double-clicked file.
- No accounts created or payment pages set up by me.
- Nothing ships to `main` (which auto-deploys) without Tim's go.

## Phase 1 — build status (2026-10-02)

Built and tested locally, **not committed, not live.**
- Page: `count()` in `index.html` — events `begin`, `lightning`, `sleep_set`, `sleep_done`, `stay10` (still playing after 10 min; added as the study's time-on-page "real person" signal — easy to drop).
- Server: `functions/api/hello.js` → D1 table in `db/schema.sql`. Read-out: `db/readout.sql`.
- Tested: function against real SQLite (bad origin / bad values / no binding all ignored); in browser, nothing sent before the tap, each event once, "came back" flag right, nothing sent off a non-website copy.

**Cloudflare setup — Tim's account, before merge:**
1. Create a D1 database named `nnly-visits` (dashboard: Storage & Databases → D1, or `npx wrangler d1 create nnly-visits`).
2. Create the table: paste `db/schema.sql` into the D1 console, or `npx wrangler d1 execute nnly-visits --remote --file db/schema.sql`.
3. Pages project → Settings → Bindings → add D1 binding, variable name **`VISITS`**, database `nnly-visits` (Production).
4. Merge to `main` → auto-deploys. Until step 3 is done the function quietly does nothing, so order isn't fragile.
5. Write down the go-live date; slide the Oct 30 calendar event to 4 weeks after it if needed.
