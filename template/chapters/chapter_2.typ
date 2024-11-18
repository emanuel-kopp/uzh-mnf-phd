#import "@local/uzh-mnf-phd:0.1.0": *

#show: paper-chapter.with(
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
  abstract: lorem(100),
  header: "This chapter has a custom header"
)

== Introduction
#lorem(100)
@Author_2023

== Materials and Methods
#lorem(100)
