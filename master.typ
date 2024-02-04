#import "thesis.typ":*

#show: doc => sues_thesis_master(
  outlinedepth:3,
  blind: false,
  listofimage: false,
  listoftable: false,
  listofcode: false,
  doc
)

    // 符号说明表
#include "chapters/symbol.typ"
#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"

#appendix()

#include "chapters/appendix.typ"

#bibliography(("references.bib",),style:"gb-7714-2005-numeric")
