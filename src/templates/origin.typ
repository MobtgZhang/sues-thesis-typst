#import "../functions/style.typ": *
#import "../functions/style.typ": *

#heading(numbering: none, outlined: false, "上海工程技术大学\n\n学位论文原创性声明")
#set text(font:fontstypedict.宋体)
#par(justify: true, first-line-indent: 2em, leading: linespacing)[
本人郑重声明：所递交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
]

  
#v(15em)
#align(right + top, 
  box(
    grid(
      columns: (auto, auto),
      gutter: 2em,
      "学位论文作者签名：", "", 
      "日" + h(2em) + "期：", h(2.5em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    )
  )
)

#pagebreak()

#heading(numbering: none, outlined: false, "上海工程技术大学\n\n学位论文版权使用授权书")
#set text(font:fontstypedict.宋体)
#par(justify: true, first-line-indent: 2em, leading: linespacing)[
本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权上海工程技术大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

#h(1em)

#align(left + top,
    box(
    grid(
      columns: (auto, auto,auto,auto),
      gutter: 1em,
      "",rect(width: 9pt, height: 9pt),text("保密",weight: "semibold"),"",
      "本学位论文属于","",""," ，在年解密后适用本授权书。",
      "",rect(width: 9pt, height: 9pt),text("不保密",weight: "semibold"),"",
    )
  )
)
]

#align(center + bottom, 
  box(
    grid(
      columns: (auto, auto),
      gutter: 2em,
      "学位论文作者签名：", "", 
      "日" + h(2em) + "期：", h(2.5em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    ),
  )+h(1fr)+box(
    grid(
      columns: (auto, auto),
      gutter: 2em,
      "指导老师签名：", "", 
      "日" + h(2em) + "期：", h(2.5em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    ),
  ),
)
