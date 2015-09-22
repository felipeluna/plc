-- definicao de tipos em haskell

fat  a = foldr1 (*) [1..a]

data Expr t = Literal t
  | Binaria (Expr t) OpB (Expr t)
  | Unaria OpU (Expr t)

data OpB = Soma | Mult | Sub | Div

data OpU = Fatorial | Menos

avB Soma = (+)
avB Mult = (*)
avB Sub = (-)
avB Div = (/)

avU Fatorial = fat

-- avaliar recebe uma funcao a
avaliar :: a
avaliar a (Literal n) = a n
avaliar a (Binaria e op f) = (avB op) (avaliar a e) (avaliar a f)
avaliar a (Unaria op e) = (avU op) (avaliar a e)

-- show

showExpr (Literal a) = show a
showExpr (Binaria e op f) = "(" ++ (showExpr e) ++ (showOp op) ++ (showExpr f) ++ ")"

showOp Soma = " + "
showOp Mult = " * "
showOp Sub = " - "
showOp Div = " / "
