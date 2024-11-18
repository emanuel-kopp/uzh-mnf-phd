#import "@local/uzh-mnf-phd:0.1.0": *

#show: paper-chapter.with(
  title: text()[The Title of your first chapter, of which maybe a part must be _italic_],
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
If you want to cite without parentheses, use `#no-paren-cite((<Author_2023>,))`. Note the double parentheses and the commas, this is because for now the function only takes an array. This is useful when citing multiple works like `#no-paren-cite((<A>, <B>))`.

Like this you can reference your figures: @fig:fig_exampl

To refer to chapters, the label is automatically set as the first and the last word of your title. Example: refer to @theitalic using `@theitalic` and to @secondthesis using `@secondthesis`.

#line(length: 100%)

//Include figures like this:
#figure(
  image("../figures/Soya.svg"),
  caption: flex-caption([This is the actual caption of your figure: #lorem(50)], [This is just a short title, for the outline.]), 
) <fig_exampl>


== Materials and Methods
#lorem(100)