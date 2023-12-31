#import "../functions/style.typ": *
#import "../../info.typ": *

#set text(font:fontstypedict.宋体)
#par(justify: true, first-line-indent: 2em, leading: linespacing)[
  #heading(numbering: none, outlined: false, "摘要")
  
  #include "../../chapters/abstract-cn.typ"
  #import "../../chapters/abstract-cn.typ": 中文关键词

  #linebreak()
  #set par(first-line-indent: 0em)
  #text("关键词：", weight: "bold")
  #中文关键词.join("，")
  #v(2em)
]
