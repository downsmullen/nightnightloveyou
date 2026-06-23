# Neurodivergent relaxation & sensory design — research

_In-house deep-research pass (13 agents, adversarially fact-checked), 2026-06-23. Cross-check against Tim's Gemini Deep Research pass is **complete** — see the next section._

> **Calibration (from the research itself):** there are essentially **no controlled studies for this exact use case** (ND-specific, sleep-onset, rain+thunder). The specific dB/ms/Hz numbers below are **reasoned engineering starting points, not measured settings — tune by ear.**

## Cross-check — Gemini Deep Research vs in-house pass (2026-06-23)

Tim ran an independent Gemini Deep Research pass on the same question (delivered via the `+inbox`
front door; full capture in `_Outbox/2026-06-23-ambient-soundscape-and-visual-design-for-neurodive.md`).
The two passes are **strongly convergent** — high confidence on the shared conclusions.

**Both agree (locks these in):**
- **Thunder off / rain-only by default; thunder is opt-in.** Gemini: "default mix 100% Rain, 0% Thunder";
  "visual lightning toggled OFF by default."
- **Rain is the anchor** — continuous, steady, predictable, EQ'd toward pink/brown, harsh highs (>8–10 kHz)
  rolled off; it masks household transients so the ND nervous system can downregulate.
- **Thunder attack ≥ ~150–220 ms** to bypass the acoustic startle reflex (transients <15–25 ms reliably
  trigger it). Low-frequency distant rumble only; no mid/high "crack."
- **Separate stems, never merged** — independent rain/thunder (and optionally wind) sliders. Both passes
  frame user control as *the* primary nervous-system regulator (Snoezelen / Polyvagal).
- **Photosensitivity hard gates:** < 3 Hz flashes; luminance delta < ~20 cd/m²; flash area < 25% of screen;
  **never saturated red**; diffuse glow, never a strobe (WCAG 2.3.1 + ITU-R BT.1702).
- **Visuals:** low contrast, slow/sparse motion, soft edges (autistic surround-suppression / hMT+ load);
  quiet default volume (pediatric guidance: < ~50 dBA).

**Gemini added (worth folding in):**
- **Fade to _black_ for sleep** (not just dim) — blue light suppresses melatonin and ND kids run a delayed
  melatonin onset (DLMO shifted 45–90 min). Sleep timer should fade visuals to black, audio continuing.
- **An audio _gap_ is a reverse-transient that wakes you** — seamless looping isn't just anti-pop, it's
  anti-waking. No gaps.
- **Warm/amber > blue** for any night visuals (melatonin) — mild tension with a realistic bluish lightning
  glow; resolvable since lightning is off-by-default and brief.
- Richer mechanism backing: sensory-gating (P50/N100) deficits → keep audio low-information-density;
  stochastic-resonance effect sizes (white noise helps ADHD g≈0.25 but *harms* neurotypicals g≈−0.21,
  and harms the hyperactive subtype) → reinforces that a fixed mix harms a subset; user control is mandatory.

**No material contradictions** between the two passes. The only divergence is glow color (bluish-realistic
vs warm-for-melatonin), a design preference rather than a safety conflict.

### P0 — Safety (non-negotiable)

**Sound**
- **Default the whole scene to quiet, with headroom.** Target rain-bed peaks well below full scale (a reasoned starting point: ~−18 to −24 dBFS), and keep any thunder transient well under 0 dBFS. Loud-by-default is the highest-risk failure for an audience ~40% of whom perceive moderate levels as very loud ([PMC8349927](https://pmc.ncbi.nlm.nih.gov/articles/PMC8349927/)). For child users, cap perceived loudness in the soft-conversation range (~<50 dB at the listening position) ([AAP/Children's National](https://riseandshine.childrensnational.org/baby-sound-machines-and-hearing-loss/)).
- **Thunder OFF by default; opt-in, never opt-out** — especially for children given autism–epilepsy/hyperacusis co-occurrence.
- **No layer ever starts with a sharp transient.** Fade rain in/out, crossfade loops seamlessly, no clicks.

**Visuals**
- **Lightning ≤3 flashes per second, full stop** (WCAG 2.3.1). Realistically space strikes seconds apart.
- **Never saturated red** (this is an independent hard gate, not a softening lever) and **never a full-screen white strobe**. Use a soft, brief, diffuse bluish/soft-white glow *ramp*, dim and low-contrast against a not-fully-dark background, small-to-moderate area ([W3C 2.3.1](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold.html); [MDN](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)).
- **Show a brief plain-language photosensitivity note before the scene starts**, with the off/dim control reachable *before* any flash appears.

### P1 — Strongly evidence-aligned

**Sound**
- **Rain is the primary, dominant, continuous layer; thunder is an occasional, gentle accent** — mirroring the validated rain/water-led soundscape ratio ([PMC11726612](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11726612/)). It is the lowest-risk layer across both autism and ADHD.
- **Engineer every thunder event slow-onset and distant:** long attack/rise (reasoned target: hundreds of ms, ~300–800 ms — *not* a ms crack), low-frequency rumble emphasis, gentle decay, peak only *modestly* above the rain bed. Rise time is the single biggest startle lever ([Blumenthal 1986](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-8986.1986.tb00682.x)).
- **Never let thunder be a surprise.** Pre-signal it — a soft lightning glow a beat *before* the sound, and/or a slow audible swell — and keep events spaced. Forewarning cuts startle ~20–50% ([PMC4165748](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4165748/)).
- **Tame high-frequency content:** roll off harsh transient energy in thunder and sibilant hiss in rain; favour a warm, low-passed, distant timbre (enhanced pitch sensitivity + "high-pitched" as a top distress descriptor) ([PMC9547110](https://pmc.ncbi.nlm.nih.gov/articles/PMC9547110/)).
- **Keep the rain bed smooth and continuous**, not a tight obvious loop — impaired temporal resolution means machine-gun droplets overwhelm; reduced habituation means an audible loop may stay salient. Aim for a long, seamless, low-variation texture ([Frontiers auditory discrimination](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.651209/full); [eLife 36493](https://elifesciences.org/articles/36493)).

**Visuals**
- **Default dim, warm/neutral colour temperature, low contrast, minimal clutter**, with *no imperceptible flicker* — use steady CSS opacity/transform animation, not a flickering loop ([PMC8217662](https://pmc.ncbi.nlm.nih.gov/articles/PMC8217662/)).
- **Honour `@media (prefers-reduced-motion: reduce)`** — fall back to gentle opacity/brightness fades rather than removing ambiance ([W3C C39](https://www.w3.org/WAI/WCAG21/Techniques/css/C39)).
- **Avoid bold, repetitive, high-contrast patterns** (tight rain-streak gratings) — both an autistic-discomfort trigger and a pattern-seizure trigger.

**Controls (the most evidence-aligned lever of all)**
- **Control is first-class, not buried.** Separate, always-visible sliders for rain intensity and thunder frequency/loudness, plus a master that can take thunder to zero. The same thunder a child *dialed up* is fine; the one they can't control distresses ([MacLennan, PMC9213348](https://pmc.ncbi.nlm.nih.gov/articles/PMC9213348/)).
- **"Rain only / no thunder" is a prominent first-class preset** — and a strong candidate for the *default* in a sleep scene. It still delivers the core parasympathetic/masking benefit at the lowest risk.
- **Never auto-escalate or randomly spike.** If thunder is probabilistic, cap its maximum and keep it gentle so it can never ambush a sleeping child.
- **An instant, obvious "stop/quiet everything"** so a child or parent retains agency at all times.
- **Persist the user's settings across sessions** — same scene next visit supports the consistency autistic users rely on ([PMC12559169](https://pmc.ncbi.nlm.nih.gov/articles/PMC12559169/)). (This also fits an externalize-state design ethos.)

### P2 — Refinements

- **Offer simple presets** (e.g. gentle / steady / storm) so users who find a steadier *or* a more varied texture calming can self-select — don't assume one rhythm soothes everyone.
- **Offer a selectable spectral tilt** (warmer/darker vs brighter) under the rain, defaulting toward the softer low-frequency end. Label brown/dark options as *preference-driven, not evidence-backed* — brown noise has no controlled trials ([Healthline](https://www.healthline.com/health/adhd/brown-noise-adhd)).
- **Optional sleep timer / auto-fade** rather than loud all-night continuous play (mixed evidence; signals that continuous overnight noise can alter sleep architecture) ([Riedy et al.](https://www.sciencedirect.com/science/article/abs/pii/S1087079220301283); [PMC10722168](https://pmc.ncbi.nlm.nih.gov/articles/PMC10722168/)). Let the user choose continuous if they want it.
- **Optional slow, predictable colour/glow drift** for sensory-seekers, while keeping the safe minimal default — slow + predictable is the constraint, not "no change."
- **Honest framing in copy:** an optional comfort tool the user controls, *not* a therapy, sleep cure, or memory aid. Do not imply clinical benefit from a noise colour.

---

## 5. Open questions, thin evidence, and individual-variability caveats

- **No controlled studies exist for the exact use case.** There are essentially *no* ND-specific, sleep-onset (PSG/actigraphy) trials of rain+thunder — or even white/pink noise — in autistic or ADHD children at sleep volume. The ADHD noise evidence is about *attention/task performance*, not sleep; applying it to sleep onset is inferential. The autism behavioural-sleep meta-analysis didn't study sound at all.
- **The specific numbers are reasoned, not measured.** No controlled study pins down ideal attack times, dB peak caps, or frequency roll-off curves for soothing autistic listeners. The dBFS and attack-time figures above are engineering extrapolations from the distress/startle profile — treat them as *starting points to tune*, not validated settings.
- **A real unresolved tension.** Predictability/repetition is generally calming, yet reduced habituation means autistic brains may *not* tune out even predictable repeated sound — so a looping bed could stay salient. This is the strongest argument for user control over any fixed preset.
- **The control-reduces-felt-calm link is partly inferred.** The one controlled experiment that manipulated control found benefits in behaviour/attention but *null* on measured anxiety/affect/arousal ([Unwin 2022, PMC9340127](https://journals.sagepub.com/doi/full/10.1177/13623613211050176)). The intolerance-of-uncertainty/anxiety result is *correlational* (and comparable in NT samples), not causal ([Jenkinson, PMC7539603](https://pmc.ncbi.nlm.nih.gov/articles/PMC7539603/)). Snoezelen/MSE efficacy evidence is acknowledged in the literature as limited and methodologically weak. So "give control" is a sound *design principle*, not a proven clinical outcome.
- **Citation-accuracy corrections carried forward** (from the adversarial pass): the "nature sounds vs quiet" p-values belong to the [Stress 2024 meta-analysis](https://www.tandfonline.com/doi/full/10.1080/10253890.2024.2402519), not STOTE; the HRV soundscape was music-augmented vs a coffee-shop control with a commercial COI; the WCAG flash test is relative-luminance-based, not the "≥20 cd/m²" figure; saturated red is an independent hard gate.
- **Autism vs ADHD diverge — and that contrast is itself partly thin.** They pull in opposite directions on steady sound, and AuDHD combines both. The mechanistic autism-vs-ADHD sound contrast drew partly on a non-peer-reviewed clinical blog; the MBA/stochastic-resonance mechanism is itself now contested. Treat the contrast as directional.
- **Individual variability dominates.** Hyperacusis ~41% means a near-majority *don't* have it; hyper- and hypo-sensitivity can coexist; subtype, intellectual disability, age, gender, and arousal all shift responses. Touch (not sound) drove sleep disturbance in one autism study. Much pitch/discrimination data comes from lower-support-needs samples. **No single setting generalises safely** — which is precisely why user-adjustable intensity with a safe minimal default is the only robust recommendation. Population-level claims here must not be read as per-child predictions.

---

**Key source anchors** (highest-confidence, load-bearing): hyperacusis prevalence ([PMC8349927](https://pmc.ncbi.nlm.nih.gov/articles/PMC8349927/)); startle rise-time mechanism ([Blumenthal 1986](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-8986.1986.tb00682.x)); WCAG flash thresholds ([W3C 2.3.1](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold.html), [PMC11872230](https://pmc.ncbi.nlm.nih.gov/articles/PMC11872230/)); ADHD noise dissociation ([Nigg et al. 2024, JAACAP](https://www.jaacap.org/article/S0890-8567(24)00074-1/abstract)); control flips valence ([MacLennan, PMC9213348](https://pmc.ncbi.nlm.nih.gov/articles/PMC9213348/)); intolerance-of-uncertainty/anxiety link ([Jenkinson, PMC7539603](https://pmc.ncbi.nlm.nih.gov/articles/PMC7539603/)).

---

## Appendix — sources by research angle

### Autistic auditory sensory processing — hyper/hyposensitivity, auditory filtering/overload, sensitivity to sudden onsets/transients, loudness, and frequency content — and its implications for soothing/calming ambient sound design (onset/attack times, peak-level caps, frequency content, predictability/repetition).
Decreased sound tolerance (hyperacusis) is common in autism — roughly 40-43% current and ~60% lifetime prevalence — so the safe design default is a quiet, low-peak scene, not an immersive loud one. The acoustic features rated most distressing by autistic people and their families are loud, high-pitched, and sudden/transient sounds, with anticipation of a sound also triggering distress; this maps almost exactly to a thunderclap and argues for slow attack times, generous peak-level headroom/caps, restrained high-frequency content, and gentle pre-warning. Mechanistically, autistic auditory processing tends toward enhanced pitch (frequency) discrimination but impaired temporal resolution and notably reduced neural habituation/adaptation, even to predictable repeated sounds. Predictable, repetitive, slow material is generally calming and is the right design bias, but individual variability is large and reduced habituation means a sound that loops too tightly or sits too prominently may stay salient rather than fade — favoring controllability over any single "optimal" preset.
- **Decreased sound tolerance (hyperacusis) is common in autism — roughly 40-43% current prevalence and ~60% lifetime — so a calming scene for autistic users (including children) should default to quiet and low-peak rather than loud/immersive.** _(confidence: high)_
  - [Prevalence of Decreased Sound Tolerance (Hyperacusis) in Individuals with Autism Spectrum Disorder: A Meta-analysis (PMC8349927)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8349927/)
  - [Auditory symptoms and autistic spectrum disorder: A scoping review (PMC9547110)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9547110/)
- **The acoustic features autistic people rate most distressing are loud, high-pitched, and sudden/transient sounds — which describes a thunderclap precisely; sudden onsets are the highest-risk element and need slow attack and peak-level caps.** _(confidence: high)_
  - [Auditory symptoms and autistic spectrum disorder: A scoping review (PMC9547110)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9547110/)
  - [Prevalence of Decreased Sound Tolerance (Hyperacusis) in ASD: A Meta-analysis (PMC8349927)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8349927/)
- **Anticipation/unpredictability of a sound, not just the sound itself, drives distress — so an unsignalled thunderclap is worse than a foreseeable one; pre-warning and a predictable rhythm reduce the threat response.** _(confidence: medium)_
  - [Auditory symptoms and autistic spectrum disorder: A scoping review (PMC9547110)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9547110/)
- **Autistic auditory processing tends toward ENHANCED pitch/frequency discrimination but IMPAIRED temporal resolution (rapid/successive sounds) — meaning fine spectral detail is salient (favoring smooth, low-glare frequency content) while fast, transient, closely-spaced events are processed poorly and can overwhelm.** _(confidence: high)_
  - [Auditory Pitch Perception in ASD: A Systematic Review and Meta-Analysis (ASHA / JSLHR)](https://pubs.asha.org/doi/abs/10.1044/2022_JSLHR-22-00254)
  - [Auditory Discrimination in Autism Spectrum Disorder (Frontiers in Neuroscience)](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.651209/full)
- **Autistic brains show REDUCED neural habituation/adaptation to repeated sounds — they often stay responsive (or even increase response) where neurotypical brains tune out — so a continuous bed may remain salient rather than fading into the background, and 'set and forget loudness' assumptions don't hold.** _(confidence: high)_
  - [Reduced auditory cortical adaptation in autism spectrum disorder (eLife 36493)](https://elifesciences.org/articles/36493)
  - [Auditory Discrimination in Autism Spectrum Disorder (Frontiers in Neuroscience)](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.651209/full)
- **Predictable, repetitive, slow/structured sound is generally calming for autistic people and those with sensory sensitivities and is the right design bias — but the effect is variable and personalization matters more than any single preset.** _(confidence: medium)_
  - [Calming effects of repetition in music for children with sensory sensitivities: two experimental studies (ScienceDirect)](https://www.sciencedirect.com/science/article/pii/S0197455623001223)
  - [Auditory symptoms and autistic spectrum disorder: A scoping review (PMC9547110)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9547110/)
- **Autism and ADHD diverge in WHY sound is hard, so a one-size scene can fail one group: autism is dominated by intensity amplification + poor filtering + overload, whereas ADHD is dominated by inconsistent sensory gating/distractibility, and steady masking noise (white/pink/brown) that AIDS an ADHD user can be an unhabituating, persistent stressor for an autistic user.** _(confidence: medium)_
  - [Comparing Auditory Noise Treatment with Stimulant Medication on Cognitive Task Performance in Children with ADHD (PMC5011143)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5011143/)
  - [Navigating Auditory Sensitivity in Autistic and ADHD Adults (Myndset Therapeutics — clinical blog, not peer-reviewed)](https://www.myndset-therapeutics.com/post/navigating-auditory-sensitivity-in-autistic-and-adhd-adults)
  - _fact-check verdicts:_ supported, supported, supported

### Noise color (white, pink, brown) for calming, focus, and sleep — evidence in ADHD (white-noise / stochastic-resonance literature), in autism, and how these differ from neurotypical populations, with study-quality and contested-findings flags.
The strongest, most replicated finding in this space is a population dissociation, not a universal "noise is calming" effect: broadband noise (white/pink) tends to slightly IMPROVE attention/working-memory task performance in children with ADHD or elevated attention problems, while slightly IMPAIRING it in neurotypical peers — a pattern explained by the Moderate Brain Arousal / stochastic-resonance model (low-dopamine ADHD brains are under-aroused and benefit from added external noise). A 2024 systematic review/meta-analysis (Nigg et al., k=13, N=335) confirms a small but statistically significant ADHD benefit and a small non-ADHD decrement. However, the evidence is mostly on task/focus performance, not relaxation or sleep; effect sizes are small with high individual variability; brown noise (the type most popular online and most relevant to a low, grounding rain bed) has essentially zero controlled studies; the much-cited pink-noise sleep/memory literature is contested and uses phase-locked acoustic pulses (not continuous ambient sound) in older/cognitively-impaired adults rather than ND children; and autism-specific noise-color evidence is thin and preliminary. Net: noise color likely matters differently for ADHD vs NT users, but the design-relevant claim ("a particular color reliably calms ND people for sleep") is not well established — variability and personal control are the safer bets.
- **In ADHD/inattentive children, broadband noise (white, and likely pink) tends to slightly IMPROVE attention and working-memory task performance, while in neurotypical/attentive children it tends to slightly WORSEN it — a population dissociation, not a universal calming effect.** _(confidence: high)_
  - [Söderlund et al. 2007 — Listen to the noise: noise is beneficial for cognitive performance in ADHD (JCPP)](https://acamh.onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-7610.2007.01749.x)
  - [Söderlund et al. 2010 — Effects of background white noise on memory performance in inattentive school children (Behav Brain Funct, PMC2955636)](https://pmc.ncbi.nlm.nih.gov/articles/PMC2955636/)
  - [Different Effects of Adding White Noise on Cognitive Performance of Sub-, Normal and Super-Attentive School Children (PLOS One 2014)](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0112768)
  - [Effects of White Noise on Attentional Performance and On-Task Behaviors in Preschoolers with ADHD (IJERPH 2022, PMC9692615)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9692615/)
- **A 2024 systematic review and meta-analysis confirms a small but statistically significant benefit of white/pink noise on task performance in youth with ADHD or elevated attention problems, and a small detrimental effect in non-ADHD individuals.** _(confidence: high)_
  - [Nigg et al. 2024 — Systematic Review and Meta-Analysis: Do White/Pink Noise Help Task Performance in Youth With ADHD? (JAACAP)](https://www.jaacap.org/article/S0890-8567(24)00074-1/abstract)
  - [OHSU News — White, pink noise improve focus for children with ADHD, OHSU study shows (2024 institutional summary of the meta-analysis)](https://news.ohsu.edu/2024/08/09/white-pink-noise-improve-focus-for-children-with-adhd-ohsu-study-shows)
- **The proposed mechanism is the Moderate Brain Arousal (MBA) model via stochastic resonance — under-aroused, low-dopamine ADHD brains use added external noise to boost signal-to-noise ratio — but the requirement of stochastic resonance specifically is now contested.** _(confidence: high)_
  - [Stochastic resonance is not required for pink noise to have beneficial effects on ADHD-related performance? The moderate brain arousal model challenged (Neuropsychologia 2024)](https://www.sciencedirect.com/science/article/abs/pii/S0028393224001763)
  - [Söderlund et al. 2010 — MBA model description (PMC2955636)](https://pmc.ncbi.nlm.nih.gov/articles/PMC2955636/)
- **Brown noise — the color most popular online for ADHD focus/calm and the closest analog to a low, grounding rain bed — has essentially NO direct controlled studies; its reputation is anecdotal.** _(confidence: high)_
  - [Nigg et al. 2024 meta-analysis (no brown-noise studies included)](https://www.jaacap.org/article/S0890-8567(24)00074-1/abstract)
  - [Healthline — Brown Noise for ADHD: Is It Effective for Concentration?](https://www.healthline.com/health/adhd/brown-noise-adhd)
  - [ADDA — What Is Brown Noise and Can It Help People With ADHD?](https://add.org/brown-noise-adhd/)
- **The widely-cited 'pink noise improves deep sleep and memory' evidence does NOT support continuous ambient pink-noise sound — it comes from phase-locked acoustic stimulation (brief pulses timed to slow waves) in neurotypical/older/cognitively-impaired adults, and the effect is contested and declining across replications.** _(confidence: high)_
  - [Memory retention following acoustic stimulation in slow-wave sleep: a meta-analytic review of replicability and measurement quality (Frontiers in Sleep 2023)](https://www.frontiersin.org/journals/sleep/articles/10.3389/frsle.2023.1082253/full)
  - [Acoustic Enhancement of Sleep Slow Oscillations and Concomitant Memory Improvement in Older Adults (Papalambros et al., PMC5340797)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5340797/)
  - [Northwestern Now — Pink noise boosts deep sleep in mild cognitive impairment patients (2019)](https://news.northwestern.edu/stories/2019/06/pink-noise-boosts-deep-sleep-mild-cognitive-impairment-patients/)
- **Autism-specific evidence for any noise color being calming is thin and preliminary; the clinical rationale (steady broadband sound masks unpredictable sounds and reduces sensory overload/auditory hyperreactivity) is more established than dose-response evidence for which color helps.** _(confidence: medium)_
  - [Application of White Noise in Minors with Autism Spectrum Disorder (Behavioral Sciences / MDPI 2025)](https://www.mdpi.com/2076-328X/15/7/988)
  - [RCT of Behavioural Sleep Intervention 'Sleeping Sound' for Autistic Children: 12-Month Outcomes (PMC9684935)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9684935/)
- **Even within ADHD the response is variable and not guaranteed — some inattentive-leaning individuals benefit while more hyperactive/impulsive-leaning ones may do worse, and at least one recent study found no effect.** _(confidence: medium)_
  - [Jostrup et al. 2024 — No Effects of Auditory and Visual White Noise on Oculomotor Control in Children with ADHD (J Atten Disord / SAGE)](https://journals.sagepub.com/doi/10.1177/10870547241273249)
  - [Nigg et al. 2024 meta-analysis (subtype/individual variability context)](https://www.jaacap.org/article/S0890-8567(24)00074-1/abstract)
  - _fact-check verdicts:_ supported, supported, supported

### Why rain, thunder, and nature soundscapes are relaxing — psychophysiological mechanisms; whether thunder transients risk startle/sensory distress; neurodivergent-specific evidence; recommended rain-vs-thunder balance for relaxation/sleep.
Nature soundscapes relax people through a real, measurable autonomic shift — increased parasympathetic ("rest-digest") tone (higher HRV, lower heart/respiratory rate) and reduced stress markers — and rain specifically works as a steady, broadband/pink-noise-like masker that lets the brain relax its auditory vigilance. Thunder is mechanistically different and risk-bearing: its value as a soundscape accent comes from a slow, distant rumble, whereas a sharp, fast-onset crack is exactly the stimulus profile that triggers the brainstem acoustic startle reflex. This split matters more for neurodivergent users: autistic listeners commonly have auditory hypersensitivity, larger startle amplitude, and trouble filtering sudden/unpredictable sound, so unpredictable thunder transients carry elevated distress risk; ADHD presents almost the opposite pattern, where steady broadband noise (rain-like) can actually aid arousal and attention. The safe design default is rain-led and continuous, with thunder rare, distant, slow-onset, predictable, and user-controllable.
- **Nature soundscapes produce a genuine physiological relaxation response — a measurable shift toward parasympathetic ('rest-digest') dominance: higher heart-rate variability (HRV) and lower heart and respiratory rates — not just a subjective 'nice' feeling.** _(confidence: high)_
  - [Enhancing Psychophysiological Well-Being Through Nature-Based Soundscapes: HRV Cross-Over Study (Kumpulainen et al., Psychophysiology 2025, PMC)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11726612/)
  - [Effects of nature sounds on attention and physiological/psychological relaxation (ScienceDirect)](https://www.sciencedirect.com/science/article/pii/S1618866723001589)
- **Exposure to natural sounds reliably reduces stress and stress-linked physiology (heart rate, blood pressure, respiratory rate) versus quiet, across multiple studies; water/rain-type sounds are among the more potent stress reducers.** _(confidence: high)_
  - [Effects of natural sound exposure on health recovery: systematic review and meta-analysis (Science of the Total Environment, ScienceDirect)](https://www.sciencedirect.com/science/article/abs/pii/S0048969724011914)
  - [The effect of exposure to natural sounds on stress reduction: systematic review and meta-analysis (Stress, 2024)](https://www.tandfonline.com/doi/full/10.1080/10253890.2024.2402519)
  - [Preliminary evidence: stress-reducing effect of water sounds depends on somatic complaints — RCT (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC5842016/)
- **Steady rain works partly as a broadband/pink-noise masker: by filling the soundscape with consistent, predictable, low-information sound, it masks intrusive environmental noise and lets the brain relax its auditory vigilance, which aids sleep onset.** _(confidence: medium)_
  - [Pink Noise for Sleep: Benefits and How It Works (Sleep Foundation)](https://www.sleepfoundation.org/noise-and-sleep/pink-noise-sleep)
  - [Overnight exposure to pink noise could jeopardize sleep-dependent insight (PMC) — caveat on overstated memory claims](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10722168/)
- **A sharp thunderclap is mechanistically the WRONG kind of sound for relaxation: sudden, fast-onset loud transients trigger the brainstem acoustic startle reflex (cochlear nucleus → caudal pontine reticular nucleus → motor neurons), and that reflex is amplified by fear/threat via the amygdala. Rise time is the key lever — slow-onset, distant rumbles do not startle.** _(confidence: high)_
  - [Origin and function of short-latency inputs to the acoustic startle reflex substrate (PMC)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4110630/)
  - [Stimulus Rise Time, Intensity, and Bandwidth Effects on Acoustic Startle Amplitude and Probability (Blumenthal, Psychophysiology 1986)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-8986.1986.tb00682.x)
  - [Startle Response overview (ScienceDirect Topics)](https://www.sciencedirect.com/topics/neuroscience/startle-response)
- **Predictability and forewarning substantially blunt the startle/aversive response: anticipated or cued stimuli produce markedly weaker reactions than unexpected ones, and reducing anticipatory uncertainty lowers a stimulus's perceived intensity.** _(confidence: high)_
  - [Startle Response overview — anticipation/predictability modulation (ScienceDirect Topics)](https://www.sciencedirect.com/topics/neuroscience/startle-response)
  - [Startle modulation during emotional anticipation and perception (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC4165748/)
- **Autistic users carry elevated risk from thunder transients: auditory hypersensitivity is very common, startle amplitude tends to be larger, and they have specific difficulty filtering sudden/unpredictable sound from background — so unsignaled thunder is more likely to cause sensory distress than for neurotypical users.** _(confidence: medium)_
  - [Auditory Discrimination in Autism Spectrum Disorder (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8239241/)
  - [Prepulse Inhibition of the Acoustic Startle Reflex in High Functioning Autism (PLOS One)](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0092372)
  - [Meta-analysis of sensorimotor gating in autism spectrum disorders (ScienceDirect)](https://www.sciencedirect.com/science/article/abs/pii/S016517811730450X)
- **ADHD shows a partly OPPOSITE pattern: steady broadband noise (rain-like) can improve attention/working memory and reduce off-task/hyperactive behavior in children with ADHD, while the same noise gives neurotypical children no benefit or slight impairment — explained by the Moderate Brain Arousal / stochastic-resonance model (ADHD = under-aroused dopamine system needing more external noise).** _(confidence: medium)_
  - [Effects of White Noise on Attentional Performance and On-Task Behaviors in Preschoolers with ADHD (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9692615/)
  - [Listening to White Noise Improved Verbal Working Memory in Children with ADHD: A Pilot Study (PMC)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9223803/)
  - _fact-check verdicts:_ supported, mixed, supported

### Neurodivergent visual sensitivity: photosensitivity/strobe risk and safe thresholds (three-flash rule, Hz limits), gentle vs abrupt motion, brightness/contrast for calm, reduced-motion preferences, and autism-specific visual sensory considerations — for a gentle rain+thunder ambient relaxation/sleep scene including child users.
For a rain+thunder scene the dominant safety constraint is photosensitive-epilepsy risk from the lightning flashes: the seizure-provoking band is roughly 3-60 Hz (peak sensitivity ~16 Hz), so the universal safe rule is no more than three flashes in any one-second window, kept dim, low-contrast, small-area, and never saturated red. This matters more than usual here because the audience is neurodivergent and includes children — epilepsy co-occurs with autism, photosensitive epilepsy peaks at ages 8-25, and a large majority of autistic people report light/visual hypersensitivity (flicker, glare, high contrast, sudden change). The evidence strongly favors low/warm/dim brightness, slow and predictable motion over abrupt motion, honoring prefers-reduced-motion, and — most design-relevant — giving the user control over the sensory intensity. Individual variability is large (some autistic/ADHD users are sensory-seeking, not avoiding), so the safe default is calm-and-minimal with user-adjustable intensity rather than a fixed preset.
- **The three-flash rule is the load-bearing safety constraint: never present more than three flashes (e.g. lightning strikes) in any one-second period. The seizure-provoking frequency band is roughly 3-60 Hz with peak sensitivity around 16 Hz, and 5-30 Hz is the most dangerous range; flashing below 3 Hz is the consensus 'safe' rate.** _(confidence: high)_
  - [Understanding SC 2.3.1: Three Flashes or Below Threshold | W3C WAI](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold.html)
  - [International Guidelines for Photosensitive Epilepsy: Gap Analysis and Recommendations (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11872230/)
  - [Web accessibility for seizures and physical reactions | MDN](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)
- **Beyond flash count, a lightning flash is only hazardous when it is bright, high-contrast, large-area, and/or saturated red — so keeping flashes dim, low-contrast, small-area, and avoiding saturated red keeps them below the hazard threshold even at borderline timing.** _(confidence: high)_
  - [Understanding SC 2.3.1: Three Flashes or Below Threshold | W3C WAI](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold.html)
  - [Web accessibility for seizures and physical reactions | MDN](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)
  - [International Guidelines for Photosensitive Epilepsy: Gap Analysis and Recommendations (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11872230/)
- **Child users raise the stakes: photosensitive epilepsy onsets and peaks in childhood/adolescence (most common ages 8-25, mean onset ~14), it is more common in females, and epilepsy co-occurs with autism — so a kids' neurodivergent sleep scene should treat photosensitivity as a real risk, not an edge case.** _(confidence: high)_
  - [International Guidelines for Photosensitive Epilepsy: Gap Analysis and Recommendations (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11872230/)
  - [Light Sensitivity and Autism Spectrum Disorder | TheraSpecs](https://www.theraspecs.com/blog/light-sensitivity-autism/)
- **A large majority of autistic people report visual/light hypersensitivity, and the specific triggers map directly onto storm-scene risks: imperceptible flicker, glare/high brightness, high contrast, repetitive patterns, and sudden visual change/motion. Warm, dim, low-contrast, low-flicker visuals are reported as calming.** _(confidence: high)_
  - [Visual Sensory Experiences From the Viewpoint of Autistic Adults (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8217662/)
  - [Light and sound hypersensitivity in autism: a systematic review | Frontiers in Psychiatry](https://www.frontiersin.org/journals/psychiatry/articles/10.3389/fpsyt.2026.1771956/full)
  - [Light Sensitivity and Autism Spectrum Disorder | TheraSpecs](https://www.theraspecs.com/blog/light-sensitivity-autism/)
- **Gentle, slow, predictable motion is far better tolerated than abrupt motion; abrupt onset and motion across the visual field are specific stressors. The scene should honor the OS-level prefers-reduced-motion preference and degrade non-essential animation gracefully (e.g. fade rather than move).** _(confidence: high)_
  - [Understanding SC 2.3.3: Animation from Interactions | W3C WAI](https://www.w3.org/WAI/WCAG21/Understanding/animation-from-interactions)
  - [C39: Using CSS prefers-reduced-motion to prevent motion | W3C WAI](https://www.w3.org/WAI/WCAG21/Techniques/css/C39)
  - [Visual Sensory Experiences From the Viewpoint of Autistic Adults (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8217662/)
- **User control over sensory intensity is the single most design-relevant lever: multi-sensory (Snoezelen-style) environments support calming and self-regulation in autism specifically when the user can control and predict the sensory changes, rather than having intensity imposed.** _(confidence: medium)_
  - [Use of multisensory environments in autism: a systematic review (Autism, 2025)](https://journals.sagepub.com/doi/10.1177/13623613251320424)
  - [Multi-Sensory Environments with autistic children: effect of having control of sensory changes (Autism, 2022)](https://journals.sagepub.com/doi/full/10.1177/13623613211050176)
  - [Snoezelen Rooms: Is There Science Behind That? | ASAT](https://asatonline.org/for-parents/becoming-a-savvy-consumer/snoezelen-rooms-is-there-science-behind-that/)
- **Sensory response is bidirectional and highly individual: some autistic and ADHD users are sensory-seeking (find slow color/motion change soothing or even regulating) while others are sensory-avoiding, and the ADHD brain in particular under-filters background visual motion, so the same animated detail can calm one user and distract/overwhelm another.** _(confidence: medium)_
  - [Light Sensitivity and Autism Spectrum Disorder | TheraSpecs](https://www.theraspecs.com/blog/light-sensitivity-autism/)
  - [ADHD Overstimulation: An Expert's Guide on Management](https://www.adhdadvisor.org/learn/adhd-overstimulation)
  - _fact-check verdicts:_ supported, mixed, supported

### Neurodivergent (autistic / ADHD) children and sleep onset: which soundscapes and sensory conditions help vs harm sleep onset in ND children specifically.
Sleep-onset insomnia is the single most common sleep complaint in autistic and ADHD children (overall sleep-disturbance prevalence ~40-80%), so a gentle ambient sleep scene is targeting a real, high-prevalence need. The strongest mechanistic case for sound *helping* is in ADHD: low-tonic-arousal ("Moderate Brain Arousal" / stochastic-resonance) models predict that steady broadband noise can benefit attention-deficit profiles, and small trials show white noise improving sleep-onset latency and cognition in inattentive children. Autism cuts the other way and demands caution: decreased sound tolerance (hyperacusis) is roughly 4-7x more common than in the general population, so any sound that is unpredictable, too loud, or has sudden transients risks being aversive rather than soothing for a meaningful subset. Across all children the general-population evidence for continuous noise as a sleep aid is mixed and low-quality, with real signals that high-intensity or all-night continuous noise can alter sleep architecture (reduced REM/N1) — so the safe design is user-controllable, low-volume, smooth, optional, and not assumed-beneficial. Individual variability is the dominant theme: the same soundscape that settles one ND child overstimulates another, which argues for control and personalization over a fixed "calming" preset.
- **Sleep-onset difficulty (delayed sleep initiation / settling) is the most common sleep problem in autistic and ADHD children, with overall sleep-disturbance prevalence around 40-80% in autism — so a sleep/relaxation scene is addressing the dominant, highest-prevalence ND sleep complaint.** _(confidence: high)_
  - [Effectiveness of non-pharmacological interventions for insomnia in children with ASD: systematic review and meta-analysis (PMC6705823)](https://pmc.ncbi.nlm.nih.gov/articles/PMC6705823/)
  - [Sleep Disturbances and Behavioral Problems in Children and Adolescents with ASD — A Systematic Review (MDPI)](https://www.mdpi.com/2039-7283/15/11/201)
- **The strongest theoretical case for sound HELPING sleep/regulation is specific to ADHD: under-aroused (low-dopamine) ADHD brains can benefit from steady broadband noise via stochastic resonance, whereas the same noise can be neutral or even degrade performance in typically-developing children — i.e., the noise benefit is profile-dependent, not universal.** _(confidence: medium)_
  - [Söderlund et al., Listen to the noise: noise is beneficial for cognitive performance in ADHD (J Child Psychol Psychiatry; PubMed)](https://pubmed.ncbi.nlm.nih.gov/17683456/)
  - [Explaining the Moderate Brain Arousal model (Söderlund & Sikström, ICBEN)](https://www.icben.org/2008/PDFs/Soederlund_Sikstroem.pdf)
  - [Comparing Auditory Noise Treatment with Stimulant Medication on Cognitive Task Performance in Children with ADHD (Frontiers in Psychology)](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2016.01331/full)
- **Autism pushes the opposite direction and is the main HARM risk: decreased sound tolerance (hyperacusis) is far more common in autistic people than in the general population — pooled current prevalence ~41% (lifetime ~61%; ~49% on gold-standard ADI-R) vs ~6-9% of general adults and ~3-17% of children — so a non-trivial fraction of autistic users may find ambient sound aversive rather than calming.** _(confidence: high)_
  - [Prevalence of Decreased Sound Tolerance (Hyperacusis) in Individuals with ASD: A Meta-analysis (PMC8349927)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8349927/)
- **Sound is NOT automatically the dominant sensory lever for autistic sleep onset — in at least one direct study, tactile (touch) hypersensitivity drove sleep disturbance while auditory and visual sensitivities did not — so audio is one helpful channel, not a guaranteed fix, and a sound-led scene should not be assumed to resolve ND sleep-onset problems on its own.** _(confidence: medium)_
  - [Sleep disturbances are associated with specific sensory sensitivities in children with autism (PMC5872526)](https://pmc.ncbi.nlm.nih.gov/articles/PMC5872526/)
- **Direct autism evidence for white/ambient noise is early and mixed-positive: a 2025 study in 54 autistic minors found overall positive behavioral/self-regulation effects (reduced motor restlessness, better attention/emotional stability), BUT tolerance varied by individual and was lower in autistic children without intellectual disability — reinforcing that benefit is conditional and aversion is real for some.** _(confidence: medium)_
  - [Application of White Noise in Minors with Autism Spectrum Disorder (Behavioral Sciences / MDPI; PubMed 40723772)](https://pubmed.ncbi.nlm.nih.gov/40723772/)
- **Whether a child finds ambient noise helpful vs aversive is moderated by their own noise perception and developmental traits, not just diagnosis — so a one-size 'calming' preset is the wrong model; controllability/personalization is the evidence-aligned design.** _(confidence: medium)_
  - [The Influence of Noise Perception and Parent-Rated Developmental Characteristics on White Noise Benefits in Children (Audiology Research / MDPI)](https://www.mdpi.com/1995-8692/19/1/18)
- **General (not ND-specific) evidence that continuous noise reliably aids sleep is mixed and of low quality, and high-intensity or all-night continuous noise can alter sleep architecture — high-volume white noise can reduce REM, and continuous overnight pink noise reduced early-cycle (N1) time and impaired sleep-dependent insight — so a sleep scene should be low-volume, smooth, and ideally auto-off, not loud-and-continuous-by-default.** _(confidence: medium)_
  - [Riedy et al., Noise as a sleep aid: A systematic review (Sleep Medicine Reviews)](https://www.sciencedirect.com/science/article/abs/pii/S1087079220301283)
  - [Overnight exposure to pink noise could jeopardize sleep-dependent insight and pattern detection (PMC10722168)](https://pmc.ncbi.nlm.nih.gov/articles/PMC10722168/)
- **Sound-machine VOLUME is a concrete safety constraint for child users: keep ambient audio low (AAP/clinical guidance ~<50 dB, generally under 60 dB for prolonged use) and avoid loud continuous output, since machines at max volume close to a child can exceed 85 dB (the adult occupational hearing-protection threshold).** _(confidence: high)_
  - [Baby sound machines and hearing loss — Children's National (Rise and Shine), summarizing AAP guidance](https://riseandshine.childrensnational.org/baby-sound-machines-and-hearing-loss/)
  - _fact-check verdicts:_ supported, supported, supported

### User control and predictability of the sensory environment is itself calming for neurodivergent people (sensory rooms / Snoezelen, self-regulation, controllability).
There is consistent, multi-strand evidence that *control* and *predictability* over a sensory environment are themselves regulating for neurodivergent people — often mattering more than the specific stimulus. The single best-supported finding is the autism–intolerance-of-uncertainty link (meta-analysis r=0.62), which means a predictable, controllable scene is calming partly because it removes uncertainty. First-person autistic accounts and a controlled experiment both show the *same* sensory input flips from aversive to pleasant when the person controls its onset/intensity. Snoezelen/multisensory-room evidence points the same way (control and individual customization improve outcomes) but is weaker — small, heterogeneous studies, no RCT-grade guidelines, and mixed results specifically on anxiety/affect. Autism and ADHD both benefit from predictability/structure, but for somewhat different reasons (autism: uncertainty/sensory load; ADHD: agency and self-directed control), and individual variability is large.
- **Intolerance of uncertainty is strongly and consistently linked to anxiety in autistic people, so a predictable, low-surprise environment is itself anxiety-reducing — this is the strongest evidence in this angle.** _(confidence: high)_
  - [Jenkinson et al. 2020 - The relationship between intolerance of uncertainty and anxiety in autism: a systematic review and meta-analysis (Autism / PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC7539603/)
- **The SAME sensory input is experienced as calming/pleasant when the person controls its onset and intensity, but aversive when it is imposed or unpredictable. Control is a moderator of valence, not just a preference.** _(confidence: high)_
  - [MacLennan et al. - In Our Own Words: The Complex Sensory Experiences of Autistic Adults (J Autism Dev Disord, PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9213348/)
- **Giving autistic children direct control over sensory changes in a multisensory environment reduced repetitive/stereotyped behaviors, sensory behaviors and stereotyped vocalizations and increased attention vs. an uncontrolled condition — but did NOT significantly change measured anxiety, positive affect, or arousal.** _(confidence: high)_
  - [Unwin et al. 2022 - The effect of control of sensory changes in multi-sensory environments (Autism / SAGE)](https://journals.sagepub.com/doi/pdf/10.1177/13623613211050176)
- **Multisensory (Snoezelen) environments can foster comfort, positive emotion and reduced aggression/stereotypy for autistic people, and individually customized + user-controlled setups outperform standardized ones — but the overall evidence base is weak and mixed on anxiety specifically.** _(confidence: medium)_
  - [Leonardi et al. 2025 - The use of multisensory environments in children and adults with ASD: a systematic review (Autism / PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC12255839/)
- **Predictability and a controllable, structured environment support self-regulation and reduce anxiety for ADHD people too — but the driver leans toward agency/autonomy and reducing surprise during transitions rather than sensory load per se.** _(confidence: medium)_
  - [Situating emotion regulation in autism and ADHD through neurodivergent adolescents' perspectives (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC12559169/)
- **In applied/clinical settings, self-directed sensory spaces let neurodivergent and psychiatric users actively self-manage distress and agitation, with relaxation, reduced anxiety and emotional regulation the most commonly reported benefits — reinforcing that the act of self-regulating in a controllable space is the calming mechanism.** _(confidence: medium)_
  - [Implementation of a Sensory Room in a Psychiatric Intensive Care Unit: A Mixed-Methods Study (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC12314344/)
- **A controllable, predictable soundscape (e.g. user-set volume, steady masking sound) is a well-recognized auditory self-regulation strategy for autistic people — they actively generate predictable controllable sound to mask unpredictable input.** _(confidence: medium)_
  - [Intervention technology of aural perception controllable headset for children with ASD (Scientific Reports / PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11825718/)
  - _fact-check verdicts:_ mixed, supported, supported