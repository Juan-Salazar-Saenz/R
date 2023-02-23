# =========================================================================== #
#                   Generación de secuencias. 
# =========================================================================== #
# En esta sesión vamos a ver diferentes formas de generar secuencias.

# Generación de una secuencia de números seguidos 
# desde a hasta b.
1:10 # genera una secuencia desde 1 hasta 10  a:b

a1 <- c(1,2,3,4,5,6,7,8,9,10)
a1
class(a1)

3:15 # genera una secuencia desde 3 hasta 15 
9:2 # genera una secuencia decreciente desde 9 hasta 2
-3:-10 # genera una secuencia de número negativos
3:10
# Podemos operar con las secuencias.
1:5 *2    # multiplica la secuencia por 2
2:6 -1    # resta uno a todos los elementos
1:5 /4    # divide la secuencia por 4
(1:5)^3   # eleva al cubo los elementos de la secuencia

2:6
3:7
(2:6)*(3:7) # multiplica dos secuencias con el mismo número de elementos

(2:6)*(3:8)  # Diferecnte longitud ---> Error
(2:6)*(3:10) # Diferecnte longitud ---> Error

# Ejemplo
x <- 6
2:x
2:x-1       # Restamos 1 a todos
2:(x-1)     # 2:5

# Otra instrucción seq()

x <- seq(2,7) # Creamos una secuencia desde 2 hasta 7, 2:7
x
class(x)

seq(9)        # Secuencia por defecto empézando en 1.
seq(1, 9)
1:9
## 
seq(from = 2, to =4) # lo mismo que seq(2,4) 2:4

# Secuencias con avance controlado by=..

seq(from=3, to=10, 3) # comienza en 3 y aumenta de 3 en 3
seq(1,10, by=2)       # seq(1,10,2)
seq(1,10,2)           # the same seq(1,10, by=2)

# =========================================================================== #
# Generación de secuencias en un intervalo con partición
# lenght : sirve para indicar cuantos elementos quiero, estos serán
# equidistantes.

seq(1,         # inicia
    11,        # termina
    length=5   # cantidad de números 
    )

# =========================================================================== #
# Funciones de replicación rep
# =========================================================================== #
x <- rep(1,times=5)   # repite el 1 cinco veces
x

rep(1:3, times=4)     # 123123123123
seq(1,2,0.2)
# Podemos mezclar seq y rep:
rep(seq(1,2,0.2), times=3)


rep(1:4, each=4)      # each:repite cada elemento 4 veces
rep(1:4, times=4)

4:19
seq(4,19)
8:5
seq(3,5,0.4)
seq(4,10, length=15)
rep(2:5, times=3)
rep(2:5, each=3)