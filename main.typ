#import "template/template.typ": *
#show: master_thesis.with(
  class: "修士",
  title: [多関節飛行ロボットによる接触作業に向けた \ 力覚提示を有する \ 上肢外骨格型遠隔操作システムの開発],
  date: datetime(year: 2027, month: 1, day: 28),
  mentor: "趙 漠居",
  mentor-post: "講師",
  university: "東京大学大学院",
  school: "工学系研究科",
  department: "機械工学専攻",
  id: "37-256208",
  author: "奥 朋哉",
  bibliography-file: "references.bib",
)

= 序論 <chap:intro>

= 先行研究と提案手法 <chap:previous_work>

= 上肢外骨格デバイスの設計 <chap:design>

== 操作対象となる多関節飛行ロボット

== 人間の腕の構造 <sec:structure_of_human_uplimb>

人間の腕は@fig:structure_of_human_uplimb で示すように，肩関節が3自由度，肘関節が2自由度，手首関節が2自由度の計7自由度で構成されている．

#img(
  image("assets/structure_of_human_uplimb.png", width: 75%),
  caption: "Structure of human up-limb",
)<fig:structure_of_human_uplimb>

= 実験

= 結論
