#import "thesis.typ" as thesis
#show: doc => thesis.sues_thesis_master(
  outlinedepth:3,
  blind: true,
  doc
)
// 中英文封面
#include("covers/cover.typ")
// 原创说明
#include("covers/origin.typ")
// 授权书
#include("covers/authorization.typ")
#thesis.frontmatter()
// 中文摘要和英文摘要
#thesis.display_abstract("chapters/abstract-cn.typ",language:"中文")
#thesis.display_abstract("chapters/abstract-en.typ",language:"英文")
// 目录
// 符号说明表
#include("chapters/symbols.typ")
#thesis.mainmatter()
// 正文
#include("chapters/ch01.typ")
#include("chapters/ch02.typ")
#include("chapters/ch03.typ")
#include("chapters/ch04.typ")
#include("chapters/ch05.typ")
#include("chapters/ch06.typ")
#thesis.backmatter()
// 参考文献
// 附录
#include("chapters/appendix.typ")
// 攻读硕士学位所获得成果
#include("chapters/achivement.typ")
// 致谢
#include("chapters/thanks.typ")
