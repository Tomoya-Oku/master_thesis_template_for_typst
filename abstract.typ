#import "template/template_abstract.typ": *

// デフォルト値でよい引数は省略可能
#show: jaconf.with(
  // 基本 Basic
  title: [多関節飛行ロボットによる接触作業に向けた \ 力覚提示を有する上肢外骨格型遠隔操作システムの開発],
  authors: "奥 朋哉",
  keywords: ([Teleoperation], [Exoskeleton], [Articulated Aerial Robot]),
  // フォント名 Font family
  font-heading: ("YuGothic", "Yu Gothic", "Noto Serif CJK JP"), // サンセリフ体，ゴシック体などの指定を推奨
  font-main: ("Times New Roman", "YuMincho", "Yu Mincho"), // セリフ体，明朝体などの指定を推奨
  font-latin: "Times New Roman",
  font-math: "New Computer Modern Math",
  // 外観 Appearance
  paper-margin: (top: 25mm, bottom: 25mm, left: 15mm, right: 15mm),
  paper-columns: 2, // 1: single column, 2: double column
  page-number: none, // e.g. "1/1"
  column-gutter: 4% + 0pt,
  spacing-heading: 1.2em,
  front-matter-order: ("title", "authors", "keywords"), // 独自コンテンツの追加も可能
  abstract-language: "ja", // "ja" or "en"
  keywords-language: "en", // "ja" or "en"
  front-matter-spacing: 1.5em,
  front-matter-margin: 2.0em,
  // 見出し Headings
  heading-abstract: [],
  heading-keywords: [_*Keywords*_: ],
  heading-bibliography: [参考文献],
  heading-appendix: [付録],
  // フォントサイズ Font size
  font-size-title: 14pt,
  font-size-title-en: 12pt,
  font-size-authors: 12pt,
  font-size-authors-en: 12pt,
  font-size-abstract: 10pt,
  font-size-heading: 10pt,
  font-size-main: 10pt,
  font-size-bibliography: 10pt,
  // 補足語 Supplement
  supplement-image: [Fig.],
  supplement-table: [Table],
  supplement-separator: [~],
  // 番号付け Numbering
  numbering-headings: "1.1.  ",
  numbering-equation: "(1)",
  numbering-appendix: "A.1", // #show: appendix.with(numbering-appendix: "A.1") の呼び出しにも同じ引数を与えてください．
)
