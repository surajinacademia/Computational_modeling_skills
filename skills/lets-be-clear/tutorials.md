# Tutorials

These are illustrative conversations, not real interactions.

## An oscillating system: help the user figure it out

**User:** “Use $lets-be-clear. Solve an oscillating system using simple harmonic motion or another appropriate model. The object starts away from equilibrium and may have some initial velocity. There could be damping or an external force, but assume whatever is reasonable. Find the motion, frequency, energy, and anything else important. Use the given parameters if necessary, and explain the result without making too many assumptions.”

**Why the prompt needs work:** The model is undecided, no parameters are supplied, and the prompt allows assumptions while asking to minimize them. Some choices need the user's context; the governing equation and solution method are the agent's work.

**Bad agent response:** “I'll assume a mass of 1 kg and no damping. The answer is a cosine.” This invents parameters and a model without establishing whether they serve the user's goal.

**Agent:**

- **Goal:** Explain the motion, frequency, and energy of your oscillator.
- **Undecided:** Whether this is an ideal explanation or a prediction for a real object. That determines which physical effects we need to include.
- **Information:** No physical setup or parameter values are supplied. A symbolic derivation can leave values unspecified; a real prediction needs a description of the system and evidence about damping or driving.
- **Options and recommendation:** An ideal spring–mass model is a useful introduction because it shows how inertia and the restoring force produce oscillations. A damped or driven model can explain losses or external pushes, but needs more context. I recommend the ideal symbolic model if your goal is the basic principle.
- **Your input:** Is this a textbook explanation or a prediction for a real object? For a real object, describe what moves, what brings it back toward equilibrium, and what you observe. If you don't know which approach you need, tell me what you want to understand.

**User:** “A textbook explanation. I don't know yet whether I need damping or forcing.”

**Agent:** “Damping describes energy loss; forcing describes an externally applied drive. They can occur together. An ideal spring–mass model leaves both out.”

**User:** “I understand those words, but I still don't know which to choose.”

**Agent:** “Let's connect the choice to what you want to understand. If your question is why an object oscillates and what sets its frequency, start with the ideal model. If it's why the motion dies away, include damping. If it's how the object responds to repeated pushes, include forcing. For the basic explanation you asked for, I recommend the ideal model first. Which of those questions is closest to yours?”

**User:** “Why it oscillates and what sets the frequency. Use the ideal spring–mass model. Keep it symbolic and show how initial conditions select the motion.”

**Why this works:** When definitions did not help, the agent changed the explanation and connected each model to a question the user could recognize. The answer settles the scope; no further confirmation is needed.

**Agent:** “We'll assume one-dimensional motion of a positive mass on a linear spring, with no damping or drive. Let $m$ be mass, $k>0$ spring stiffness, $t$ time, and $x(t)$ displacement from equilibrium. Dots mean time derivatives: $\dot{x}$ is velocity and $\ddot{x}$ acceleration. The spring force is $-kx$, so Newton's law gives

$$
\underbrace{m\ddot{x}}_{\text{inertial term}}+\underbrace{kx}_{\text{spring term}}=0.
$$

The restoring force opposes displacement; inertia carries the mass through equilibrium. Define the angular frequency $\omega_0=\sqrt{k/m}$. For symbolic initial displacement $x_0=x(0)$ and velocity $v_0=\dot{x}(0)$, the general motion is

$$
x(t)=\underbrace{x_0\cos(\omega_0t)}_{\text{initial displacement contribution}}+\underbrace{\frac{v_0}{\omega_0}\sin(\omega_0t)}_{\text{initial velocity contribution}}.
$$

The frequency in cycles per unit time is $f=\omega_0/(2\pi)$. Mass and stiffness set the frequency; initial conditions select the trajectory. The mechanical energy $E$ is

$$
E=\underbrace{\frac12m\dot{x}^2}_{\text{kinetic energy}}+\underbrace{\frac12kx^2}_{\text{spring potential energy}}=\frac12mv_0^2+\frac12kx_0^2.
$$

Energy moves between motion and spring deformation while the total stays constant. Substituting the solution recovers the equation and both initial conditions. Its energy-change rate is $dE/dt=\dot{x}(m\ddot{x}+kx)=0$, because the bracketed expression vanishes. These results apply to the stated ideal model; they do not establish that damping is negligible in a real system.”

**User:** “So I was mixing up choosing the model and choosing a trajectory. Initial conditions select the motion, not the ideal frequency.”

The symbolic task is complete: the agreed model, solution, frequency, and energy have been explained and checked.

## Enough information: solve without an interview

**User:** “Use $lets-be-clear. For an ideal spring–mass oscillator, mass is 2 kg, stiffness is 8 N/m, initial displacement is 0.10 m, and initial velocity is zero. Find motion, frequency, and energy.”

**Why the prompt works:** The model, values, initial conditions, and outputs are supplied.

**Bad agent response:** “What system is this? Which method should I use? Can I begin?” These questions add no useful information.

**Agent:** “Using the quantities defined above, $\omega_0=2\,\mathrm{rad/s}$, $x(t)=(0.10\,\mathrm{m})\cos[(2\,\mathrm{rad/s})t]$, $f\approx0.318\,\mathrm{Hz}$, and $E=0.040\,\mathrm{J}$. The formula gives the stated initial displacement and zero initial velocity, and satisfies the governing equation. The energy is constant under the ideal assumptions.”

The supplied information was enough to finish the calculation without a clarification interview.

## An everyday decision: make an evening fit

**User:** “I'm stuck. Help me plan my evening. I have an hour to eat, pack tomorrow's bag, do laundry, clear my desk, and rest.”

**Why the prompt needs work:** We know the time available, but not the durations, actual deadlines, or the user's priorities.

**Bad agent response:** “Finish all the chores, then rest.” It assumes everything fits and chooses the user's priorities for them.

**Agent:**

- **Goal:** Make an evening plan that fits one hour and includes rest.
- **Undecided:** Which chores must happen tonight and how much rest to protect. We cannot yet tell whether the whole list fits.
- **Information:** We know the available hour and the tasks. We need their durations, actual deadlines, and your priority for rest.
- **Options and recommendation:** We can try to fit every chore, or postpone those without a deadline and protect rest. I recommend checking the deadlines and durations first so the plan does not depend on time you don't have.
- **Your input:** Which tasks need to happen tonight, roughly how long does each take, and how much rest would feel useful? If everything feels urgent, we can work through that together.

**User:** “I don't know. They all feel urgent.”

**Agent:** “What happens tomorrow if each task waits? For example, laundry matters tonight if you have no clean clothes for tomorrow. If you do, it may be able to wait. Which tasks have a consequence like that?”

**User:** “Dinner and packing need to happen. I have clean clothes and won't use the desk tomorrow. Dinner takes twenty minutes, packing ten, and laundry and the desk ten each. I'd like twenty minutes of rest.”

**Agent:** “That is seventy minutes altogether. Dinner, packing, and rest take fifty. I recommend postponing laundry and the desk, leaving ten minutes of margin. You could do one of those chores and keep the rest, but then there's no margin. Which fits your priorities?”

**User:** “Keep the rest and the margin.”

**Agent:** “Your plan is twenty minutes for dinner, ten for packing, twenty for rest, and ten for overruns or extra rest. That totals sixty minutes. Laundry and the desk wait until tomorrow. It fits using your estimates; if dinner and packing overrun by more than ten minutes, the end time or rest would need to change.”

**User:** “I was treating everything as equally urgent. Knowing what can wait made this easier.”

The planning task is complete; the chores have not been performed.

A stronger starting prompt would be: “I have one hour. Dinner and packing must happen tonight; laundry and the desk can wait. Help me protect twenty minutes of rest.” The user does not need to arrive with that clarity for the skill to help.

## Clarification is sometimes the whole task

**User:** “Am I clear? I want a symbolic solution of an ideal spring–mass oscillator, with no damping or forcing. Just restate the scope for now.”

**Agent:** “You want the general symbolic motion, frequency, and energy for an ideal spring–mass oscillator, assuming no damping or forcing. For now, the task is to confirm that scope.”

The request is already clear, so no decision interview is needed. The agent stops at the brief because that is the requested deliverable. Likewise, a brief delegated by `schematic-designer` returns to that skill after its required confirmation, reusing a matching brief already confirmed in the conversation.
