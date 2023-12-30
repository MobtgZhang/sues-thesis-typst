#import "thesis.typ":*

#show: doc => sues_thesis_bachelor(
  outlinedepth:3,
  blind: false,
  listofimage: true,
  listoftable: true,
  listofcode: true,
  doc
)

#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"

#appendix()

#bibliography(("references.bib"),style: "ieee")
