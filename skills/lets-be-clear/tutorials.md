# Tutorials

These conversations are invented examples.

## An oscillating system: help the user figure it out

**User:** "Use $lets-be-clear. Solve an oscillating system using simple harmonic motion or another appropriate model. The object starts away from equilibrium and may have some initial velocity. There could be damping or an external force, but assume whatever is reasonable. Find the motion, frequency, energy, and anything else important. Use the given parameters if necessary, and explain the result without making too many assumptions."

**Why the prompt needs work:** The model is undecided, no parameters are supplied, and the prompt invites assumptions while asking to minimize them. Only the user knows the physical context; the governing equation and solution method belong to the agent.

**Bad agent response:** "I'll assume a mass of 1 kg and no damping. The answer is a cosine." This invents parameters and a model before knowing the user's goal.

**Agent:**

- **Goal:** Explain the motion, frequency, and energy of your oscillator.
- **Unresolved consequential choice and assumptions:** You have not said whether you want an ideal explanation or a prediction for a real object, and the prompt both permits and limits assumptions. We need to separate assumptions useful for a clean derivation from claims about a real system, otherwise I would be inventing the system, damping, and forcing.
- **Useful information:** No physical setup or parameter values are supplied. A symbolic derivation leaves values unspecified; a real prediction needs the system description and evidence on damping or driving. Choosing the equation and method is my job, not yours.
- **Options and recommendation:** An ideal spring-mass model isolates how inertia and a restoring force create oscillations. Damped or driven models add energy loss or external pushes, which need more setup. Start with the ideal symbolic model if your goal is the basic principle.
- **Your input:** Is this a textbook explanation or a prediction for a real object, and do you confirm starting with the ideal symbolic scope? For a real object, tell me what moves, what pulls it back toward equilibrium, and what you observe.

**User:** "A textbook explanation. I don't know yet whether I need damping or forcing."

**Agent:** "Damping describes energy loss; forcing describes an externally applied drive. Either or both can appear in a real system, while an ideal spring-mass model omits both."

**User:** "I understand those words, but I still don't know which to choose."

**Agent:** "Tie each model to the question you want answered. If you want to see why an object oscillates and what sets its frequency, use the ideal model. If you want to see why motion dies away, include damping. If you want to see how the object responds to repeated pushes, include forcing. For the basic explanation you asked for, I recommend the ideal model first. Which question matches yours?"

**User:** "Why it oscillates and what sets the frequency. Use the ideal spring-mass model. Keep it symbolic and show how initial conditions select the motion."

**Why this works:** When definitions stalled, the agent mapped each model to a concrete question. The user's reply authorizes that clarified scope directly, so no second confirmation is needed.

**Agent:** "We assume one-dimensional motion of a positive mass on a linear spring with no damping or drive. Let $m$ be mass, $k>0$ spring stiffness, $t$ time, and $x(t)$ displacement from equilibrium. Dots mark time derivatives: $\dot{x}$ is velocity and $\ddot{x}$ is acceleration. The spring force is $-kx$, so Newton's law gives

$$
\underbrace{m\ddot{x}}_{\text{inertial term}}+\underbrace{kx}_{\text{spring term}}=0.
$$

The restoring force opposes displacement; inertia carries the mass past equilibrium. Define the angular frequency $\omega_0=\sqrt{k/m}$. For symbolic initial displacement $x_0=x(0)$ and velocity $v_0=\dot{x}(0)$, the general motion is

$$
x(t)=\underbrace{x_0\cos(\omega_0t)}_{\text{initial displacement contribution}}+\underbrace{\frac{v_0}{\omega_0}\sin(\omega_0t)}_{\text{initial velocity contribution}}.
$$

Cycles per unit time is $f=\omega_0/(2\pi)$. Mass and stiffness set the frequency; initial conditions pick the trajectory. The mechanical energy $E$ is

$$
E=\underbrace{\frac12m\dot{x}^2}_{\text{kinetic energy}}+\underbrace{\frac12kx^2}_{\text{spring potential energy}}=\frac12mv_0^2+\frac12kx_0^2.
$$

Energy trades between kinetic motion and spring deformation while the total stays constant. Substituting $x(t)$ recovers the differential equation and both initial conditions, and $dE/dt=\dot{x}(m\ddot{x}+kx)=0$ because the parenthesized expression vanishes. These results hold for the stated ideal model and do not establish that damping is negligible in a real system."

**User:** "So I was mixing up choosing the model and choosing a trajectory. Initial conditions select the motion, not the ideal frequency."

The symbolic task is complete: the agreed model, solution, frequency, and energy are explained and checked.

## Enough information: proceed without an interview

**User:** "Use $lets-be-clear. For an ideal spring-mass oscillator, mass is 2 kg, stiffness is 8 N/m, initial displacement is 0.10 m, and initial velocity is zero. Find motion, frequency, and energy."

**Why the prompt works:** The model, parameters, initial conditions, and requested outputs are all given.

**Bad agent response:** "What system is this? Which method should I use?" These questions waste turns.

**Agent:** "Using $m=2\,\mathrm{kg}$, $k=8\,\mathrm{N/m}$, $x_0=0.10\,\mathrm{m}$, and $v_0=0$ in the ideal undamped, undriven model gives $\omega_0=\sqrt{k/m}=2\,\mathrm{rad/s}$, $x(t)=(0.10\,\mathrm{m})\cos[(2\,\mathrm{rad/s})t]$, $f\approx0.318\,\mathrm{Hz}$, and $E=0.040\,\mathrm{J}$. This expression reproduces both initial values and satisfies $m\ddot{x}+kx=0$, with constant total energy under the ideal assumptions."

Because no consequential choice was open, the agent stated its assumptions and calculated right away.

## An everyday decision: make an evening fit

**User:** "I'm stuck. Help me plan my evening. I have an hour to eat, pack tomorrow's bag, do laundry, clear my desk, and rest."

**Why the prompt needs work:** We know the total hour, not task durations, deadlines, or priorities.

**Bad agent response:** "Finish all the chores, then rest." This assumes everything fits and picks priorities for the user.

**Agent:**

- **Goal:** Fit your evening into one hour while keeping time to rest.
- **Undecided:** Which chores must happen tonight and how much rest to protect. Without durations, we cannot tell if everything fits.
- **Information:** We know the available hour and your task list. We need rough durations, real deadlines, and your priority for rest.
- **Options and recommendation:** We can try to cram every chore in, or defer chores without tonight's deadline to protect rest. Check deadlines and durations first so the plan matches the time you actually have.
- **Your input:** Which tasks must happen tonight, roughly how long does each take, and how much rest do you want? If everything still feels urgent, we can sort through it together.

**User:** "I don't know. They all feel urgent."

**Agent:** "What breaks tomorrow if a task waits? Laundry matters tonight if you have no clean clothes for tomorrow, and waits easily if you do. Which tasks have a consequence like that?"

**User:** "Dinner and packing need to happen. I have clean clothes and won't use the desk tomorrow. Dinner takes twenty minutes, packing ten, and laundry and the desk ten each. I'd like twenty minutes of rest."

**Agent:** "All five together take seventy minutes. Dinner, packing, and rest take fifty, leaving ten minutes of buffer if we push laundry and the desk to tomorrow. You could keep one chore and still rest twenty minutes, with zero buffer. Which fits your priorities?"

**User:** "Keep the rest and the margin. Go ahead with that plan."

**Agent:** "Your plan allocates twenty minutes for dinner, ten for packing, twenty for rest, and ten for overruns or extra rest, totaling sixty minutes, with laundry and the desk deferred to tomorrow. If dinner and packing run more than ten minutes long, either the end time or rest has to shrink."

**User:** "I was treating everything as equally urgent. Knowing what can wait made this easier."

The planning task is complete; the chores themselves remain for the user.

A stronger starting prompt is: "I have one hour. Dinner and packing must happen tonight; laundry and the desk can wait. Help me protect twenty minutes of rest."

## Clarification is sometimes the whole task

**User:** "Am I clear? I want a symbolic solution of an ideal spring-mass oscillator, with no damping or forcing. Just restate the scope for now."

**Agent:** "You want a general symbolic solution for an ideal spring-mass oscillator, assuming no damping or forcing, and only a scope summary for now. Do you confirm this scope?"

**User:** "Yes."

The request is already clear, so no interview is needed. The agent stops at the brief because that was the requested summary; likewise, a brief delegated by `schematic-designer` returns to that skill after confirmation, reusing a matching brief already confirmed in the conversation.
