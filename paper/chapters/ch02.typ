= 公式、图表等表示方法
== 公式

方便快捷写入公式是Typst相对于Word编辑器最为主要的优势之一，特别是熟练掌握之后，在输入公式的时候具有非常大的提升效果。

Typst 中的公式分为两类，包括有#text("行内公式",fill:rgb(255,0,0))和#text("行间公式",fill:rgb(255,0,0))，
例如这是一个行内公式
$f(x)=1/(sqrt(2pi)sigma)dot exp(-((x-mu)^2)/(2sigma^2))$。
下面举例几个行间公式

$ f(x)&= 1/(sqrt(2pi)sigma)dot exp(-((x-mu)^2)/(2sigma^2)) $

例如，定义一个分段函数

$ f(x)&= cases(
  -x^3 + x + 8 &"," x<=2 \
  1/2 x^2  &"," 2<x<=10\
  x+ 10 &"," x>=10
) $

也可以定义一个多行的连等的等式，定义如下所示
$ cos(2x) &= cos^2x - sin^2x 
          &= 2cos^2x - 1
          &= 1 - 2 sin^2x $


可以将多个等式对齐写在同一个语句块当中，例如麦克斯韦方程组积分形式：

$ cases(
  integral.cont_l  H dot  d l &= integral.double_S J dot d S + integral.double_(S)(diff D)/(diff t) dot S \
  integral.cont_(l) EE dot d l &= - integral.double_(S)(diff BB)/(diff t) dot d S \
  integral.cont_(S) BB dot S &= 0 \
  integral.cont_(S) D dot d S &= integral.triple_(V) rho VV
) $



微分形式：
$ cases(
    nabla times H &= J + (diff D)/(diff t) \
    nabla times E &= - (diff B)/(diff t) \
    nabla dot B &= 0 \
    nabla dot H &= rho
) $


带有矩阵定义的公式：

$ H = -mu dot B = -gamma B_(o) S_(z) = (gamma B_(o))/2 mat(
    1, dots.h.c ,1 ;
    dots.h.c , dots.down , dots.h.c ;
    1 & dots.h.c & 1 
) $


在求解凸优化问题的时候，问题研究最后求解归结为以下的方程形式：

$ arg_(x_(j)) min_(j=1,dots.h.c,N) sum_(j=1)^(N)c_(j)x_(j) $

$ s.t. cases( 
    sum_(j=1)^(N)a_(i j)x_(j)=b_(i) & "," i=1 "," dots.h.c "," m \
    x_(j)>=0
) $ <equ:matrix>

在文章当中每一个公式的后面均可以添加一个label的标签，这样就可以应用公式了，例如#ref(<equ:matrix>)就是刚刚我们表达的矩阵表达式。

