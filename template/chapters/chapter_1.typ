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
  published: <Author_2023>,
  abstract: lorem(100)
)

== Introduction
Cite like this: `@Author_2023`, or `@Author_2023@Author_2023` for multiple citations (without backticks).
Change citation style in the `main.typ` file.

Like this you can reference your figures: @fig:fig_exampl

#line(length: 100%)

//Include figures like this:
#figure(
  image("../figures/Soya.svg"),
  caption: [An example figure], 
) <fig_exampl>


== Materials and Methods
#lorem(100)