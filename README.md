# 修論 (卒論でも使える) 用のTypstのテンプレート
オリジナルリポジトリ (フォーク元): [ut-khanlab/master_thesis_template_for_typst](https://github.com/ut-khanlab/master_thesis_template_for_typst) を元に機械工学専攻向けにアップデートをしたもの．

## Typstとは
### LaTeXの代替・最近できた組版ソフト
- [Typst: The new foundation for documents](https://typst.app/)
- [Typst: いい感じのLaTeXの代替](https://www-het.phys.sci.osaka-u.ac.jp/~yamaguch/j/typst.html)

### ダウンロード・インストール
- [Typstの環境構築 Windows編](https://qiita.com/denkiuo604/items/21e8758ab160bf895e34)


### メリット
- 導入・環境構築がすぐできる: Windows/Mac/Linux (Ubuntu) どれも対応
- 文法が簡単（e.g. ”\frac{x}{y}”→”x / y”, “\section{title}”→”= title”）
- **コンパイルが高速で，リアルタイムプレビューに特化**
- LaTeXでできることは大体全部できる（BibTeXにも対応）

### デメリット
- 情報・ドキュメントが少なく，ChatGPTなどLLMの出力が不得意
- 細部の自由度が低いときがある

## 使い方 (VSCode)
1. 本リポジトリをclone
1. VSCodeで開く
1. 拡張機能: **Tinymist**をインストール

### ファイルのリアルタイムプレビュー
`main.typ`，または`abstract.typ`を開いた状態で，
- Ctrl + K -> V
- Ctrl + Shift + P -> "Typst Preview: 開いているファイルのプレビュー"

### pdfの生成
`main.typ`，または`abstract.typ`を開いた状態で，
- Ctrl + Shift + P -> "Typst: エクスポートされたPDFを表示"

### フォント変更
`template.typ`内の以下の部分を編集
```typst
set text(font: (
    "Times New Roman", // Windows
    // "Nimbus Roman", // Ubuntu
    // "Hiragino Mincho ProN", // Mac
    "Yu Mincho", // Windows
    // "Noto Serif CJK JP", // Ubuntu
    ),
```

## リファレンス
- [公式ドキュメント](https://typst.app/docs/)
- [Tinymist](https://github.com/Myriad-Dreamin/tinymist)
- [LatexからTypstへの数式変換](https://tex2typst-math.tompython.com) ([リポジトリ](https://github.com/chantakan/tex2typst-math))
