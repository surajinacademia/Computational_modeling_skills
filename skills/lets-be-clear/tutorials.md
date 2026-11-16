# Tutorials

Short invented examples showing each branch of the `lets-be-clear` decision tree.

## 1. Vague intent with hidden holes (Clarify → Reframe with example → Execute)

**User:** "Compare my simulation to the FRAP experiment and check if the model works."

**Why the intent has holes:** "Check if the model works" leaves undefined whether parameters are locked or fitted and which observable defines agreement. Inspecting the workspace first reveals concrete facts the user needs before deciding.

**Agent:**

- **Intent as understood:** Test whether your diffusion simulation agrees with the experimental FRAP recovery measurements.
- **Holes, vagueness, and assumptions:** "Works" could mean out-of-sample prediction at fixed diffusivity or best-fit calibration, and could judge either recovery timescale or final plateau. Guessing for you would mix up curve-fitting with validation.
- **Facts for an informed decision:** `data/frap_recovery.csv` measures normalized recovery $F(t)/F_0$ at $t = 0, 5, 15, 60\,\mathrm{s}$ ($n = 8$ cells, mean $\pm$ SD) and plateaus near $0.82$ ($\sim 18\%$ immobile fraction). `results/sim_recovery.csv` uses fixed FCS diffusivity $D = 1.2\,\mu\mathrm{m}^2/\mathrm{s}$ assuming $100\%$ mobile fraction ($F/F_0 \to 1$).
- **Concrete options and recommendation:** (A) **Zero-fit timescale and plateau check** — compare fixed-$D$ raw $F(t)/F_0$ and plateau-normalized kinetics $(F(t)-F_0)/(F_{\infty}-F_0)$ against $1\,\mathrm{SD}$ to test diffusive rate separately from immobile binding; (B) **Two-parameter fit** — fit $D$ and mobile fraction to `frap_recovery.csv`, which calibrates parameters but cannot claim independent validation without held-out data. I recommend **(A)** first so you see whether independent $D$ already predicts the recovery rate.
- **Specify and confirm:** Do you want $1$ experimental SD as the agreement band, and do you confirm starting with the zero-fit comparison plan?

**User:** "I'm not sure whether plateau-normalizing hides a real model failure."

**Agent:** "Reporting both keeps the failure visible instead of hiding it: raw $F(t)/F_0$ flags the missing $\sim 18\%$ immobile fraction at $60\,\mathrm{s}$, while plateau-normalized recovery tests whether free molecules still diffuse at $D = 1.2\,\mu\mathrm{m}^2/\mathrm{s}$ or require anomalous transport. Do you confirm running both zero-fit checks against $1\,\mathrm{SD}$?"

**User:** "Yes, run both with $1\,\mathrm{SD}$ and keep $D$ fixed."

**Outcome:** With intent now precise, the agent computes both checks, verifies sample counts ($n = 8$), and reports that plateau-normalized kinetics stay within $1\,\mathrm{SD}$ while raw $F(60\,\mathrm{s})/F_0$ overshoots by $0.18$ under the stated $100\%$-mobile assumption.

## 2. Already-precise intent (No holes → Execute directly)

**User:** "Use $lets-be-clear. From `data/frap_recovery.csv`, compute mean and sample SD of `f_norm` at `t_s = 0, 5, 15, 60` across cells with `bleach_ok == True`."

**Why no pause is needed:** Input file, column, timepoints, filter, and statistic (`ddof=1` sample SD) are already unambiguous; asking follow-up questions would waste a turn.

**Outcome:** The agent states the exact specification (`ddof=1` across passing cells per timepoint), runs and checks the calculation immediately, and reports the four-row summary with retained cell counts.

## 3. Scope-only or delegated brief (Clarify → Confirm → Stop or return)

**User:** "Before editing code, help me lock a quick boundary-condition test brief for `src/diffusion_2d.py`."

**Agent:** Inspects `src/diffusion_2d.py` without editing files, notes that both `periodic` and `zero_flux` modes exist, explains what each test actually checks (periodic wrap tests seam symmetry of an off-center pulse; zero-flux tests conservation of total mass $\sum u\,\Delta x\Delta y$ to machine precision $< 10^{-12}$ over $100$ pure-diffusion steps), recommends testing the mode active in the user's runs first, and asks: "Which boundary mode should this test target, and do you confirm locking the test brief only?"

**User:** "Zero-flux mass conservation only. Lock that brief."

**Outcome:** The agent writes out the confirmed zero-flux mass-conservation brief (off-center Gaussian near one wall, zero reaction, stable $\Delta t$, relative mass drift $< 10^{-12}$ over $100$ steps) and stops because the brief itself was the requested deliverable; likewise, when `schematic-designer` or `model-documentation` delegates an unresolved brief, `lets-be-clear` returns the confirmed specification to that skill (reusing any matching brief already confirmed in the session).
