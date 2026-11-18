# Tutorials

One invented problem followed through the seven sections of `brainstorming`. The model, files, and numbers are illustrative.

## A hard problem: are the stripes robust to noise?

**Researcher:** "Let's figure it out. Add noise to my pattern-formation model and check that the stripes are robust."

### 1. Look before asking

- The agent reads `model/rhs.py` and `notebooks/stripes.ipynb` before replying.
- It finds a two-species reaction–diffusion model integrated with an explicit scheme at fixed time step $\Delta t$, started from a random perturbation of the uniform state, with a stripe wavelength near $\lambda \approx 12$ grid units.

### 2. Echo the request and ask why

**Agent:** "You want to know whether the stripe pattern persists when the model is noisy. Today the model is deterministic: the only randomness is the initial condition, and a noise term would enter the time stepper in `model/rhs.py`. One thing may change the request: with an explicit scheme, a multiplicative noise term can force a smaller $\Delta t$. What would you conclude, or do differently, if the stripes do not survive the noise?"

**Researcher:** "The experiments are noisy and still show stripes. If the model loses them, the mechanism is probably wrong."

### 3. Separate facts, open uncertainties, and decisions

**Agent:**

- **Facts:** the model is deterministic (`model/rhs.py`); the stripes form from a Turing instability of the uniform state (the notebook's dispersion relation); the wavelength is set by the fastest-growing mode.
- **Open uncertainties:** whether the present $\Delta t$ remains adequate with noise (settled by a time-step convergence run at the largest noise amplitude); whether one realization is representative (settled by repeating over independent noise realizations).
- **Decisions that are yours:** which source of noise in the experiment the model should represent, and what "robust" means quantitatively.

### 4. Find the blocking decision and surface assumptions

**Agent:** "The blocking decision is the source of noise, because it fixes where the term enters the equations. You said 'noise'; the request implies fluctuations in time; I would assume additive white noise in both species unless you say otherwise. An anti-goal follows from your purpose: a run that keeps stripes only because the noise amplitude is far below the experimental level would look like success and tell you nothing."

### 5. Recommend with reasoning

**Agent:**

- **Recommendation:** add additive white noise to the dynamics and measure the stripe wavelength and an order parameter over a range of amplitudes that brackets the experimental estimate. Your purpose is to test the mechanism against a noisy experiment, so the noise must act throughout the dynamics.
- **Not chosen: noise in the initial condition only.** The model already has it; it tests pattern selection, not persistence.
- **Not chosen: noise in the parameters.** It represents sample-to-sample variation, which is a different question from fluctuations within one sample.
- **Offer:** "A throwaway run at one amplitude would show whether $\Delta t$ needs to change before we fix the plan. Shall I run it?"

### 6. Ask, play back, and repeat

**Agent:** "What should count as robust: the wavelength staying within a tolerance, or the stripes remaining ordered?"

**Researcher:** "I don't know yet."

**Agent:** "A concrete case: at some amplitude the wavelength stays within 5% of 12 grid units but the stripes break into short segments. Would you call that pattern robust?"

**Researcher:** "No. In the experiment the stripes stay long."

**Agent:** "Then, playing it back: robust means both the wavelength within a tolerance and the stripe order parameter above a threshold. The tolerance and the threshold are my proposal until you set them. No blocking decision remains."

### 7. Agree and stop

**Agent:**

- **Solution:** additive white noise in the dynamics; scan the amplitude across the experimental estimate; report wavelength and stripe order over independent realizations.
- **Reasoning:** the purpose is to test the mechanism against a noisy experiment.
- **Anti-goal:** claiming robustness from amplitudes below the experimental level.
- **Assumptions:** white, additive noise in both species (the agent's proposal, accepted by the researcher); experimental noise level taken from the researcher's estimate.
- **Open uncertainties and their tests:** adequacy of $\Delta t$ (time-step convergence at the largest amplitude); number of realizations (increase until the mean order parameter stops changing within its standard error).
- **Decisions:** robust means wavelength within tolerance and order parameter above threshold (the researcher's definition).

"Do you confirm this agreement?"

**Researcher:** "Yes."

**Outcome:** the skill stops here. No file was written, and running the scan is a separate request.
