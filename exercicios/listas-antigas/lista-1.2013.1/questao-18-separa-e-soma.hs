

separaEsoma [] = (0,0)
separaEsoma lista = (folderl (+) par, folderl (+) impar)
                     where par = filter (mod 2 == 0 lista
                           impar = filter (mod 2 /= 0) lista