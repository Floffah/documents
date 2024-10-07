// Feature inspiration taken from Ilm - https://github.com/talal/ilm

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  authors: (),
  date: none,
  logo: none,

  external-link-circle: true,
  
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Source Sans Pro", lang: "en", size: 12pt)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  set heading(numbering: "1.a.i")
  set par(leading: 0.75em)

  show link: it => {
    it
    // Workaround for ctheorems package so that its labels keep the default link styling.
    if external-link-circle and type(it.dest) != label  {
      sym.wj
      h(1.6pt)
      sym.wj
      super(box(height: 3.8pt, circle(radius: 1.2pt, stroke: 0.7pt + rgb("#993333"))))
    }
  }

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.affiliation
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()


  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set par(justify: true)
  set list(marker: ([•], [◦], [‣], [⁃]))
  let ignore(content) = {}

  body

  pagebreak()

  bibliography("../references.yml")
}
