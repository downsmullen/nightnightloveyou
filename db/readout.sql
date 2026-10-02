-- Weekly read-out.  npx wrangler d1 execute nnly-visits --remote --file db/readout.sql
-- "begin" = a real tap on "tap to begin" — the real-visitor number.

-- 1. Real visits per week, first-timers vs came back
SELECT strftime('%Y-W%W', day) AS week,
       SUM(n) AS visits,
       SUM(CASE WHEN came_back = 0 THEN n ELSE 0 END) AS first_day,
       SUM(CASE WHEN came_back = 1 THEN n ELSE 0 END) AS came_back
FROM counts WHERE event = 'begin' GROUP BY week ORDER BY week;

-- 2. How visits are used (share of visits, all time)
SELECT event, SUM(n) AS times,
       ROUND(100.0 * SUM(n) / (SELECT SUM(n) FROM counts WHERE event = 'begin'), 1) AS pct_of_visits
FROM counts GROUP BY event ORDER BY times DESC;

-- 3. Devices
SELECT device, SUM(n) AS visits FROM counts WHERE event = 'begin' GROUP BY device ORDER BY visits DESC;

-- 4. Top countries
SELECT country, SUM(n) AS visits FROM counts WHERE event = 'begin'
GROUP BY country ORDER BY visits DESC LIMIT 15;

-- 5. Last 14 days
SELECT day, SUM(n) AS visits FROM counts WHERE event = 'begin'
GROUP BY day ORDER BY day DESC LIMIT 14;
