#import "../info.typ":*
#import "../thesis.typ": fontstypedict,fontsizedict,linespacing,blind_state
#set align(center + top)
#[
  #set text(font:fontstypedict.宋体,weight: "semibold",size:fontsizedict.四号)
  #table(
    stroke:none,
    align: (right,left,center,right,left),
    columns: (auto,50pt,160pt,auto,50pt),
    [中图片分类号：],
    [#master_classification_num],
    [],
    [学校代码：],
    [10856],
    [],
    [],
    [],
    [学#h(2em)号：],
    [#master_class_number]
  )
]

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
#[
  #set text(font: fontstypedict.黑体, size: fontsizedict.一号, weight: "semibold")
  #table(
    align: center,
    columns: (400pt),
    stroke: none,
    par(master_chinese_title,leading:1em)
  )
]

#v(20pt)

#let fieldname(name,align_v:right) = [
  #set align(align_v + top)
  #text(name,font:fontstypedict.宋体,weight:"semibold")
  #h(0.25em)
]

#let fieldvalue(value,uline:false) = {
  if uline {
    set align(left + horizon)
    set text(font: fontstypedict.宋体)
    grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      value,
      line(length: 100%)
    )
  } else {
    set align(left + horizon)
    set text(font: fontstypedict.宋体, weight: "bold")
    grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      value
    )
  }
  
}

#set text(fontsizedict.小三)
#set align(center)
#grid(
  columns: (80pt, 160pt),
  row-gutter: 1em,
  fieldname("作者姓名："),
  (if blind_state {
      fieldvalue("")
    }else{
      fieldvalue(master_chinese_candidate_name)
  }),
  fieldname("指导教师："),
  fieldvalue(master_chinese_supervisor_name),
  fieldname(text("专") + h(2em) + text("业：")),
  fieldvalue(master_chinese_major_name),
  fieldname(text("学") + h(2em) + text("院：")),
  fieldvalue(master_chinese_faculty_name),
  fieldname("申请学位："),
  fieldvalue(master_degree_name),
  fieldname("完成日期："),
  fieldvalue(master_chinese_finish_date_time),
)

#set align(right + bottom)
#set text(font:fontstypedict.宋体,size:fontsizedict.小四)
#v(1em)
#grid(
  columns: (80pt, 120pt),
  row-gutter: 1em,
  fieldname("评阅人：",align_v:left),
  fieldvalue(master_reviewer,uline:true),
  fieldname("答辩委员会：",align_v:left),
  fieldvalue("主席："+ master_chairman,uline:true),
  fieldname(""),
  fieldvalue("成员："+ master_member_first,uline:true),
  fieldname(h(4em)),
  fieldvalue(h(3em) + master_member_second,uline:true),
)
#pagebreak()

// 英文封面页信息
#set align(center + top)
#[
  #set text(font:fontstypedict.宋体,weight: "semibold",size:fontsizedict.四号)
  #table(
    stroke: none,
    align: (center,center,center,right,left),
    columns: (auto,50pt,190pt,auto,50pt),
    [],
    [],
    [],
    [University Code:],
    [10856],
    [],
    [],
    [],
    [Student ID:],
    [#master_class_number]
  )
]
#set align(center + horizon)

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../logo-mark-fade.png", height: 120pt, fit: "contain")
  )
)
#v(3em)
#[
  #set text(font: fontstypedict.黑体, size: fontsizedict.小二, weight: "semibold")
  #table(
    align: center,
    columns: (370pt),
    stroke: none,
    par(master_english_title,leading:1em)
  )
]
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

#pagebreak()



