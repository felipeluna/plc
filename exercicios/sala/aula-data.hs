-- definicao de tipos em haskell

fat  a = foldr1 (*) [1..a]

data Exp = Literal Float
  | Binaria Exp OpB Exp
  | Unaria OpU Exp

data OpB = Soma | Mult | Sub | Div

data OpU = Fatorial | Menos

avB Soma = (+)
avB Mult = (*)
avB Sub = (-)
avB Div = (/)

avU Fatorial = fat

avaliar (Literal n) = n
avaliar (Binaria e op f) = (avB op) (avaliar e) (avaliar f)
avaliar (Unaria op e) = (avU op) (avaliar e)