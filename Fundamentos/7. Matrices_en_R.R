# =========================================================================== #
#                         Matrices en R.
# =========================================================================== #
# Una matriz es un arreglo bidimensional: tiene dos dimensiones
# filas : rows  &  columnas : columns
# Generación de matrices:
# Para formar una matriz se usa la funciòn matrix()

m <- matrix(nrow=3,  #número de filas 
            ncol=5)  #número de columnas
m
class(m)

# ¿Qué sucede si no se especifican las columnas ni  filas?
m1 <- matrix(c(1,4,6,7,-2)); m1
class(m1)

# Especificando filas y columnas
# por defecto R asigna por columnas los elementos.

m2 <- matrix(c(1,2,3,4,5,6), nrow=3); m2 # 3 filas 2 columnas por defecto: 
                                         # elementos por columna
m3 <- matrix(2:6,nrow=3); m3             # 3 filas 2 columnas 2:6 = 2,3,4,5,6
# Nota: 2:6 = 2,3,4,5,6 solo tiene 5 elementos. R recicla

# Queremos por filas. byrow=TRUE
m4 <- matrix(1:9, nrow=3, byrow = F); m4

# Dimensión de una matriz
dim(m4)           # tamaño
nrow(m4)          # Número de filas
ncol(m4)          # Número de columnas
length(m4)        # Número de elementos

# Generar matriz a partir de un vector
m5 <- c(2,4,5,-4,5,6,8,9,10,11); m5
dim(m5)=c(5,2); m5

# Crear una matriz diagonal: cuadrada
m6 <- diag(4,5,7); m6        # ¿Qué representa cada parámetro?
m7 <- diag(c(3,4,5),6,8); m7 #

# Nombre de filas y columnas:
m8 <- matrix(3:11,3,3, byrow = T); m8
rownames(m8)
rownames(m8) <- c("fa","do","re")     # Asignamos nombre de las filas.
colnames(m8) <- c("nota A", "nota B", "nota C"); m8

# =========================================================================== #
#               Selección de elementos de una matriz                          #
# =========================================================================== #
A <- matrix(1:15,nrow=5, byrow=F); A

A[2,3]              # Elemento de la fila 2 columna 3
A[2,]               # Selecciona la fila 2
A[,2]               # Selecciona la columna 2
A[-3,-2]            # Suprime fila 3 columna2
A[-1,]              # Suprime fila 1
A[,-2]              # Suprime la columna 2
A[2:3,2:3]
A[c(1,4),c(2,3)]    # A[1:5,5:10]    1:5 = 1,2,3,4,5  c(1,2,3,4,5)
A[3:5,-1]

# =========================================================================== #
#                 Las instrucciónes rbind cbind.                              #
# =========================================================================== #
# Estas instrucciones sirven para pegar filas o columnas
w1 <- c(4.3,3.2)
w2 <- c(2.6,5.6)
class(w1)
A <- cbind(w1,w2); A; class(A)  # sirve para pegar columnas
colnames(A)=c("andrea","camilo")
rownames(A)=c("N1", "N2"); A
##
A1 <- rbind(w1,w2); A1          # sirve para pegar filas
A2 <- rbind(A1,c(as.numeric("fabian"),20)); A2
A3 <- rbind(A1,c(as.numeric("80"),20)); A3

# Sustituir elemento
B <- matrix(c("fa","do","re", "mi"),2,2); B
B[2,2] <- "Hola"; B        # Reemplaza posición 2,2
B[1,] <- 6; B              # Cambia todos los elementos por 6
B[1,] <- c(1,5); B         # Cambia los dos elementos

# =========================================================================== #
#                     Operaciones con matrices.                               #
# =========================================================================== #

A <- matrix(1:9,nrow=3, byrow = T); A
B <- matrix(3:11,nrow=3, byrow= T); B
w <- c(2,4,5,6,-1,0,2,2,4)
dim(w) <- c(3,3); w         #  w  es una matriz

#suma y resta de matrices
A+B
A-B

# "multiplicación" entre matrices  NO ES LA MULTIPLICACIÓN USUAL.
A
B
A*B # se hace termino a término

# Si deseamos la multiplicación usual es: %*%
C1 <- matrix(1:4,nrow=2); C1
C2 <- matrix(2:5,nrow=2); C2

C1 %*% C2               ## Producto de la matriz C1 con C2 (en ese orden!!!).

# "división de matrices"
C1/C2 # se hace elemento a elemento.
# potencia de una matriz
C1^2 # se hace componente a compotente.

# =========================================================================== #
#                       Funciones con Matrices.                               #
# =========================================================================== #
N <- matrix(1:9, nrow=3, byrow=F); N

# Suma de las filas y columnas
rowSums(N)        # Suma las filas de la matrix
colSums(N)        # Suma las columnas de la matrix

N1 <- cbind(N,rowSums(N)); N1

# Promedios
rowMeans(N)       # Promedio de las filas
colMeans(N)       # Promedio de las columnas

# la función apply
N <- matrix(c(2,5,6,3,9,6,1),nrow = 3); N

apply(N,1,mean)   # matrix, 1 (filas) , función_deseada
apply(N,2,sum)    # matrix, 2 (columnas) , función_deseada
apply(N,2,sd)
apply(N,1,sd)