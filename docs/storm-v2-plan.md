# Storm scene — v2 implementation plan

_Status: DRAFT for review. Pairs with [storm-v2.md](storm-v2.md) (the spec) and
[research-nd-relaxation.md](research-nd-relaxation.md). Branch: `storm-v2`._

## Approach
A single-file refactor of `index.html` — keep the IIFE structure, the `Storm` "scene seam", and the
design contract (no deps, beautiful muted, no harsh strobe). Steps are ordered **subtractive → audio
bus → new audio → state/UI → visual → tuning → sleep/persistence → safety → verify**, each one a
discrete, testable change so we can eyeball it before moving on. Line numbers below are against the
current committed file.

---

## Step 1 — Strip the "Recorded" engine (subtractive; do first)
Simplifies everything downstream to one audio path.
- **HTML:** remove the Synth/Recorded segmented control and its caption (`index.html:113`–`118`).
- **JS:** delete `RECORDED_CLIP_DATA_URI` (`:136`–`137`), `bakeRecordedPlaceholder()` (`:336`),
  `playRecorded()` (`:350`), the `bakedClip`/`recordedClip` vars (`:188`–`189`), the bake/fetch block
  in `initAudio()` (`:244`–`252`), `setEngine()` + `engSyn`/`engRec` wiring (`:595`–`601`,`:579`–`580`),
  and `state.engine` (`:144`).
- **`fireThunder()`** (`:527`) collapses to always call `renderThunder(...)`.
- **Test:** scene still loads and storms; no console errors; control panel no longer shows Synth/Recorded.

## Step 2 — Master limiter + seamless noise (the de-pop foundation)
Everything else rides this clean bus, so do it before adding rain.
- **Limiter:** in `initAudio()` insert a `DynamicsCompressorNode` between the summing gain and the
  analyser: `master → compressor → analyser → destination` (`:223`–`231`). Limiter-style settings
  (starting point: threshold ≈ −6 dB, knee ≈ 6, ratio ≈ 12, attack ≈ 3 ms, release ≈ 250 ms). This
  kills the overlapping-thunder + reverb clipping (the "over-amped" crackle).
- **Seamless noise:** rework `makeNoise()` (`:191`) so looped buffers don't click at the seam — apply
  a short equal-power crossfade between the buffer's tail and head (and remove residual DC on the brown
  buffer). Fixes the periodic "old-record" pop and is reused by the rain bed.
- **Test:** run several minutes at high intensity with overlapping strikes → no crackle, no periodic
  click; the thunder meter still tracks.

## Step 3 — Rain bed (the new continuous layer)
The anchor layer; rain-led per both research passes.
- New `startRain()` / `stopRain()` + a `rainGain` node. Build rain from a **looping, seam-crossfaded
  noise buffer** shaped toward **pink/brown**: lowpass/shelf to roll off harsh highs (>8–10 kHz),
  gentle low-mid warmth, **low dynamic range** (steady, predictable). Optional second sparse "patter"
  layer via a band-pass + slow random amplitude drift — kept gentle.
- Hook into the `Storm` scene object (`:556`): `start()` begins rain if `state.rain`; `stop()` tears it down.
- **Test:** rain alone is smooth, continuous, warm; no audible loop point; sits quietly under thunder.

## Step 4 — State + controls restructure (rain/lightning toggles, per-layer levels)
- **State** (`:142`): replace `{intensity, engine, muted}` with
  `{ rain:true, rainLevel:~0.5, lightning:false, lightningLevel:~0.3, muted:false, timer:'off' }`.
  **Default = rain on (soft), lightning off** (Tim's decision + both research passes).
- **Panel UI** (`:107`–`119`): **Rain** on/off toggle + Rain level slider; **Lightning** on/off toggle +
  Lightning level/frequency slider; keep the prominent **"Quiet everything"** button (the old mute,
  relabeled) as the always-reachable instant-stop.
- **Wiring:** Lightning toggle gates `autoStrike()`/`manualStrike()` (`:534`,`:548`); Rain toggle calls
  `startRain()`/`stopRain()`; level sliders drive `rainGain`/lightning intensity.
- **Test:** the four states behave — rain-only / lightning-only / both / neither; defaults to rain-only;
  "Quiet everything" silences instantly.

## Step 5 — Stars visibility
They exist but render sub-pixel and faint.
- **`buildStars()`** (`:166`): raise base alpha (≈ 0.3–0.9), keep density modest.
- **`drawSky()`** (`:459`): draw each star at a **minimum ~1px** (after DPR) as a soft round dot
  (small `arc`/radial gradient, not a sub-pixel `fillRect`); add a handful of brighter "hero" stars.
  Tasteful night sky, not a garish field. Stars stay visible in rain-only mode.
- **Test:** stars clearly visible on a normal screen in normal room light; not harsh.

## Step 6 — Thunder tuning (distant, slow, rain-led)
Refine `renderThunder()` (`:264`) to the research numbers (reasoned starting points — tune by ear):
- **Attack ≥ ~200 ms** on every thunder element (current swell ≈ 180–230 ms is close; nudge the rumble
  taps `:308` and sub `:329` to ≥ 200 ms; lean toward the longer, distant end).
- Keep it **low-frequency and distant**, peaks only modestly above the rain bed (rain-led mix), harsh
  highs rolled off. Pre-signal stays as-is (visual glow precedes the rumble via `autoStrike` delay `:539`).
- **Test:** even at "wild", thunder never snaps — slow, soft, distant; never louder than a gentle accent over rain.

## Step 7 — Sleep timer + fade-to-black
- **Sleep timer** control: Off / 15 / 30 / 60 min. At expiry, gently **fade audio + visuals out** and
  stop. **Default Off** (continuous allowed — user's choice).
- **Dim-to-black:** after ~30 s of no pointer/key interaction, fade the canvas to **black while audio
  continues** (kills blue light for sleep onset); any interaction restores. Implement as a `fade` factor
  applied in `frame()` (`:480`); audio untouched.
- **Test:** timer fades out and stops on schedule; screen goes black after inactivity, audio keeps
  playing, tap restores.

## Step 8 — Remember settings (localStorage)
- Save `state` (rain/lightning on, levels, timer, muted) on any control change; restore on load before
  `Storm.start()`. Wrap in try/catch so a blocked `localStorage` never breaks the scene (offline/file:// safe).
- **Test:** set rain low + lightning on, reload → settings persist; private-mode/no-storage still runs.

## Step 9 — Begin overlay: photosensitivity note, "top text", reachable controls
- Add a brief, plain-language line to the `#begin` overlay (`:121`): contains optional gentle lightning
  (off by default), sound starts soft — so the dim/off controls are known and reachable **before** any flash
  (satisfied anyway since lightning is off by default).
- **Resolve the "top text" report** _[still OPEN — pending Tim]_: confirm it's the begin-overlay fade and that
  `#begin.hide` (`:63`) fully removes it on his device; fix legibility/visibility once confirmed.
- **Test:** overlay reads clearly and fully disappears after "begin"; no lingering black-on-black text.

## Step 10 — Verification pass (spec + research safety gates)
- `file://` load → **zero** network requests.
- Stars visible; toggle matrix correct; default rain-only.
- Audio: minutes of overlapping high-intensity strikes → no pop/clip/seam-click; **no audio gaps** (a gap
  wakes ND sleepers); "Quiet everything" instant.
- Photosensitivity: flashes < 3 Hz, glow diffuse/small/dim, **no saturated red, no full-screen white**.
- `prefers-reduced-motion` honored; works fully muted; settings persist; sleep timer + dim-to-black work;
  mobile + desktop.

---

## Open / parked (carried from the spec)
- **OPEN:** the "top text" — needs Tim's confirmation of what/when he sees it (Step 9).
- **PARKED:** warm/amber night palette vs the current bluish glow (design call); presets (gentle/steady/storm)
  + spectral tilt.

## Then
code on `storm-v2` → PR → merge to `main` → Cloudflare auto-deploys.
