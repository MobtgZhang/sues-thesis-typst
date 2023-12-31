#import "src/functions/allinone.typ": *
#import "info.typ": *
// 定义硕士学位论文模板
#let sues_thesis_master(
    outlinedepth:3,
    blind: false,
    listofimage: true,
    listoftable: true,
    listofcode: true,
    doc
) = {
    // 定义纸张类型和页眉页脚
    set page(
        "a4",
        header: locate(loc => {
        [
            #set text(fontsizedict.五号, font: fontstypedict.宋体)
            #set align(center)
            #if partcounter.at(loc).at(0) < 10 {
            // Handle the first page of Chinese abstract specailly
            let headings = query(selector(heading).after(loc), loc)
            let next_heading = if headings == () {
                ()
            } else {
                headings.first().body.text
            }
            if next_heading == "摘要" and calc.odd(loc.page()) {
                [
                #text(
                    "上海工程技术大学硕士学位论文"+h(1fr)+master_chinese_title
                )
                #v(-0.8em)
                #line(length: 100%)
                ]
            }
            } else if partcounter.at(loc).at(0) > 20 {
            } else {
            if calc.even(loc.page()) {
                [
                    #text(
                        "上海工程技术大学硕士学位论文"+h(1fr)+master_chinese_title
                    )
                    #v(-0.8em)
                    #line(length: 100%,stroke: 2pt + black,)
                    #v(-10pt)
                    #line(length: 100%,stroke: 1pt + black,)
                ]
            } else {
                let footers = query(selector(<__footer__>).after(loc), loc)
                let elems = if footers == () {
                ()
                } else {
                query(
                    heading.where(level: 1).before(footers.first().location()), footers.first().location()
                )
                }
                if elems == () {
                } else {
                    let el = elems.last()
                    /*
                    #let grad = gradient.linear((black, 0%),(black, 50%),(white, 50%),(white, 75%), (black, 75%),(black, 100%), dir: ttb)
#rect(fill: grad, width: 100%, height: 6pt)
                    
                    */
                    text("上海工程技术大学硕士学位论文"+h(1fr)+master_chinese_title)
                    v(-0.8em)
                    line(length: 100%,stroke: 2pt + black,)
                    v(-10pt)
                    line(length: 100%,stroke: 1pt + black,)
                }
            }
            }
        ]
        }),
        footer: locate(loc => {
        [
            #set text(fontsizedict.五号)
            #set align(center)
            #if query(selector(heading).before(loc), loc).len() < 2 or query(selector(heading).after(loc), loc).len() == 0 {
            // Skip cover, copyright and origin pages
            } else {
            let headers = query(selector(heading).before(loc), loc)
            let part = partcounter.at(headers.last().location()).first()
            [
                #if part < 20 {
                    numbering("I", counter(page).at(loc).first())
                    
                } else {
                    v(-0.8em)
                    line(length: 100%,stroke: 1pt + black,)
                    v(-10pt)
                    line(length: 100%,stroke: 2pt + black,)
                    "第"+str(counter(page).at(loc).first())+"页"
                }
            ]
            }
            #label("__footer__")
        ]
        }),
    )

    // 定义插入的方程格式
    set math.equation(
        numbering: (..nums) => locate(loc => {
            set text(font:fontstypedict.宋体)
            if appendixcounter.at(loc).first() < 10{
                numbering("(1.1)",chaptercounter.at(loc).first(),..nums)
            } else {
                numbering("(A.1)",chaptercounter.at(loc).first(),..nums)
            }
        })
    )
    // 定义插入列表的格式
    set list(indent: 2em)
    set enum(indent: 2em)
    // 定义字体格式
    show strong: it => text(font: fontstypedict.黑体,weight: "semibold" ,it.body)
    show emph: it => text(font: fontstypedict.楷体,style: "italic" ,it.body)
    show par: set block(spacing: linespacing)
    show raw: set text(font: fontstypedict.代码)
    // 定义三级标题格式
    show heading: it => [
        // 对于二级或二级标题以上的，取消空格
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
        // 一级标题
        #if it.level == 1 {
            if not it.body.text in ("ABSTRACT", "学位论文使用授权说明")  {
                pagebreak(weak: true)
            }
            locate(loc => {
                if it.body.text == "摘要" {
                    partcounter.update(10)
                    counter(page).update(1)
                    } else if it.numbering != none and partcounter.at(loc).first() < 20 {
                    partcounter.update(20)
                    counter(page).update(1)
                }
            })
            if it.numbering != none {
                chaptercounter.step()
            }
            footnotecounter.update(())
            imagecounter.update(())
            tablecounter.update(())
            rawcounter.update(())
            equationcounter.update(())

            set align(center)
            sizedheading(it, fontsizedict.三号)
        } else {
            if it.level == 2 {
                // 二级标题
                sizedheading(it,fontsizedict.四号)
            } else if it.level == 3 {
                // 三级标题
                sizedheading(it,fontsizedict.中四)
            } else {
                // 三级标题以下
                sizedheading(it,fontsizedict.小四)
            }
        }
    ]

    // 定义插入图片、表格和代码的浮动体格式
    show figure: it => [
        #set align(center)
        #if not it.has("kind"){
            it
        } else if it.kind == image {
            it.body
            [
                #set text(size: fontsizedict.五号)
                #it.caption
            ]
        } else if it.kind == table {
            [
                #set text(size: fontsizedict.五号)
                #it.caption
            ]
            it.body
        } else if it.kind == "code" {
            [
                #set text(size: fontsizedict.五号)
                #it.caption
            ]
            it.body
        }
    ]

    // 定义ref引用的格式
    show ref: it => {
        if it.element == none {
            it
        } else {
            h(0em,weak: true)

            let el = it.element
            let el_loc = el.location()
            if el.func() == math.equation {
                // 处理方程的引用
                link(el_loc,[
                    式
                    #chinesenumbering(chaptercounter.at(el_loc).first(),
                        equationcounter.at(el_loc).first(),location: el_loc,brackets: true)
                ])
            } else if el.func() == figure {
                if el.kind == image {
                    // 处理图片的引用
                    link(el_loc,[
                        图
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            imagecounter.at(el_loc).first(),location: el_loc)
                    ])
                } else if el.kind == table {
                    // 处理表格引用
                    link(el_loc,[
                        表
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            tablecounter.at(el_loc).first(),location: el_loc)
                    ])
                } else if el.kind == "code" {
                    // 处理代码引用
                    link(el_loc,[
                        代码
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            rawcounter.at(el_loc).first(),location: el_loc)
                    ])
                } else {
                    // 其他情况暂时不做处理
                }
            } else if el.func() == heading {
                // 处理标题的引用
                if el.level == 1 {
                    link(el_loc,chinesenumbering(..counter(heading).at(el_loc),location: el_loc))
                } else {
                    link(el_loc,[
                        节
                        #chinesenumbering(..counter(heading).at(el_loc),location: el_loc)
                    ])
                }
            } else {
                // 其他情况暂时不做处理
            }
        }
    }
    // 论文中英文封面
    include("src/templates/cover-master.typ")
    pagebreak()
    include("src/templates/cover-master-no-emblem.typ")
    pagebreak()
    // 原创性和授权书
    include("src/templates/origin.typ")
    pagebreak()
    // 中英文摘要
    include("src/templates/abstract-cn.typ")
    pagebreak()
    include("src/templates/abstract-en.typ")
    pagebreak()

    // 论文字体大小
    set align(left + top)
    set text(fontsizedict.小四, font: fontstypedict.宋体, lang: "zh")
    set heading(numbering: chinesenumbering)
    // 插入目录
    locate(loc => {
        chineseoutline(
        title: "目录",
        depth: outlinedepth,
        indent: true,
        )
    })
    // 图片目录
    if listofimage {
        listoffigures(title: "插图目录", kind: image)
    }
    // 表格目录
    if listoftable {
        listoffigures(title: "表格目录", kind: table)
    }
    // 代码目录
    if listofcode {
        listoffigures(title: "代码目录", kind: "code")
    }
    pagebreak()
    // 论文正文
    set align(left + top)
        par(justify: true, first-line-indent: 2em, leading: linespacing)[
            #doc
    ]
    // 攻读学位期间发表的学术论文目录
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
      #heading(numbering: none, "攻读硕士学位期间发表的学术论文及取得的相关科研成果")
      
      #include "chapters/achievements.typ"
    ]
    // 致谢
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
      #heading(numbering: none, "致谢")
      
      #include "chapters/acknowledgement.typ"
    ]
}
// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------
// 定义学士学位论文模板
#let sues_thesis_bachelor(
    outlinedepth:3,
    blind: false,
    listofimage: true,
    listoftable: true,
    listofcode: true,
    doc
) = {
    // 定义纸张类型和页眉页脚
    set page(
        "a4",
        header: locate(loc => {
        [
            #set text(fontsizedict.五号)
            #set align(center)
            #if partcounter.at(loc).at(0) < 10 {
            // Handle the first page of Chinese abstract specailly
            let headings = query(selector(heading).after(loc), loc)
            let next_heading = if headings == () {
                ()
            } else {
                headings.first().body.text
            }
            if next_heading == "摘要" and calc.odd(loc.page()) {
                [
                #text(
                    "上海工程技术大学毕业设计（论文）"+h(1fr)+bachelor_chinese_title
                )
                #v(-0.8em)
                #line(length: 100%)
                ]
            }
            } else if partcounter.at(loc).at(0) > 20 {
            } else {
            if calc.even(loc.page()) {
                [
                    #text(
                        "上海工程技术大学毕业设计（论文）"+h(1fr)+bachelor_chinese_title
                    )
                    #v(-0.8em)
                    #line(length: 100%)
                ]
            } else {
                let footers = query(selector(<__footer__>).after(loc), loc)
                let elems = if footers == () {
                ()
                } else {
                query(
                    heading.where(level: 1).before(footers.first().location()), footers.first().location()
                )
                }
                if elems == () {
                } else {
                let el = elems.last()
                [
                    // #let numbering = if el.numbering == chinesenumbering {
                    //   chinesenumbering(..counter(heading).at(el.location()), location: el.location())
                    // } else if el.numbering != none {
                    //   numbering(el.numbering, ..counter(heading).at(el.location()))
                    // }
                    // #if numbering != none {
                    //   numbering
                    //   h(0.5em)
                    // }
                    #text(
                        "上海工程技术大学毕业设计（论文）"+h(1fr)+bachelor_chinese_title
                    )
                    #v(-0.8em)
                    #line(length: 100%)
                ]
                }
            }
            }
        ]
        }),
        footer: locate(loc => {
        [
            #set text(fontsizedict.五号)
            #set align(center)
            #if query(selector(heading).before(loc), loc).len() < 2 or query(selector(heading).after(loc), loc).len() == 0 {
            // Skip cover, copyright and origin pages
            } else {
            let headers = query(selector(heading).before(loc), loc)
            let part = partcounter.at(headers.last().location()).first()
            [
                #if part < 20 {
                numbering("I", counter(page).at(loc).first())
                } else {
                str(counter(page).at(loc).first())
                }
            ]
            }
            #label("__footer__")
        ]
        }),
    )






    // 定义插入的方程格式
    set math.equation(
        numbering: (..nums) => locate(loc => {
            set text(font:fontstypedict.宋体)
            if appendixcounter.at(loc).first() < 10{
                numbering("(1.1)",chaptercounter.at(loc).first(),..nums)
            } else {
                numbering("(A.1)",chaptercounter.at(loc).first(),..nums)
            }
        })
    )
    // 定义插入列表的格式
    set list(indent: 2em)
    set enum(indent: 2em)
    // 定义字体格式
    show strong: it => text(font: fontstypedict.黑体,weight: "semibold" ,it.body)
    show emph: it => text(font: fontstypedict.楷体, style: "italic" ,it.body)
    show par: set block(spacing: linespacing)
    show raw: set text(font: fontstypedict.代码)
    // 定义三级标题格式
    show heading: it => [
        // 对于二级或二级标题以上的，取消空格
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
        // 一级标题
        #if it.level == 1 {
            if not it.body.text in ("ABSTRACT","学位论文使用授权说明") {
                pagebreak(weak: true)
            }
            locate(loc => {
                if it.body.text == "摘要" {
                    partcounter.update(10)
                    counter(page).update(1)
                } else if it.numbering != none and partcounter.at(loc).first() < 20 {
                    partcounter.update(20)
                    counter(page).update(1)
                }
            })
            if it.numbering != none {
                chaptercounter.step()
            }
            footnotecounter.update(())
            imagecounter.update(())
            tablecounter.update(())
            rawcounter.update(())
            equationcounter.update(())

            set align(center)
            sizedheading(it,fontsizedict.三号)
        } else {
            if it.level == 2 {
                // 二级标题
                sizedheading(it,fontsizedict.四号)
            } else if it.level == 3 {
                // 三级标题
                sizedheading(it,fontsizedict.中四)
            } else {
                // 三级标题以下
                sizedheading(it,fontsizedict.小四)
            }
        }
    ]

    // 定义插入图片、表格和代码的浮动体格式
    show figure: it => [
        #set align(center)
        #if not it.has("kind"){
            it
        } else if it.kind == image {
            it.body
            [
                #set text(size:fontsizedict.五号)
                #it.caption
            ]
        } else if it.kind == table {
            [
                #set text(size:fontsizedict.五号)
                #it.caption
            ]
            it.body
        } else if it.kind == "code" {
            [
                #set text(size:fontsizedict.五号)
                #it.caption
            ]
            it.body
        }
    ]

    // 定义ref引用的格式
    show ref: it => {
        if it.element == none {
            it
        } else {
            h(0em,weak: true)

            let el = it.element
            let el_loc = el.location()
            if el.func() == math.equation {
                // 处理方程的引用
                link(el_loc,[
                    式
                    #chinesenumbering(chaptercounter.at(el_loc).first(),
                        equationcounter.at(el_loc).first(),location: el_loc,brackets: true)
                ])
            } else if el.func() == figure {
                if el.kind == image {
                    // 处理图片的引用
                    link(el_loc,[
                        图
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            imagecounter.at(el_loc).first(),location: el_loc)
                    ])
                } else if el.kind == table {
                    // 处理表格引用
                    link(el_loc,[
                        表
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            tablecounter.at(el_loc).first(),location: el_loc)
                    ])
                } else if el.kind == "code" {
                    // 处理代码引用
                    link(el_loc,[
                        代码
                        #chinesenumbering(chaptercounter.at(el_loc).first(),
                            rawcounter.at(el_loc).first(),location: el_loc)
                    ])
                } else {
                    // 其他情况暂时不做处理
                }
            } else if el.func() == heading {
                // 处理标题的引用
                if el.level == 1 {
                    link(el_loc,chinesenumbering(..counter(heading).at(el_loc),location: el_loc))
                } else {
                    link(el_loc,[
                        节
                        #chinesenumbering(..counter(heading).at(el_loc),location: el_loc)
                    ])
                }
            } else {
                // 其他情况暂时不做处理
            }
        }
    }
    // 论文封面
    include("src/templates/cover-bachelor.typ")
    pagebreak()
    // 论文内部封面
    include("src/templates/cover-no-emblem.typ")
    pagebreak()
    
    // 论文字体大小
    set align(left + top)
    set text(fontsizedict.小四, font: fontstypedict.宋体, lang: "zh")
    set heading(numbering: chinesenumbering)
    // 插入目录
    locate(loc => {
        chineseoutline(
        title: "目录",
        depth: outlinedepth,
        indent: true,
        )
    })
    // 图片目录
    if listofimage {
        listoffigures(title: "插图目录", kind: image)
    }
    // 表格目录
    if listoftable {
        listoffigures(title: "表格目录", kind: table)
    }
    // 代码目录
    if listofcode {
        listoffigures(title: "代码目录", kind: "code")
    }
    pagebreak()
    // 插入摘要
    include "src/templates/abstract-cn.typ"
    pagebreak()
    
    include "src/templates/abstract-en.typ"
    pagebreak()
    // 插入正文
    set align(left + top)
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
        #doc
    ]
    // 致谢
    par(justify: true, first-line-indent: 2em, leading: linespacing)[
      #heading(numbering: none, "致谢")
      
      #include "chapters/acknowledgement.typ"
    ]
}
