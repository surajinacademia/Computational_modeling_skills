---
name: presentation-story
description: How to give a talk like David Attenborough. Write the beat sheet of a scientific talk, laying out the story from the opening to the conclusion with talking points. Use for research talks, seminars, journal clubs, and conference presentations when the narration and the order of ideas need planning.
---

# Presentation Story

- Write the **beat sheet** of a scientific talk: the ordered story a speaker tells, from the opening question to the conclusion. The output is one file, `talk.md`.
- In film-production terms, this skill writes the beat sheet. The storyboard (a slide-by-slide plan) and the shooting (building slides) come later and are not part of this skill.
- `talk.md` is a numbered list of **parts**. Each part is one step of the story, such as the opening problem or one result: a bold title (a question or a statement) and a few plain bullets of what to say. A part may take one slide or several. Plan the story, not the slides.
- Read [the talk beat sheet diagram](assets/talk-beat-sheet.svg) for the overall shape, [the template](assets/talk-template.md) for the format, and [the worked example](assets/talk-example.md) for the level of detail. The example cites its two papers at paper level; check its numbers, tables, and figures against the papers before reusing them.

## Establish the content

- Read the supplied papers, figures, results, existing slides, and relevant project instructions. Preserve the researcher's notation, terminology, and intended scientific meaning.
- **If `story_arc.md` or a `claim-review` review exists:** use its claims, reviewed scope, and figure roles as the argument; do not rewrite `story_arc.md`.
- Identify the audience, the time slot, the central question, and the answer the audience should leave with.
- Ask only for missing information that changes the story; routine organization proceeds without repeated approval requests.
- The central interpretation belongs to the researcher. Use supplied or previously confirmed claims; mark any new interpretation as unconfirmed and settle it with the researcher before writing it as a finding. An early-stage talk may present hypotheses and planned tests, identified as such.

## Keep claims within the evidence

- Call `claim-review` when the talk needs a claim that was not reviewed, when an answer is worded more strongly than its reviewed status, or when the evidence changed. If no review exists, use the researcher's claims and label them unreviewed; do not run a review unasked.
- Keep material uncertainty, contradictory findings, and credible alternatives in the beat sheet; never cover a missing result or a needed qualification with confident narration.
- Do not invent results, citations, or analyses. For a talk about a published paper, separate the paper's reported claims from conclusions checked against source data.

## Shape the talk

- **Tell a story, not a paper.** Do not follow manuscript headings or the order in which the work was done; order the material by what the listener needs next.
- **Start broad, narrow, and return.** Open with the big-picture problem in plain, concrete terms, narrow to the key questions, and end by saying how the answers change the big picture.
- **Set up a contrast when the talk has one.** When the finding changes how people think, state the current view, then what this talk shows instead, and return to the current view in the conclusion. Not every talk has such a contrast; otherwise state what is known and what is still missing. Do not exaggerate a contrast beyond the evidence.
- **Test one central hypothesis.** State the central question or hypothesis in the introduction. Each result is a different test of it, such as a prediction, a second method, or an alternative ruled out, and each must add something to the case. A result that adds nothing goes to the backup section. A methods or descriptive talk has a central question instead of a hypothesis; the same rule applies.
- **Give the main answer early.** End the introduction with the main result in broad strokes; listeners follow details better when they know where the talk is going.
- **Limit the scope.** Build the talk around one or two main points, three at most. Cut tangents, side projects, and results that do not serve those points.
- **Fit the time.** Plan to speak for about two-thirds of the slot and leave the rest for questions.
- **Choose a home slide.** Pick one familiar image, such as a schematic of the system or two competing models, and return to it between results. Use it to say what the last test added to the hypothesis and what the next test asks; it can change as the story develops.

## Write each part

- **Give each part a numbered title.** A title is a question or a statement. A question tells the audience what to think about; use the question the listener would be asking at that point of the talk. A part may take one slide or several.
- **Write the points as plain bullets.** Each bullet is one idea, in one short sentence, with the citation for any figure or paper it uses. Use as many bullets as the part needs; do not label them.
- **End with the answer.** The last bullet answers the title's question as one bounded statement, with the qualification it needs. In a result, it also says what this test adds to the central hypothesis.
- **Keep working notes apart.** How a number was worked out, sources still to check, and choices not yet agreed go in a **Notes** box under the bullets, written as a Markdown quote (`> **Notes:** ...`), never in a bullet. Ask open questions at the end of `talk.md`.
- **Tell, then show.** Place the question and the reason for the test before the figure. Then say how to read the figure (axes, conditions, colours) and state the result.
- **Go into detail and come back.** Start each result at a general level, go into the technical detail where the evidence requires it, and return to a general statement before moving on.
- **Show the minimum data that convinces.** Present the decisive experiment or calculation carefully, one result at a time. Mention that other supporting evidence exists and move it to the backup section.
- **Introduce methods where they are needed.** Give enough method to show the work is sound, at the point where a result depends on it. Do not open with a long framework and assume the audience retains it. In a methods talk, the method is the result.
- **Repeat what matters.** Listeners miss parts of every talk. Restate key concepts and results at transitions, in different words each time.
- **Lead into the next part.** The answer should raise the question that the next title asks.
- **Cite as you go.** Attach the source to every figure, dataset, and borrowed claim at the bullet where it appears, and list full references at the end of `talk.md`.

## Close the talk

- **Conclusions:** say how the tests together answer the central question or hypothesis, state the limits, and say what the results mean for the big picture. If the talk set up a contrast, return to it here. Outlook and open questions belong here; do not introduce new results after the conclusion.
- **Acknowledgements:** keep them short so the conclusion stays in mind for the discussion. Note in the relevant bullets where a collaborator's contribution should be credited.
- **Backup:** list anticipated questions and the omitted evidence or details that answer them.

## Write talk.md

1. Copy [the template](assets/talk-template.md) to `talk.md` in the project, or revise the existing `talk.md` in place.
2. Write the date under the title. Do not add other fields above the content.
3. Write the sections in order: Intro, Results, Conclusions, Acknowledgements, Backup, References. Number the parts continuously across sections.
4. Write each part as a numbered bold title followed by indented bullets, and a **Notes** box only when there are working notes.
5. Read the finished beat sheet from start to end. Check that each answer is supported by its cited evidence, that each answer leads to the next title, and that the conclusion answers the introduction.
6. Put unresolved scientific choices at the end of `talk.md` as numbered questions: each with the background needed to answer it and numbered options. Deliver `talk.md`. Then stop.

## Scope

- Do not write a slide-by-slide plan, slide layouts, a verbatim script, rehearsal exercises, or delivery coaching unless asked.
- **If the researcher asks for slides:** read [the Slidev handoff](references/slidev-handoff.md) and pass `talk.md` to the `slidev` skill. Do not build slides unasked.
- For edits, revise `talk.md` in place and preserve the researcher's changes.
- These rules adapt guides by Ratcliff, Raj, McConnell, and Stern. Read [the source notes](references/sources.md) when attribution, the reasoning, or their disagreements are needed.
