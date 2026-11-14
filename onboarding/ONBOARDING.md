# Learning the research process with these skills

If you are a super excited research student who just got into research in this age of AI, I won't blame you for the temptation to use it. As we get into research, we develop personal practices and styles that are hard to explain or put into a fixed structure. Habits that work for us might not work for someone else. As students in computational physics, we are rarely taught how to organize research data and code so anyone else, or even our future selves six months from now, can understand it.

I built these skills to help me work productively and to write down the learning habits and lessons I have picked up so far. I hope they help you and your AI agent get your work done while learning the process with rigor. Good research requires habits that are often left untaught: explaining code, recording assumptions, tracking files, and remembering which settings produced a figure. These skills help anyone learning computational research practice those habits through computational modeling and theoretical biophysics, so others can understand, check, and reproduce your work.

The main goal here is to stick to reproducibility and ruthlessly question what you plot. If you publish data, you should know where they come from. Every data point should be traceable. If you don't have the data behind a claim, the research wasn't done, and there's no proof of it.

Traceability and verifiability come first in this set of skills, and they also give you a way through when you get stuck. They aim to give you enough context to make sound decisions and solve the problem yourself.

**Reproducibility** means repeating a computation with its recorded inputs, code, settings, and procedure. A reproducible calculation can still be wrong. **Verification** checks the implementation and numerical accuracy. **Physical validation** compares predictions with relevant observations under stated conditions.

**Build habits that make your reasoning visible.**

- **“Which files produced this figure?”** Preserve original inputs and record the code revision, parameters, units, random seeds, environment, and command. Give results descriptive names like `pendulum_period_vs_amplitude.pdf` linked to their inputs. See the [project layout](../skills/research-project-setup/assets/template/README.md) and [Git workflow](../skills/research-project-setup/references/git-workflow.md), and keep your data stored and backed up.
- **“My notebook depends on the order I ran cells.”** Old variables can survive unnoticed. Keep parameters explicit and make the notebook runnable from a fresh kernel, top to bottom. Explain assumptions in Markdown, and use code comments to justify numerical choices. Explore the [template](../skills/scientific-notebook/assets/notebook-template.ipynb) and [pendulum example](../skills/scientific-notebook/examples/nonlinear-pendulum.ipynb), and review affected outputs after changing code or inputs.
- **“The curve looks right.”** For a pendulum calculation, compare the predicted period at smaller timesteps before interpreting its amplitude dependence, and check a known case. Decide what evidence would support or challenge your claim before inspecting decisive results. Preserve disagreement and failed checks, and label later exploration honestly.

Folder names and notebook layouts are adaptable conventions. Preserve the reasoning, evidence, and ability to reproduce retained results.

**Find the skill for the question you have.**

These twelve skills cover the research workflow from clarifying questions and setting up a repository to analyzing microscopy images, running cluster sweeps, and recording session lessons. Each `SKILL.md` links to supporting files, and [computational_modeling_walkthrough.html](computational_modeling_walkthrough.html) walks through the core modeling workflow step by step.

| Your question | Skill | What to learn |
| --- | --- | --- |
| What is my question? | [lets-be-clear](../skills/lets-be-clear/SKILL.md) | Identify assumptions and decisions. |
| Where do files belong? | [research-project-setup](../skills/research-project-setup/SKILL.md) | Separate inputs, methods, results, and checks. |
| How do I build a model? | [computational-modeling](../skills/computational-modeling/SKILL.md) | Connect hypotheses, equations, code, and evidence. |
| How do I explain it? | [model-documentation](../skills/model-documentation/SKILL.md) | Document physical assumptions, quantities, and methods. |
| Can someone rerun my notebook? | [scientific-notebook](../skills/scientific-notebook/SKILL.md) | Keep explanations, calculations, and outputs understandable. |
| Will a small disturbance grow? | [linear-stability-analysis](../skills/linear-stability-analysis/SKILL.md) | Analyze small perturbations within the approximation's limits. |
| Is my plot faithful? | [data-visualization](../skills/data-visualization/SKILL.md) | Preserve units, uncertainty, and meaningful comparisons. |
| Can a diagram explain this? | [schematic-designer](../skills/schematic-designer/SKILL.md) | Show mechanisms; distinguish illustration from measurement. |
| How do I measure microscopy images? | [image-analysis](../skills/image-analysis/SKILL.md) | Calibrate axes and scales, check failure modes, and record reproducible methods. |
| Can I assess a paper's result? | [paper-reproduce](../skills/paper-reproduce/SKILL.md) | Trace sources, missing information, and negative findings. |
| How do I run larger calculations? | [slurm](../skills/slurm/SKILL.md) | Use the Slurm cluster scheduler and verify completed outputs. |
| What did we learn from this session? | [ruminations](../skills/ruminations/SKILL.md) | Record problem-solving steps, corrections, two-way lessons, and topics to study. |

**Learn with an AI agent.**

Give the agent this guide and the relevant project files. Try:

> Can you tell me about the best ways to maintain a Jupyter notebook?

> Review my project without changing files. Trace one figure to its data, code, and settings. Explain what is missing and why it matters.

For an agent: read the relevant files, cite their paths, and explain your recommendations at the learner's level. Teaching does not authorize edits or computation. Distinguish proposed checks, saved examples, and checks actually performed, and help the learner evaluate evidence and make their own decisions.
