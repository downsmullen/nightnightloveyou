// Visitor count for the Storm page (Tim, 2026-10-02 — see docs/tracking-and-donate-plan.md).
// Receives the page's fire-and-forget beacon and adds 1 to a daily tally row in D1.
// Stores no per-visit record, no IP, no ID: only (day, event, came-back, device, country) -> n.
// Always answers 204, whatever happens — the page never cares about the reply.

const EVENTS  = new Set(['begin', 'lightning', 'sleep_set', 'sleep_done', 'stay10']);
const DEVICES = new Set(['phone', 'tablet', 'desktop']);

export async function onRequestPost({ request, env }) {
  const done = new Response(null, { status: 204 });
  try {
    const db = env.VISITS;           // D1 binding, set in the Cloudflare Pages dashboard
    if (!db) return done;

    // Only beacons sent by the page itself (browsers always send Origin on a POST).
    const url = new URL(request.url);
    const origin = request.headers.get('Origin');
    if (!origin || new URL(origin).host !== url.host) return done;

    const q = url.searchParams;
    const event = q.get('e');
    const device = q.get('d');
    const back = q.get('r') === '1' ? 1 : 0;
    if (!EVENTS.has(event) || !DEVICES.has(device)) return done;

    const cc = request.cf && request.cf.country;
    const country = /^[A-Z]{2}$/.test(cc || '') ? cc : 'XX';
    const day = new Date().toISOString().slice(0, 10);   // UTC day

    await db.prepare(
      `INSERT INTO counts (day, event, came_back, device, country, n)
       VALUES (?1, ?2, ?3, ?4, ?5, 1)
       ON CONFLICT (day, event, came_back, device, country) DO UPDATE SET n = n + 1`
    ).bind(day, event, back, device, country).run();
  } catch (e) {}
  return done;
}
