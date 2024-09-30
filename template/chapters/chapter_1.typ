#import "@local/uzh-mnf-phd:0.1.0": chapter

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
Cite like this: @Aarssen_1997, or @Aarssen_1997@Barot_etal_2017 for multiple citations. Change citation style in the `main.typ` file.

#line(length: 100%)

Include figures like this:
#figure(
  image("../figures/Soya.svg"),
  caption: [A figure in your Chapter 1], 
)<figure_1> 


== Materials and Methods
#lorem(100)