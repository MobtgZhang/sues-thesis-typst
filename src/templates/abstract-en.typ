#import "../functions/style.typ": *

#par(justify: true, first-line-indent: 2em, leading: linespacing)[
  #heading(numbering: none, outlined: false, "ABSTRACT")
  
  #include "../../chapters/abstract-en.typ"
  #import "../../chapters/abstract-en.typ": 英文关键词

  #linebreak()
  #set par(first-line-indent: 0em)
  #text("Keywords:", weight: "bold")
  #h(0.5em, weak: true)
  #英文关键词.join(", ")
  #v(2em)
]
