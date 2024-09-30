#import "@local/uzh-mnf-phd:0.1.0": *

#show: chapter.with(
  title: text()[Title of your first chapter, of which maybe a part must be _italic_],
  authors: (
    (name: "First Author", affiliation: [1, 2]),
    (name: "Second Author", affiliation: 3),
    (name: "Third Author", affiliation: 1),
    (name: "Last Author", affiliation: 2),
  ),
  affiliations: (
    (num: 1, name: "First Affiliation"),
    (num: 2, name: "Second Affiliation"),
    (num:3, name: "Third Affiliation")
  ),
  header: "Chapter 1: Short title as header",
  abstract: lorem(100)
)

== Introduction
#lorem(100)
@Aarssen_1997
@Barot_et_al_2017

== Materials and Methods
#lorem(100)