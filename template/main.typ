#import "@local/napier-formal-template-base:0.1.2": *


#show: project.with(
  title: "My Title",
  logo: "napier",
  authors: (
    (name: "Floffah", affiliation: "..."),
  ),
  date: "September 15, 2025",
  abstract: "oooo",

  formal: true,
  figure-index: (
    enabled: true
  ),
  bibliography: bibliography(("./references.yml", "./zotero.bib"), style: "american-psychological-association"),
  word-counter: true,
  declaration: "[x] NO: I have not used such tools"
)

= Heading

@ILM
