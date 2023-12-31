#import "../functions/style.typ": *
#import "../functions/underline.typ": *
#import "../functions/hline.typ": *
#import "../../info.typ": *
#import "../functions/style.typ": *

#set align(center + horizon)

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../logo-mark.png", height: 150pt, fit: "contain")
  )
)
#linebreak()
#v(2em)
#text("硕士学位毕业设计论文", font: fontstypedict.宋体, size: fontsizedict.小初, weight: "semibold", fill: emphcolor)

#hline(thickness: 3pt)
#v(-0.8em)
#hline(thickness: 1.2pt)

#v(60pt)
#set text(fontsizedict.三号)

#let fieldname(name) = [
  #set align(right + top)
  #strong(name)
  #h(0.25em)
]

#let fieldvalue(value) = [
  #set align(center + horizon)
  #set text(font: fontstypedict.宋体)
  #grid(
    rows: (auto, auto),
    row-gutter: 0.2em,
    value,
    line(length: 100%)
  )
]

#box(
    grid(
    columns: (80pt, 280pt),
    row-gutter: 1em,
    fieldname("论文题目"),
    fieldvalue(master_chinese_title),
    fieldname(text("专") + h(2em) + text("业")),
    fieldvalue(master_chinese_major_name),
    fieldname(text("姓") + h(2em) + text("名")),
    fieldvalue(master_chinese_candidate_name),
    fieldname("指导教师"),
    fieldvalue(master_chinese_supervisor_name),
    fieldname("完成日期"),
    fieldvalue(master_chinese_finish_date_time),
  )
)

