# From beat sheet to slides with Slidev

- Read this reference only when the researcher asks for slides. The beat sheet (`talk.md`) is complete without it.
- Building slides is done with [Slidev](https://sli.dev) through a separately installed `slidev` skill, which is not bundled with this skill. If it is unavailable, report the missing dependency instead of switching tools.

## What to pass

- Pass `talk.md` to `slidev` as the content source, with the figures and data files it cites.
- State the researcher's preferences for theme, aspect ratio, and export format if known; otherwise let `slidev` choose.

## How the beat sheet maps to slides

- **Parts become groups of slides.** One part may need one slide or several; split by result, not by a fixed count.
- **Each figure or result gets its own slide.** Bullets that only set up a question can be spoken over the previous slide, a blank slide, or the home slide.
- **Tell, then show.** A bullet that introduces a question comes before the slide with its figure. Within a figure slide, reveal elements in the order the bullets describe, using Slidev's click animations.
- **Part titles and answers supply the slide titles.** Use the answer (the last bullet) as a sentence title where the researcher wants titles; leave titles off where the researcher prefers the data to speak first.
- **Bullets become presenter notes.** Put the bullets of each part, as a short bullet list, in the presenter-note HTML comment at the end of the corresponding slide. Keep them out of the visible slide body.
- **The home slide becomes a reusable slide.** Insert it between results where `talk.md` returns to it, updated as the story develops.
- **Citations stay with their figures.** Show a short citation on every slide that displays a figure or data from a source, and keep the full references on a final slide.
- **Conclusions stay on screen.** Make the conclusion the last main slide; put brief acknowledgements before it or as inline credits, and place backup slides after it.

## Checks after the deck is built

- Read the deck's titles, figures, and notes against `talk.md`: every answer appears, every qualification survives, and each part leads to the next.
- Confirm that the note bullets appear in presenter view. Do not claim a rendering check that was not run.
- When slides are split, merged, or reordered, update `talk.md` or record the difference so `talk.md` and the deck agree.
