// import third-party packages
#import "@preview/codly:1.3.0": codly-init
#import "@preview/ctheorems:1.1.3": thmplain, thmproof, thmrules
#import "@preview/cjk-unbreak:0.1.1": remove-cjk-break-space

// Theorem environments
#let thmja = thmplain.with(base: {}, separator: [#h(0.5em)], titlefmt: strong, inset: (top: 0em, left: 0em))
#let definition = thmja("definition", context { text(font: query(<heading-font>).first().value)[定義] })
#let lemma = thmja("lemma", context { text(font: query(<heading-font>).first().value)[補題] })
#let theorem = thmja("theorem", context { text(font: query(<heading-font>).first().value)[定理] })
#let corollary = thmja("corollary", context { text(font: query(<heading-font>).first().value)[系] })
#let proof = thmproof(
  "proof",
  context { text(font: query(<heading-font>).first().value)[証明] },
  separator: [#h(0.9em)],
  titlefmt: strong,
  inset: (top: 0em, left: 0em),
)

#let sup_ast(num) = (
  super(typographic: true, baseline: -0.3em, size: 0.7em)[\*]
    + super(typographic: true, baseline: -0.5em, size: 0.6em)[#num]
)

#let jaconf(
  // 基本 Basic
  title: [タイトル],
  authors: [著者],
  keywords: (),
  // フォント名 Font family
  font-heading: ("Yu Gothic", "YuGothic", "MS Gothic"), // サンセリフ体、ゴシック体などの指定を推奨
  font-main: ("Times New Roman", "Yu Mincho", "YuMincho", "MS Mincho"), // セリフ体、明朝体などの指定を推奨
  font-latin: "Times New Roman", // 欧文フォント
  font-math: "New Computer Modern Math",
  // 外観 Appearance
  paper-margin: (top: 25mm, bottom: 25mm, left: 23mm, right: 23mm),
  paper-columns: 2, // 1: single column, 2: double column
  page-number: none, // e.g. "1/1"
  column-gutter: 4% + 0pt,
  spacing-heading: 1.2em,
  front-matter-order: ("title", "authors", "keywords"), // 独自コンテンツの追加も可能
  front-matter-spacing: 1.5em,
  front-matter-margin: 2.0em,
  abstract-language: "en", // "ja" or "en"
  keywords-language: "en", // "ja" or "en"
  bibliography-style: "ieee", // "sice.csl", "rsj.csl", "ieee", etc.
  // 見出し Headings
  heading-abstract: [*Abstract--*],
  heading-keywords: [_*Keywords*_: ],
  heading-bibliography: [参　考　文　献],
  heading-appendix: [付　録],
  // フォントサイズ Font size
  font-size-title: 16pt,
  font-size-title-en: 12pt,
  font-size-authors: 12pt,
  font-size-authors-en: 12pt,
  font-size-affiliation: 10pt,
  font-size-abstract: 10pt,
  font-size-heading: 10pt,
  font-size-main: 10pt,
  font-size-bibliography: 9pt,
  // 補足語 Supplement
  supplement-image: [図],
  supplement-table: [表],
  supplement-equation-ref: [式],
  supplement-separator: [: ],
  // 番号付け Numbering
  numbering-headings: "1.1.  ",
  numbering-equation: "(1)",
  numbering-appendix: "A.1", // #show: appendix.with(numbering-appendix: "A.1") の呼び出しにも同じ引数を与えてください。
  // 本文
  body,
) = {
  // Set metadata.
  [#metadata(font-heading) <heading-font>]
  [#metadata(heading-appendix) <appendix-heading>]

  // Enable packages.
  show: thmrules.with(qed-symbol: $square$)
  show: codly-init.with()

  // Set document metadata.
  set document(title: title)

  // Configure the page.
  set page(
    paper: "a4",
    margin: paper-margin,
    numbering: page-number,
  )
  set text(font-size-main, font: font-main, lang: "ja")
  set par(leading: 0.5em, justify: true, spacing: 0.6em, first-line-indent: (amount: 1em, all: true))

  // Configure equations.
  set math.equation(numbering: numbering-equation)
  show math.equation: it => {
    set text(font: font-math)
    it
  }

  // Configure appearance of references
  show ref: it => {
    // Equation -> (n).
    // See https://typst.app/docs/reference/model/ref/
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      let num = numbering(el.numbering, ..counter(eq).at(el.location()))
      link(el.location(), [#supplement-equation-ref #num])
    } // Sections -> n章m節l項.
    // Appendix -> 付録A.
    else if el != none and el.func() == heading {
      let sec-cnt = counter(heading).at(el.location())
      if el.numbering != numbering-appendix {
        if el.depth == 1 {
          link(el.location(), [#sec-cnt.at(0)章])
        } else if el.depth == 2 {
          link(el.location(), [#sec-cnt.at(0)章#sec-cnt.at(1)節])
        } else if el.depth == 3 {
          link(el.location(), [#sec-cnt.at(0)章#sec-cnt.at(1)節#sec-cnt.at(2)項])
        }
      } else {
        link(el.location(), [
          付録#numbering(el.numbering, ..sec-cnt)
        ])
      }
    } else {
      it
    }
  }

  // Configure lists.
  set enum(indent: 1em)
  set list(indent: 1em)

  let section_counter = counter("section")
  let subsection_counter = counter("subsection")

  let section = () => context {
    section_counter.display("1")
  }

  let subsection = () => context {
    subsection_counter.display("1")
  }

  // Configure headings.
  set heading(numbering: numbering-headings)
  show heading: set block(spacing: spacing-heading)
  show heading: set text(size: font-size-heading, font: font-heading, weight: "bold")
  show heading.where(level: 1): it => {
    align(center, it)
    section_counter.step()
    subsection_counter.update(1)
  }
  show heading.where(level: 2): it => {
    section() + "・" + subsection() + h(1em) + it.body + h(2em) + [ ]
    subsection_counter.step()
  }

  // Configure figures.
  show figure.where(kind: table): set figure(placement: top, supplement: supplement-table)
  show figure.where(kind: table): set figure.caption(position: top, separator: supplement-separator)
  show figure.where(kind: image): set figure(placement: top, supplement: supplement-image)
  show figure.where(kind: image): set figure.caption(position: bottom, separator: supplement-separator)

  // Title and Authors
  for item in front-matter-order {
    if item == "title" and title != [] {
      // Display the paper's title.
      align(center, text(font-size-title, title, weight: "bold", font: font-heading))
      v(front-matter-spacing, weak: true)
    } else if item == "authors" and authors != [] {
      // Display the authors list.
      align(center, text(font-size-authors, authors, font: font-main))
      v(front-matter-spacing, weak: true)
    } else if item == "title-en" and title-en != [] {
      // Display the paper's title in English.
      align(center, text(font-size-title-en, title-en, weight: "bold", font: font-latin))
      v(front-matter-spacing, weak: true)
    } else if item == "authors-en" and authors-en != [] {
      // Display the authors list in English.
      align(center, text(font-size-authors-en, authors-en, font: font-latin))
      v(front-matter-spacing, weak: true)
    } else if item == "affiliation" and affiliation != () {
      // Display the affiliation list.
      align(center)[
        #set text(font: font-main, size: font-size-affiliation)
        #for (i, a) in affiliation.enumerate() [
          @footnote #a
          #if i < affiliation.len() - 1 [
            \
          ]
        ]
      ]
      v(front-matter-spacing, weak: true)
    } else if item == "abstract" and abstract != none {
      // Display abstract and index terms.
      grid(
        columns: (0.7cm, 1fr, 0.7cm),
        [],
        {
          set par(first-line-indent: 0em)
          if abstract != none {
            set text(
              font-size-abstract,
              font: if abstract-language == "ja" { font-main } else { font-latin },
            )
            [#heading-abstract #h(0.5em) #remove-cjk-break-space(abstract)]
          }
        },
        [],
      )
      v(front-matter-spacing, weak: true)
    } else if item == "keywords" and keywords != () {
      // Display abstract and index terms.
      grid(
        columns: (0.9cm, 1fr, 0.7cm),
        [],
        {
          set par(first-line-indent: 0em)
          if keywords != () {
            set text(
              font-size-abstract,
              font: if keywords-language == "ja" { font-main } else { font-latin },
            )
            [#heading-keywords #h(0.5em) #keywords.join(", ")]
          }
        },
        [],
      )
      v(front-matter-spacing, weak: true)
    } else {
      item
    }
  }

  v(front-matter-margin, weak: true)

  // Start two column mode and configure paragraph properties.
  show: columns.with(paper-columns, gutter: column-gutter)

  // Configure Bibliography.
  set bibliography(title: text(size: font-size-heading, heading-bibliography), style: bibliography-style)
  show bibliography: it => {
    set text(font-size-bibliography, lang: "en")
    show regex("[0-9a-zA-Z]"): set text(font: font-latin)
    it
  }

  // Display the paper's contents.
  remove-cjk-break-space(body)
}

// Appendix
#let appendix(numbering-appendix: "A.1", body) = {
  counter(heading).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  // numbering expects string or function, not accepts content.
  // For this reason, numbering-appendix is set as an argument.
  set heading(numbering: numbering-appendix)
  set figure(numbering: it => {
    [#numbering(numbering-appendix, counter(heading).get().at(0)).#it]
  })
  context {
    heading(
      numbering: none,
      query(<appendix-heading>).first().value,
    )
  }
  body
}
