---
name: ruminations
description: End-of-chat review of a scientific problem-solving chat that recaps the problem and solution, records rules for the agent in agent_lessons.md, and records learning topics and lessons for the user in my_lessons.md. Use only when the user types the /ruminations command ($ruminations in Codex). Do not run on the word "recap", other requests to summarize, or unprompted at the end of a chat.
---

# Ruminations

When invoked at the end of a scientific problem-solving chat, recap the problem and solution, record rules for the agent, and record learning topics and lessons for the user. Cover the scientific question and the technical methods it needed rather than code changes alone.

## 1. Recap and record lessons

Write these parts in order as one-line bullets:

- **Recap the problem and solution**: state the scientific problem, the problem-solving steps we took in order, the solution we ended up using, and any coding errors, numerical mistakes, or wrong assumptions we fixed (written collectively as "we" without assigning credit or blame).
- **Rules for the agent**: record the user's corrections, pushback, and feedback on the scientific process, each stated as a rule for future chats and how it changed the approach here.
- **Learning topics and lessons for the user**: list takeaways and assumptions worth checking next time for the user, plus 1–2 scientific concepts or technical skills to study independently with a one-line reason each matters here (add more only when asked).

## 2. Keep every point grounded and concise

- Run only when the user explicitly types `/ruminations` (`$ruminations` in Codex), never on the word `"recap"`, other requests to summarize, or unprompted at the end of a chat.
- Keep each bullet to one line using the chat's established terms for physical quantities, concepts, and methods.
- Include only what this chat discussed or did, omitting any empty section or list and omitting all credentials and secret values.

## 3. Save and show

- Save in the current project's root (the Git top level, else the working directory) unless the user names another location, creating missing files and never overwriting earlier entries.
- Append a dated entry headed `## YYYY-MM-DD: <topic>` to `my_lessons.md` with all sections, and append an entry with the same heading to `agent_lessons.md` with only the rules for the agent (skip `agent_lessons.md` when there are none).
- Show the same recap in the chat followed by the paths of the files written, without staging or committing them.
