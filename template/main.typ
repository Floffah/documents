#import "@preview/wordometer:0.1.4": word-count
#import "@local/napier-formal-template-base:0.1.5": *


#show: project.with(
  title: "My Title",
  logo: "napier",
  authors: (
    (name: "Ramsay Foy", affiliation: "40646655"),
    (name: "Secondary author (long_title@example.com)", affiliation: "Supervisor"),
    (name: "Third (also_long_title@example.com)", affiliation: "Test")
  ),
  authorsVertical: true,
  date: "September 15, 2025",
  abstract: "oooo",

  formal: true,
  figure-index: (
    enabled: true
  ),
  word-counter: (
    enabled: true,
    auto-include-body: false
  ),
  bibliography: bibliography(("./references.yml", "./zotero.bib"), style: "american-psychological-association"),
  declaration: "[x] NO: I have not used such tools"
)

= Heading

@ILM

#[
#show: word-count
Only these words are included in word count
]

These ones, are not.