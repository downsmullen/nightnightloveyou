# Storm scene — v2 spec

_Status: DRAFT for review. Owner: Tim. Branch: `storm-v2`._

## Context
The Storm scene is live at **nightnightloveyou.com** (Cloudflare Pages, auto-deploys on push to `main`).
This is the first refinement round, driven by Tim's review of the live site. Goals: make it calmer
and more clearly *relaxing*, more visible (the stars), fix audio quality (the popping), promote
**rain** to a first-class layer, and keep the multi-scene groundwork intact.

This is also a deliberate **spec → plan → code → merge** practice rep.

## Decided changes (this Work Package)

1. **Remove the "Recorded" engine.** Delete the Synth/Recorded segmented control, the placeholder
   caption, `RECORDED_CLIP_DATA_URI`, `bakeRecordedPlaceholder()`, `playRecorded()`, and the
   `bakedClip`/`recordedClip` plumbing. One synth path only — simpler graph, simpler UI.
   _(Parked, not lost: a real recorded clip stays a future option — see Non-goals.)_

2. **Add a rain bed.** Continuous, synth-generated rain to keep the zero-dependency rule:
   filtered white noise for the steady hiss + sparse higher-frequency "patter", looping
   **seamlessly** (no clicks). Built on the existing noise infrastructure; lives under the
   existing "scene seam" as a layer alongside the lightning.

3. **Independent Rain + Lightning toggles.**
   - **Lightning** toggle = the strike system (drawn bolts + sky-glow + thunder synth).
   - **Rain** toggle = the rain bed.
   - Matrix: both on = full storm · rain only = calm rain, no strikes · lightning only = dry
     thunderstorm · both off = silent, still, starlit sky (the visual sky/stars always remain).
   - **Default = rain only, lightning one tap away** (Tim's decision, 2026-06-23). Both toggles
     exist and behave identically; the scene simply opens with rain on and lightning off, matching
     the evidence that thunder should be opt-in for child users.

4. **Make the stars visible.** They already exist and render every frame; they're just drawn as
   sub-pixel (0.25–1.35px), low-alpha dots on a near-black sky, so they wash out. Fix: enforce a
   minimum on-screen size (≥1px after DPR), raise brightness/contrast, add a few brighter "hero"
   stars. Keep it tasteful — a quiet night sky, not a garish starfield.

5. **De-pop the audio** (Tim's "over-amped speaker / old-record" noise — diagnosed from the code):
   - **Add a limiter** — a `DynamicsCompressorNode` on the master before `destination`. Right now
     the master is a bare gain of 1.0, so overlapping thunders (3–5 noise taps each) **plus** the
     convolution-reverb tail sum past ±1 and hard-clip → the crackle.
   - **Make the noise loop-seamless** — the thunder body loops a 3 s brown-noise buffer whose start
     and end samples don't match, so every loop has a step discontinuity → the periodic click.
     Fix by crossfading the seam or using one-shot buffers long enough to avoid looping.
   - Sanity-check cumulative gains so the dry + wet sum stays in range.

6. **Resolve the "top text" report.** _[OPEN — pending Tim's clarification.]_ There is no dedicated
   wordmark at the top in the current code; the only text is the "tap to begin" overlay (which
   includes "night night, love you" and is meant to fade to nothing on start). Likely the
   begin-overlay fade transient or an incomplete hide on Tim's device. Confirm what/when he sees
   it, then fix the legibility/visibility.

## Research-informed tuning & safety (in-house pass complete; Gemini cross-check pending)
Full report: [docs/research-nd-relaxation.md](research-nd-relaxation.md). **Calibration from the
research itself:** there are no controlled studies for this exact use case, so the specific dB/ms/Hz
numbers below are **reasoned starting points, not measured — tune by ear.**

**Safety (treat as non-negotiable — the audience is children):**
- **Quiet by default, with headroom.** Rain peaks well below full scale (~−18 to −24 dBFS to start);
  thunder transients well under 0 dBFS; cap perceived loudness around soft-conversation level.
- **No layer ever starts with a sharp transient** — fade in/out; crossfade loops seamlessly (this is
  also the de-pop fix from #5).
- **Thunder slow-onset and distant** — long rise (~300–800 ms, never a ms crack), low-frequency
  rumble emphasis, gentle decay, peak only modestly above the rain; roll off harsh highs (warm,
  low-passed, distant timbre).
- **Pre-signal every strike** — visual glow a beat before the sound (the scene already flashes then
  rumbles; keep / slightly lengthen that lead). Forewarning measurably reduces startle.
- **Visual:** flashes ≤3/sec (WCAG); glow soft, brief, diffuse, bluish; **never saturated red, never
  a full-screen white strobe**; honor `prefers-reduced-motion`; show a brief photosensitivity note
  before the scene, with the off/dim control reachable **before** any flash.
- **Always-available, obvious "quiet everything" / stop** so a child or parent keeps agency.

**Rain-led (evidence + your instinct):** rain is the primary, dominant, continuous layer; thunder is
an occasional gentle accent. Keep the rain bed a long, seamless, low-variation texture — a tight,
obvious loop stays salient for autistic listeners (reduced habituation), so avoid an audible loop.

**Cross-check — Gemini Deep Research + in-house pass agree (2026-06-23):** thunder off by default;
rain-led; separate rain/thunder stems; thunder attack ≥ ~200 ms (both passes; lean to the longer,
distant end); flashes < 3 Hz, luminance delta < ~20 cd/m², < 25% of screen, never saturated red;
user control as the primary regulator. Refinements the cross-check added:
- **Sleep timer should fade visuals to _black_** (not just dim) while audio continues — blue light
  delays melatonin, and ND kids already run a delayed melatonin onset.
- **Seamless loop matters twice over** — beyond the de-pop fix, an audio _gap_ is a reverse-transient
  that can wake an ND sleeper. No gaps, ever.
- **Palette call (yours):** the current lightning glow is bluish (realistic). Warm/amber is better for
  melatonin; lightning is off-by-default and brief so bluish is probably fine, but a warm night palette
  for the rain/sky is an option worth weighing.

## Scope additions for v2 (Tim's decisions, 2026-06-23)
**IN — building these in v2:**
- **Separate controls for rain vs thunder** (intensity / loudness per layer) — replaces the single
  "intensity" slider. The research's single most evidence-aligned lever (user control).
- **Remember settings across sessions** (localStorage) — persist rain/thunder/volume/timer choices;
  supports the consistency autistic users rely on.
- **Sleep timer / auto-fade** — optional gentle fade-out after a chosen duration; continuous still
  available.
- **Honest copy** — frame it as a comfort tool the user controls, not therapy / sleep-cure / memory aid.

**PARKED (not lost — revisit later):**
- Presets (gentle / steady / storm) + a selectable warmer/darker spectral tilt.

## Carry-forward design constraints (unchanged — keep true forever)
- **One self-contained file** — no network, fonts, CDN, or build step; runs offline via `file://`.
  The file is the 50-year bet, not the host.
- **Beautiful with the sound off** — muted by default; visual-first (accessibility / Tim's hearing loss).
- **No harsh strobe** — keep the sky-glow cap; honor `prefers-reduced-motion`; respect WCAG
  three-flash safety.
- **Keep the scene seam** so rain / ocean stay swappable siblings.

## Non-goals (parked, tracked elsewhere)
The legacy-message / significant-dates engine; the email "front door"; a real recorded-audio clip;
a separate home/hub landing page.

## Verification (how we'll know v2 is done)
- Load over `file://` → network panel shows **zero** external requests.
- Stars are visibly present on a normal screen in normal room light — and not garish.
- Toggle matrix behaves: rain-only / lightning-only / both / neither; **default opens rain-only** (lightning one tap away).
- Separate rain/thunder controls each work; settings **persist across reload**; sleep-timer fade works.
- Audio: several minutes including high-intensity overlapping strikes → **no** popping, clipping,
  or periodic seam clicks; the on-canvas thunder meter still tracks.
- `prefers-reduced-motion` honored; works fully muted; mobile + desktop.

## Process
spec (this doc) → plan → code (on `storm-v2`) → PR → merge to `main` → Cloudflare auto-deploys.
