#import "info.typ":*
//-------------------------------------------
// 定义一些常见的变量
//AutoFakeBold 常量
#let autoFakeBold_pt = 0.35pt
// 定义行距
#let linespacing = 1.5em
// 定义字体的大小
#let fontsizedict = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)
// 定义文章中使用到的字体信息
#let fontstypedict = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)
// 定义一个计数器
// 章节计数器
#let chaptercounter = counter("chapter")
// 脚注计数器
#let footnotecounter = counter(footnote)
// 图片计数器
#let imagecounter = counter(figure.where(kind:"figure"))
// 代码计数器
#let rawcounter = counter(figure.where(kind:"code"))
// 表格计数器
#let tablecounter = counter(figure.where(kind:image))
// 方程计数器
#let equationcounter = counter(math.equation)
// 定义三个全局变量，用于标记frontmatter,mainmatter,backmatter
#let matter_state = state("matter","none")
#let frontmatter() = [
  #matter_state.update(matter => "frontmatter")
  #counter(page).update(1)
]
#let mainmatter() = [
  #matter_state.update(matter => "mainmatter")
  #counter(page).update(1)
]
#let backmatter() = [
  #matter_state.update(matter => "backmatter")
  #chaptercounter.update(0)
  #counter(heading).update(0)
]


// 定义一个全局表示盲审模式和正常模式的变量
#let blind_state = state("blind",false)
// 定义一个中文的计数函数
#let chinesenumber(num, standalone: false) = if num < 11 {
  ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(num)
} else if num < 100 {
  if calc.mod(num, 10) == 0 {
    chinesenumber(calc.floor(num / 10)) + "十"
  } else if num < 20 and standalone {
    "十" + chinesenumber(calc.mod(num, 10))
  } else {
    chinesenumber(calc.floor(num / 10)) + "十" + chinesenumber(calc.mod(num, 10))
  }
} else if num < 1000 {
  let left = chinesenumber(calc.floor(num / 100)) + "百"
  if calc.mod(num, 100) == 0 {
    left
  } else if calc.mod(num, 100) < 10 {
    left + "零" + chinesenumber(calc.mod(num, 100))
  } else {
    left + chinesenumber(calc.mod(num, 100))
  }
} else {
  let left = chinesenumber(calc.floor(num / 1000)) + "千"
  if calc.mod(num, 1000) == 0 {
    left
  } else if calc.mod(num, 1000) < 10 {
    left + "零" + chinesenumber(calc.mod(num, 1000))
  } else if calc.mod(num, 1000) < 100 {
    left + "零" + chinesenumber(calc.mod(num, 1000))
  } else {
    left + chinesenumber(calc.mod(num, 1000))
  }
}

#let chinesenumbering(..nums, location: none, brackets: false) = locate(loc => {
  let actual_loc = if location == none { loc } else { location }
  if matter_state.at(loc) == "mainmatter" {
    numbering(if brackets { "(1.1)" } else { "1.1" }, ..nums)
  } else if matter_state.at(loc) == "backmatter" {
    if nums.pos().len() == 1 {
      "附录 " + numbering("A.1", ..nums)
    } else {
      numbering(if brackets { "(A.1)" } else { "A.1" }, ..nums)
    }
  }
})

// 定义一个用于显示中文和英文摘要的函数
#let display_abstract(load_filename,language:"中文") = {
    if language=="中文" {
      set text(font:fontstypedict.宋体)
      par(justify: true, first-line-indent: 2em, leading: linespacing)[
        #align(center+top,text(master_chinese_title,size:fontsizedict.三号,font:fontstypedict.黑体,stroke:autoFakeBold_pt,))

        #align(center+top,text("摘要",size:fontsizedict.三号,font:fontstypedict.黑体,stroke:autoFakeBold_pt))
        #include load_filename
        #import load_filename: 中文关键词

        #linebreak()
        #set par(first-line-indent: 0em)
        #text("关键词：", stroke:autoFakeBold_pt,font:fontstypedict.黑体)
        #中文关键词.join("，")
        #v(2em)
        #pagebreak()
      ]
    }else if language=="英文" {
        par(justify: true, first-line-indent: 2em, leading: linespacing)[
          #align(center+top,text(master_english_title,size:fontsizedict.三号,font:fontstypedict.黑体,weight: "semibold"))

          #align(center+top,text("ABSTRACT",size:fontsizedict.三号,font:fontstypedict.黑体,weight: "semibold"))
          #include load_filename
          #import load_filename: 英文关键词
          #linebreak()
          #set par(first-line-indent: 0em)
          #linebreak()
          #text("KEYWORDS:", weight: "bold")
          #h(0.5em, weak: true)
          #英文关键词.join(", ")
          #v(2em)
          #pagebreak()
      ]
    }else{
        
    }
}
//-------------------------------------------
// 定义硕士学位论文模板
#let sues_thesis_master(
    outlinedepth:3,
    blind: false,
    doc
) = {
    // 设置盲审状态
    blind_state.update(x=>blind)
    // 设置页面大小，以及页眉页脚模式
    set page(
      "a4",
      header: locate(loc =>{[
        #set text(font:fontstypedict.宋体,size:fontsizedict.五号)
        #set align(center)
        #if matter_state.at(loc) == "mainmatter" {
          text("上海工程技术大学硕士学位论文"+h(1fr)+master_chinese_title)
          v(-0.8em)
          line(length: 100%,stroke: 2pt + black,)
          v(-10pt)
          line(length: 100%,stroke: 1pt + black,)
        }
      ]}),
      footer: locate(loc => {[
        #set text(font:fontstypedict.宋体,size:fontsizedict.五号)
        #set align(center)
        #if matter_state.at(loc) == "mainmatter" or matter_state.at(loc) == "backmatter" {
          v(-0.8em)
          line(length: 100%,stroke: 1pt + black,)
          v(-9pt)
          line(length: 100%,stroke: 2pt + black,)
          align(center)[#text("第"+str(counter(page).at(loc).first())+"页")]
        } else if matter_state.at(loc) == "frontmatter" {
          align(center)[#text(str(counter(page).at(loc).first()))]
        }
      ]}),
    )
    // 设置文章的行间距和字体的大小
    // 定义插入列表的格式
    set list(indent: 2em)
    set enum(indent: 2em)
    // 定义字体格式
    show strong: it => text(font: fontstypedict.黑体,weight: "semibold" ,it.body)
    show emph: it => text(font: fontstypedict.楷体,style: "italic" ,it.body)

    // 定义字体格式
    show strong: it => text(font: fontstypedict.黑体,weight: "semibold" ,it.body)
    show emph: it => text(font: fontstypedict.楷体,style: "italic" ,it.body)
    show par: set block(spacing: linespacing)
    show raw: set text(font: fontstypedict.代码)
    // 设置标题格式
    show heading: it => [
      #if it.level == 1 {
        //每章标题前空一行，以三号黑体居中打印。
        set align(center)
        v(1em)
        set text(fontsizedict.三号,stroke:autoFakeBold_pt,font:fontstypedict.黑体)
        // “章”下空一行为“节”，
        "第" + chinesenumber(int(chaptercounter.display())) +"章" + h(1em)+it.body
        v(1em)
      } else {
            set par(first-line-indent: 0em)
            
            // 以四号黑体左起打印。
            //“小节”以小四号黑体左起打印。换行后打印论文正文。“节”和“小节”标题的段前、段后各空0.5行。
            if it.level == 2 {
                // 二级标题
                v(0.5em)
                set text(fontsizedict.四号,stroke:autoFakeBold_pt,font:fontstypedict.黑体)
                strong(counter(heading).display())
                h(0.5em)
                it.body
                v(0.5em)
            } else if it.level == 3 {
                // 三级标题
                v(0.5em)
                set text(it,fontsizedict.小四,stroke:autoFakeBold_pt,font:fontstypedict.黑体)
                strong(counter(heading).display())
                h(0.5em)
                it.body
                v(0.5em)
            } else {
                // 三级标题以下
                v(0.5em)
                set text(it,fontsizedict.小四,stroke:autoFakeBold_pt,font:fontstypedict.黑体)
                strong(counter(heading).display())
                h(0.5em)
                it.body
                v(0.5em)
            }
        }
    ]

    // 定义插入的方程格式
    set math.equation(
        numbering: (..nums) => locate(loc => {
            set text(font:fontstypedict.宋体)
            if matter_state.at(loc) == "mainmatter"{
                numbering("(1-1)",chaptercounter.at(loc).first(),..nums)
            }
            else if matter_state.at(loc) == "backmatter" {
                numbering("(A-1)",chaptercounter.at(loc).first(),..nums)
            } else {
                //其他的情况并不做讨论
            }
        })
    )
    // 初始化
    chaptercounter.update(1)
    // 论文正文
    set align(left + top)
    // 论文字体大小
    set text(fontsizedict.小四, font: fontstypedict.宋体, lang: "zh")
    set heading(numbering: chinesenumbering)
    // 正文中文为宋体，非中文为Times New Roman字体，小四，1.5倍行间距，首行缩进2字符。
    set text(size:fontsizedict.小四,font:fontstypedict.宋体)
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
            #doc
    ]
    
}
