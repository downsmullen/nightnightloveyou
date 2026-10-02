-- Visitor tallies for the Storm page. One row per (day, event, came_back, device, country).
-- Run once:  npx wrangler d1 execute nnly-visits --remote --file db/schema.sql
CREATE TABLE IF NOT EXISTS counts (
  day       TEXT    NOT NULL,   -- UTC date, YYYY-MM-DD
  event     TEXT    NOT NULL,   -- begin | lightning | sleep_set | sleep_done | stay10
  came_back INTEGER NOT NULL,   -- 1 = this device first visited on an earlier day
  device    TEXT    NOT NULL,   -- phone | tablet | desktop
  country   TEXT    NOT NULL,   -- two-letter code from Cloudflare, XX if unknown
  n         INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (day, event, came_back, device, country)
);
