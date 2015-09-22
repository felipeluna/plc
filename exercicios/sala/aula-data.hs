-- definicao de tipos em haskell

data Exp = Literal Float
  | Binaria Exp OpB Exp
  | Unaria OpB Exp

data OpB = Soma | Mult | Sub | Div

data OpU = Fatorial | Menos

av Soma = (+)
av Mult = (*)
av Sub = (-)
av Div = (/)

avaliar (Literal n) = n
avaliar (Binaria e op f) = (av op) (avaliar e) (avaliar f)
avaliar (Unaria op e) = (av op) (avaliar e)