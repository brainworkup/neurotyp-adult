#let report(
  title: none,
  author: none,
  patient: [],
  firstname: none,
  lastname: none,
  doe: [],
  date: none,
  cols: 1,
  paper: "a4",
  margin: (x: 25mm, y: 30mm),
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  
  // Metadata
  set document(
  title: title,
  author: "author"
  )
  
  // Set page size, margins, and header.
  set page(
  paper: paper,
  margin: margin,
  header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            [
              #set text(9pt)
              #smallcaps[
               *CONFIDENTIAL* \ 
               #patient \ 
               #doe
             ]
           ]
        }
    ),
  numbering: "1/1",
  number-align: right,
  columns: cols
)
  // Set paragraph justification and leading.
  set par(
  justify: true,
  leading: 0.52em,
)
  // Save heading and body font families in variables.
  let body-font = "Ale­greya"
  let sans-font = "Ale­greya Sans"

  // Set text and body font family.
  set text(font: body-font, lang: lang, region: region, size: fontsize)
  show math.equation: set text(weight: 400)

  // Set heading numbering.
  set heading(numbering: sectionnumbering)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)
  
  // Set heading font.
  show heading: set text(font: sans-font) 

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
  set enum(indent: 5pt, body-indent: 5pt)
  set list(indent: 5pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Logo
  block(
    figure(
      image("logo.png"),
    )
  )

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(2.2em, weak: true)
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