#import "../thesis.typ": fontstypedict,fontsizedict,linespacing,autoFakeBold_pt
#set align(center)
#text("上海工程技术大学\n学位论文版权使用授权书",size:fontsizedict.三号,font:fontstypedict.黑体,stroke:autoFakeBold_pt)


#set align(left)
#set text(font:fontstypedict.宋体)
#par(justify: true, first-line-indent: 2em, leading: linespacing)[
本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权上海工程技术大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

#h(1em)

#align(left + top,
    box(
    grid(
      columns: (auto, auto,auto,auto),
      gutter: 1em,
      "",rect(width: 9pt, height: 9pt),text("保密",stroke:autoFakeBold_pt,font:fontstypedict.黑体)," ，在年解密后适用本授权书。",
      "本学位论文属于","","","",
      "",rect(width: 9pt, height: 9pt),text("不保密",stroke:autoFakeBold_pt,font:fontstypedict.黑体),"",
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
      "日" + h(2em) + "期：", h(1em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    ),
  )+h(0.5fr)+box(
    grid(
      columns: (auto, auto),
      gutter: 2em,
      "指导老师签名：", "", 
      "日" + h(2em) + "期：", h(1em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    ),
  ),
)

#v(15em)

#pagebreak()