#import "../thesis.typ":fontstypedict,fontsizedict
#import "@preview/tablex:0.0.6": tablex,hlinex

#v(1em)
#align(
  center,
  text("符号和缩略词说明",font:fontstypedict.黑体,size:fontsizedict.三号)
)

对文中所用符号缩略词所表示的意义以及单位（或者量纲）的说明。在目录中不出现，若不需要说明，则删除此页面。

这里使用三线表举个例子。这里的符号描述可以使用三线表描述一些符号和缩略词，在学术文章当中经常使用到一种表格。插入表格，一般最上面线和最下面线宽度为1.5pt，中间线条宽度为0.75pt。下面的三线表是一个最为简单的例子：

#figure(
  tablex(
    auto-lines:false,
    align: center + horizon,
    columns: (1fr, 1fr),
    size:fontsizedict.三号,
    hlinex(y: 0,stroke: 1.5pt,expand:-50pt),
    hlinex(y: 1,stroke: 0.75pt,expand:-50pt),
    [符号表示],[符号意义],
    [$e$],[数学自然对数],
    [$pi$],[数学圆周率],
    [$epsilon$],[介电值常数],
    [$G$],[万有引力常数],
    [$k$],[波尔兹曼常数],
    hlinex(stroke: 1.5pt,expand:-50pt),),
  caption:"一个三线表的示例"
)

#pagebreak()
