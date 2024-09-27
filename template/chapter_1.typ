#import "uzh_mnf_phd_template.typ": chapter

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
  bib_file: "library.bib",
  header: "Chapter 1: Short title as header",
  abstract: lorem(100)
)

== Introduction
#lorem(100)

== Materials and Methods
#lorem(100)
