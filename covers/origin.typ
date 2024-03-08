#import "../thesis.typ":fontstypedict,linespacing,fontsizedict
#set align(center)
#text("上海工程技术大学\n学位论文原创性声明",size:fontsizedict.三号,font:fontstypedict.黑体)

#set align(left)
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

