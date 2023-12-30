#let report(
  title: "NEUROCOGNITIVE EXAMINATION",
  author: "Joey W. Trampush, Ph.D.",
  name: [],
  doe: [],
  patient: [],
  date: none,
  cols: 1,
  paper: "a4",
  margin: (x: 25mm, y: 30mm),
  lang: "en",
  region: "US",
  font: (),
  body-font: ("Libertinus Serif"),
  sans-font: ("Libertinus Sans"),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  // Metadata
  set document(title: title, author: author)

  // Set page size, margins, and header.
  set page(
    paper: paper,
    margin: margin,
    header: locate(loc => if [#loc.page()] == [1] {
      []
    } else {
      [
        #set par(leading: 0.65em)
        #set text(9pt)
        #smallcaps[
          *CONFIDENTIAL* \
          #name \
          #doe
        ]
      ]
    }),
    numbering: "1/1",
    number-align: center,
    columns: cols,
  )
  // Set paragraph justification and leading.
  set par(justify: true, leading: 1em, linebreaks: "optimized")

  // Save heading and body font families in variables.
  // let body-font = "ScholaX"
  // let sans-font = "IBM Plex Sans"

  // Set text and body font family.
  set text(font: body-font, lang: lang, region: region, size: fontsize)
  show math.equation: set text(weight: 400)

  // Set heading numbering.
  set heading(numbering: sectionnumbering)

  // Set paragraph spacing.
  show par: set block(above: 1.5em, below: 1.5em)

  // Set heading font.
  show heading: set text(font: body-font, weight: "semibold")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 3 {
      parbreak()
      text(10pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Configure lists and links.
  show enum: set block(above: 0.65em, below: 0.65em)
  set enum(indent: 0.5em, body-indent: 0.5em, tight: false)
  // show list: set block(above: 0.65em, below: 0.65em)
  show list: set par(leading: 0.65em)
  set list(indent: 0.5em, body-indent: 0.5em, marker: ([•], [--]), tight: false)
  show link: set text(font: "Merriweather", color: "#42b883", weight: 500)

  // Logo
  block(figure(image("logo.png")))

  // Title row.
  align(center)[
    #block(text(font: body-font, weight: 600, 1.75em, title))
    #v(0em, weak: true)
  ]

  if date != none {
    align(center)[#block(inset: 1em)[
        #date
      ]]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
