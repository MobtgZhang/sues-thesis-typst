#import "../functions/style.typ": *
#import "../functions/underline.typ": *
#import "../functions/hline.typ": *
#import "../../info.typ": *


#set align(center + horizon)

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../logo.png", height: 3em, fit: "contain")
  )
)

#text("Shanghai University of Engineering Science", font: fontstypedict.宋体, size: fontsizedict.二号, weight: "semibold")
#v(1em)
#text("毕业设计（论文）", font: fontstypedict.黑体, size: fontsizedict.小初, weight: "semibold")

#set text(fontsizedict.二号)
#v(60pt)
#grid(
  columns: (80pt, 300pt), 
  [
    #set align(right + top)
    题目：
  ],
  [
    #set align(center + horizon)
    #chineseunderline(bachelor_chinese_title, width: 300pt, bold: true)
  ]
)

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

#grid(
  columns: (80pt, 280pt),
  row-gutter: 1em,
  fieldname(text("学") + h(2em) + text("院")),
  fieldvalue(bachelor_chinese_faculty_name),
  fieldname(text("专") + h(2em) + text("业")),
  fieldvalue(bachelor_chinese_major_name),
  fieldname(text("姓") + h(2em) + text("名")),
  fieldvalue(bachelor_chinese_candidate_name),
  fieldname("指导教师"),
  fieldvalue(bachelor_chinese_supervisor_name),
  fieldname("完成日期"),
  fieldvalue(bachelor_chinese_finish_date_time),
)

