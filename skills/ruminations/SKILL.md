---
name: ruminations
description: End-of-chat review of a scientific problem-solving chat, covering the steps we took, the solution, what we fixed, two-way lessons saved to agent_lessons.md and my_lessons.md, and 1-2 topics to learn. Use only when the user types the /ruminations command ($ruminations in Codex). Do not run on the word "recap", other requests to summarize, or unprompted at the end of a chat.
---

# Ruminations

Recap the current chat and record what the agent and the user each learned. Cover the scientific question and the technical skills it needed; this is not a code-only recap.

## Sections

Write these sections in order as bullet lists:

1. **Steps we took**: the problem-solving path, in order.
2. **Solution**: what we ended up using.
3. **What we fixed**: coding errors, numerical mistakes, and wrong assumptions we corrected, written as "we" without assigning credit.
4. **Lessons**, in two lists:
   - **Agent lessons**: the user's corrections, pushback, and feedback on the scientific process, each stated as a rule for the agent's next chat and how it changed the approach here.
   - **My lessons**: what the user can take away, such as "aha" moments, scientific-process points the agent raised, and assumptions worth checking next time.
5. **What to learn**: 1-2 scientific concepts or technical skills the user needs to understand the solution independently, each with a one-line reason it matters here. Add more only when the user asks.

## Rules

- Keep each bullet to one line.
- Include only what this chat discussed or did; do not invent steps, fixes, or lessons.
- Omit any section or lesson list that has no content.
- Use the chat's established terms for concepts, quantities, and methods.
- Omit credentials and secret values.

## Save and show

1. Save in the current project's root (the Git top level, else the working directory) unless the user names another location.
2. Append a dated entry headed `## YYYY-MM-DD: <topic>` to `my_lessons.md` with all sections, and an entry with the same heading to `agent_lessons.md` with only the agent lessons. Create a missing file and never overwrite earlier entries. Skip `agent_lessons.md` when there are no agent lessons.
3. Show the same recap in the chat, followed by the paths of the files written. Do not stage or commit them.
