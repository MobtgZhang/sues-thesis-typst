#import "info.typ":*
//-------------------------------------------
// 定义一些常见的变量
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
// 定义三个全局变量，用于标记frontmatter,mainmatter,backmatter
#let tempory_condition_matter = "None"
#let frontmatter() = {
  let tempory_condition_matter = "frontmatter"
}
#let mainmatter() = {
  let tempory_condition_matter = "mainmatter"
}
#let backmatter() = {
  let tempory_condition_matter = "backmatter"
}
// 定义一个全局表示盲审模式和正常模式的变量
#let blind_state = false
// 定义一个用于显示中文和英文摘要的函数
#let display_abstract(load_filename,language:"中文") = {
    if language=="中文" {
      set text(font:fontstypedict.宋体)
      par(justify: true, first-line-indent: 2em, leading: linespacing)[
        #align(center+top,text(master_chinese_title,size:fontsizedict.三号,font:fontstypedict.黑体))

        #align(center+top,text("摘要",size:fontsizedict.三号,font:fontstypedict.黑体))
        #include load_filename
        #import load_filename: 中文关键词

        #linebreak()
        #set par(first-line-indent: 0em)
        #text("关键词：", weight: "bold")
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
    let blind_state = blind
    // 设置页面大小
    set page("a4")
    // 设置文章的行间距和字体的大小
    // 定义插入列表的格式
    set list(indent: 2em)
    set enum(indent: 2em)
    // 定义字体格式
    show strong: it => text(font: fontstypedict.黑体,weight: "semibold" ,it.body)
    show emph: it => text(font: fontstypedict.楷体,style: "italic" ,it.body)


    // 定义三级标题格式
    show heading: it => [
        // 取消空格
        #set par(first-line-indent: 0em)
        #let sizedheading(it,size) = [
          #set text(size)
          #v(2em)
          #if it.numbering != none {
                strong(counter(heading).display())
                h(0.5em)
            }
            #strong(it.body)
            #v(1em)
        ]
        // 设置一级标题
        #if it.level == 1 {
            if tempory_condition_matter=="mainmatter" {
                
            }
            
            set align(center)
            sizedheading(it, fontsizedict.三号)
        }
    ]
    // 论文正文
    set align(left + top)
    set text(size:fontsizedict.小四,font:fontstypedict.宋体)
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
            #doc
    ]
    
}
