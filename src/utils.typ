// 定义字体的大小
#let 字号 = (
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
#let 字体 = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)
// 定义多个计数器设置
#let appendixcounter = counter("appendix") // 附录计数器
#let chaptercounter = counter("chapter") // 章节计数器
#let footnotecounter = counter("footnote") // 脚注计数器
#let rawcounter = counter(figure.where(kind:"code")) // 代码计数器
#let imagecounter = counter(figure.where(kind:"image")) // 图片计数器
#let tablecounter = counter(figure.where(kind:"table")) // 表格计数器
#let equationcounter = counter("equation") // 公式计数器
//
// 将阿拉伯数字转化为中文数字
#let chinesenumber(num, standalone:false) = {
  if num < 11 {
    ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九").at(num)
  } else if num < 100 {
    if calc.rem(num,10) == 0{
       chinesenumber(calc.floor(num/10)) + "十"
    } else if num < 20 and standalone {
      "十" + chinesenumber(calc.rem(num,10))
    } else {
      chinesenumber(calc.floor(num/10)) + "十" + chinesenumber(calc.rem(num,10))
    }
  } else if num < 1000 {
    let left = chinesenumber(calc.floor(num/100)) + "百"
    if calc.rem(num,100) == 0 {
      left
    } else if calc.rem(num,100) < 10 {
      left + "零" + chinesenumber(calc.rem(num,100))
    } else {
      left + chinesenumber(calc.rem(num,100))
    }
  } else {
    let left = chinesenumber(calc.floor(num/1000)) + "千"
    if calc.rem(num,1000) == 0 {
      left
    } else if calc.rem(num,1000) < 10 {
      left + "零" + chinesenumber(calc.rem(num,1000))
    } else if calc.rem(num,1000) < 100 {
      left + "零" + chinesenumber(calc.rem(num,1000))
    } else {
      left + chinesenumber(calc.rem(num,1000))
    }
  }
}

//中文列表数字
#let chinesenumbering(..nums, location:none ,bracket:false) = {
  locate(loc =>{
      let actual_loc =  if location == none {loc} else {location}
    }
  )
}
