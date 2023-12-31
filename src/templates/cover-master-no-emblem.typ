#import "../functions/style.typ": *
#import "../functions/underline.typ": *
#import "../functions/hline.typ": *
#import "../../info.typ": *

// 中文封面页信息
#set align(center + horizon)

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../logo-mark-fade.png", height: 120pt, fit: "contain")
  )
)
#v(3em)
#text("上海工程技术大学硕士学位论文", font: fontstypedict.黑体, size: fontsizedict.小二, weight: "semibold")
#v(1em)
#text(master_chinese_title, font: fontstypedict.黑体, size: fontsizedict.一号, weight: "semibold")

#v(60pt)
#set text(fontsizedict.三号)

#let fieldname(name) = [
  #set align(right + top)
  #strong(name)
  #h(0.25em)
]

#let fieldvalue(value,uline:true) = {
  if uline {
    set align(center + horizon)
    set text(font: fontstypedict.宋体)
    grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      value,
      line(length: 100%)
    )
  } else {
    set align(left + horizon)
    set text(font: fontstypedict.宋体, weight: "semibold")
    grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      value
    )
  }
  
}

#set text(fontsizedict.小四)
#grid(
  columns: (80pt, 160pt),
  row-gutter: 1em,
  fieldname("作者姓名"),
  fieldvalue(master_chinese_faculty_name),
  fieldname("指导教师"),
  fieldvalue(master_chinese_supervisor_name),
  fieldname(text("专") + h(2em) + text("业")),
  fieldvalue(master_chinese_major_name),
  fieldname(text("学") + h(2em) + text("院")),
  fieldvalue(master_chinese_candidate_name),
  fieldname("申请学位"),
  fieldvalue(master_degree_name),
  fieldname("完成日期"),
  fieldvalue(master_chinese_finish_date_time),
)

#set align(right + bottom)
#v(1em)
#grid(
  columns: (80pt, 120pt),
  row-gutter: 1em,
  fieldname("评阅人"),
  fieldvalue(master_reviewer),
  fieldname("答辩委员会"),
  fieldvalue(master_chairman),
  fieldname("成员"),
  fieldvalue(master_member_first),
  fieldname(h(4em)),
  fieldvalue(master_member_second),
)
#pagebreak()

// 英文封面页信息
#set align(center + horizon)

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../logo-mark-fade.png", height: 120pt, fit: "contain")
  )
)
#v(3em)
#text(master_english_title, font: fontstypedict.黑体, size: fontsizedict.小二, weight: "semibold")
#v(6em)

#set text(fontsizedict.小三)
#grid(
  columns: (80pt, 220pt),
  row-gutter: 1em,
  fieldname("Candidate:"),
  fieldvalue(master_english_candidate_name,uline:false),
  fieldname("Supervisor:"),
  fieldvalue(master_english_supervisor_name,uline:false),
  fieldname("Major:"),
  fieldvalue(master_english_major_name,uline:false),
)


#let print_line = master_english_faculty_name+"\n"+"Shanghai University of Engineering Science\n Shanghai, P.R. China\n"+master_english_finish_date_time
#v(6em)

#par(justify: true,leading: 1.2em)[
      #text(print_line,font: fontstypedict.宋体, size: fontsizedict.小二, weight: "semibold")
]





