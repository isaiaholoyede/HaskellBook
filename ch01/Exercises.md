# Chapter Exercises

## Combinators Exercise

1. $\lambda x.xxx$ is a combinator.
2. $\lambda xy.zx$ is not a combinator because `z` is a free variable.
3. $\lambda xyz.xy(zx)$ is a combinator.
4. $\lambda xyz.xy(zxy)$ is a combinator.
5. $\lambda xy.xy(zxy)$ is not a combinator because `z` is a free variable.

## Normal form or diverge

1. $\lambda x.xxx$ is a normal form.
2. $(\lambda z.zz)(\lambda y.yy)$ diverges.
3. $(\lambda x.xxx)z$ can be reduced to the normal form, $zzz$.

## Beta reduce

1. $(\lambda abc.cba)zz(\lambda wv.w)$  reduces to $z$.
2. $(\lambda x . \lambda y .xyy)(\lambda a.a)b$  reduces to $bb$.
3. $(\lambda y .y)(\lambda x.xx)(\lambda z.zq)$  reduces to $qq$.
4. $(\lambda z.z)(\lambda z.zz)(\lambda z.zy)$  reduces to $yy$.
5. $(\lambda x. \lambda y.xyy)(\lambda y.y)y$  reduces to $yy$.
6. $(\lambda a.aa)(\lambda b.ba)c$  reduces to $aac$.
7. $(\lambda xyz.xz(yz))(\lambda x.z)(\lambda x.a)$  reduces to $(\lambda z'.za)$.

Since the book has solutions for the chapter exercises, refer to [Haskell Programming from First Principles](http://haskellbook.com/) for detailed solutions.
