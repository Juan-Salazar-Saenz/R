# =========================================================================== #
#                             Listas en R.                                    #
# =========================================================================== #
# Una lista es una colección de datos puede contener diferentes tipos de 
# datos: vectores, matrices, dataframes etc.
# La funicón es : list()

# Ejemplo:

# =========================================================================== #
# Generalidades y construcción:
x <- 4                   # Número
y <- c(1,4,5)            # Vector
z <- c(4,-3)             # Vector
w <- c("carro", "moto")  # Vector
t <- matrix(1:4, nrow=2, byrow = T) # Matrix

L1 <- list(x,y,z,y,t); L1
class(L1)

# =========================================================================== #
# llamar elementos : importante la distinción
L1[2]
class(L1[2])   # es una lista

L1[[2]]
class(L1[[2]]) # es un vector

L1[5]
class(L1[5]) # es una lista

L1[[5]]
class(L1[[5]]) # es una matrix


# =========================================================================== #
# Selección y subgrupos:
x <- 4                  # Número
y <- c(1,4,5)           # vector
z <- c(4,-3)            # Vector
w <- c("carro", "moto") # Vector
t <- matrix(1:4, nrow=2, byrow = T) # Matrix

L1 <- list("num"=x,"vec"=y,"vec2"=z,"cad"=y, "mat"=t)
L1$num

L1[c("num","mat")]      # Podemos obtener cierto tipo de "clases"
L1[3]                   # ¿Qué sucede si busca sumar este "vector"?

# =========================================================================== #
# Concatenación:
# Data una lista podemos pegar otros elementos
L1
notas <- list(c(3.5,6.7,2.3))
notas
Nuevalista <- c(L1,notas)    # Concatenamos la lista
Nuevalista