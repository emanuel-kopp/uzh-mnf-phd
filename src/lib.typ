// import extrenal packages
#import "@preview/i-figured:0.2.4"

// Define function for main document

#let main_doc(
  title: "",
  author: "",
  heimatort: "",
  examinators: (""),
  date: "",
  land: "",
  PI_is_head: true,
  quote: none,
  quote_author: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: author, title: title)
  set text(font: "New Computer Modern", lang: "de", size: 11pt)
  set align(center)
  set page(margin: auto, header-ascent: 40%)

  text(size: 14pt, weight: "bold")[#title]

  v(3pt)
  line(length: 171mm, stroke: 0.3pt)

  v(24pt)
  text(weight: "bold")[Dissertation]
  linebreak()
  v(2fr)
  text(weight: "bold")[zur]
  v(2fr)
  text(weight: "bold")[Erlangung der naturwissenschaftlichen Doktorwürde]
  v(2fr)
  text(weight: "bold")[(Dr. sc. nat.)]
  v(2fr)
  text(weight: "bold")[vorgelegt der]
  v(2fr)
  text(weight: "bold")[Mathematisch-naturwissenschaftlichen Fakultät]
  v(2fr)
  text(weight: "bold")[der]
  v(2fr)
  text(weight: "bold")[Universität Zürich]
  v(2fr)
  text(weight: "bold")[von]
  v(2fr)
  text(weight: 1)[#author]
  v(11pt)
  if land == "Schweiz" [#text(weight: "bold")[von]] else { text(weight: "bold")[aus] }
  v(2fr)
  if land == "Schweiz" { text(weight: 1)[#heimatort] } else { text(weight: 1)[#land] }
  v(4fr)

  text(weight: "bold")[Promotionskommission]
  v(3pt)
  grid(
    align: left,
    columns: 3,
    [],
    let (a, b, .., c) = examinators,
    for ex in examinators {
      if PI_is_head == true [
        #if ex == a { text(weight: 1)[#ex (Vorsitz und Leitung der Dissertation)] } else { text(weight: 1)[#ex] }
      ]
      if PI_is_head == false [
        #if ex == a { text(weight: 1)[#ex (Vorsitz)] } else if ex == b { text(weight: 1)[#ex (Leitung der Dissertation)] } else { text(weight: 1)[#ex] }
      ]
      v(0.1em)
    },
    [],
  )
  v(6fr)
  text(weight: "bold")[Zürich, #date]
  v(2fr)
  pagebreak()

  if quote != none {align(horizon)[#text(weight: "bold")[#quote]]}
  if quote_author != none {align(horizon)[#text(style: "italic")[#quote_author]]} 

  // Set heading numbering
  set heading(numbering: "1.")

  // Defining headings
  show heading.where(level: 1): it => {
    pagebreak()
    set text(weight: "bold", size: 13pt)
    it
    v(1em)
  }

  // Main body
  set text(font: "New Computer Modern", lang: "en", size: 11pt)
  set par(justify: true)
  set align(left)
  set page(numbering: "1", number-align: center)

  // apply the show rules for figure and table numbering
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure


  // Number bibliography
  show bibliography: set heading(numbering: "1.")

  // Show table of contents
  let in-outline = state("in-outline", false)
  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }
  let flex-caption(long, short) = context if in-outline.get() { short } else { long }
  outline(depth: 2, indent: auto)
  // outline(target: figure)

  // Show list of figures and tables
  i-figured.outline()

  body
}

// Define function for chapters

#let chapter(
  title: none,
  authors: (),
  affiliations: (),
  abstract: [],
  header: none,
  published: none,
  chapter,
) = {
  set align(left)

  // Write title
  heading(title)
  v(1em)

  let count = authors.len()
  let ncols = calc.min(count, 3)

  for aut in authors {
    if aut.name == authors.last().name { text()[#aut.name#super[#aut.affiliation]] } else { text()[#aut.name#super[#aut.affiliation], ] }
  }

  v(1em)

  set par(first-line-indent: 0em, leading: 1.2em)
  for aff in affiliations {
    text()[#aff.num: #aff.name]
    linebreak()
  }

  v(2em)

  if published != none {
    text()[Published as: ]
    v(1em)
    cite(form: "full", published)
  }


  pagebreak()
  //set align(center)
  par(justify: true, leading: 1.2em)[
    #set text(spacing: 80%)
    #text(weight: "bold", size: 13pt)[Abstract] \
    #v(1em)
    #abstract
  ]
  pagebreak()

  show heading.where(level: 2): it => {
    v(1em)
    it
    v(1em)
  }

  show heading.where(level: 3): it => {
    v(1em)
    it.body
    v(1em)
  }

  set align(left)

  v(2em)

  // Write header
  let numberingH(c)={
    return numbering(c.numbering,..counter(heading.where(level: 1)).at(c.location()))
  }

  if header == none {
    header = context {
      let sel = query(selector(heading.where(level: 1)).before(here()))
      return [#numberingH(sel.last()) #sel.last().body]
    }
  } else {
    header = context {
      let sel = query(selector(heading.where(level: 1)).before(here()))
      return [#numberingH(sel.last()) #header]
    }
  }

  set page(header: align(right)[
    #text(size: 10pt, style: "italic")[#header]
  ])

  // Default for main text
  set par(first-line-indent: 2em, leading: 1.2em)
  set text(spacing: 80%) 
  
  // Defaults for figures and blocks
  show figure.caption: set text(9pt, spacing: 90%)
  show figure.caption: set align(left)
  show figure: set block(inset: (top: 0.8em, bottom: 2em))
  set figure(placement: auto, numbering: "1.1")

  set block(inset: (top: 0.5em, bottom: 1em, left: 0.8em, right: 0.8em))

  chapter
}

// Define a fucntion to cite inline
// https://forum.typst.app/t/how-can-i-remove-parens-around-specific-citations/818
#let no-paren-cite(cites) = {
  show regex("\(|\)"): none
  for c in cites {
    cite(c, form: "normal")
  }
}

  #let in-outline = state("in-outline", false)
  #show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }
  #let flex-caption(long, short) = context if in-outline.get() { short } else { long }