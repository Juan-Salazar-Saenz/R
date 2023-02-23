# =========================================================================== #
#                         VECTORES
# =========================================================================== #
# En esta sección vamos a abordar el tema de vectores.
# Un vector en R representa una colección de objetos del mismo tipo

# Tipos de elementos en los vectores:
#
v1 <- c(1,2,3,4) # vector numérico
v1; class(v1)
#
v2 <- c(F,T,F,F,T) # vector lógico
v2; class(v2)
#
v3 <- c("fabian", "andres", "carro", "facil") # vector character
v3; class(v3)
#
v4 <- c(1,F,"analítica") # se aplica cohersión
v4; class(v4)
# =========================================================================== #
#                           Generar vectores.
# =========================================================================== #
v1 <- c(1,2,3,4)    # se generan con la función c()
x <- c(1,2,3,4)
#
v2 <- letters; v2    # Letras del alfabeto inglés
#
v3 <- LETTERS; v3
# Recordemos lo siguiente para generar vectores
1:10                   # Números del 1 al 10
seq(2,15,3)            # Números del 2 al 15 de tres en tres
seq(from=2,to=15,by=3)

rep(5, times=4)        # Repite el 5 cuatro veces 
rep (1:4, each=3)      # Repite el 1 tres veces , 2, 3 y 4 igualemente
a <- seq(2,11,0.4); a

# Generar vectores a partir de otros 
w1 <- c(1,2,3); w1
w2 <- c(5,10,10,20); w2
w3 <- c(w1,w2); w3     # Concatenar

# Asignar al mismo tiempo valores
z <- y <- w <- c(2,5,8)

# Calcular la longitud de un vector

length(w2) # función length()
length(v3)

# Concatenar vectores
d1 <- c(1,"carro",3)
d2 <- c("do", "re", F)

d3 <- c(d1,d2); d3
class(d3)


# Operaciones con vectores

w <- c(1,2,3,4,5)

w+2 # sumar número
w*3 # multiplicación
w/4 # división
w%%2 # modulo //residuo

v8 <- c(3,7,9,10,4,5,7)
v8%%3 # residuo de la división.

w <- c(1,2,3,4,5); 
w1 <- c(2,3,6,7,10)
print("Producto de w y w1:"); w*w1

round(4.9865)   # = 
round(4.9865,2) # Redondeo a dos decimales

w/w1
round(w/w1,2)

w^3 # hace el cálculo componente a componente
exp(w)
log(w)

# Operaciones (relacionales/comparacion) lógicas con vectores
w <- c(-4,4,5,8,10); w
w>3
class(w>3)
w<=3
w==2

# Selección de elementos

p <- c(5,10,4,7,9); p
length(p)

# Para seleccionar elementos p[posición] P. vector
p[1]        # Selecciona el elemento 1
p[4]
p[1:3]      # Las primeras posiciones 1,2,3
p[1:10]
p[c(1,3,5)]
p[p>4]      # seleccionar [] elementos de p que cumplan la condición.
p[p>3 & p<8]
p <- c(5,10,4,7,9)
# =========================================================================== #
# Máscara: Es un vector booleano, el retorno será, todas aquellas posiciones
# donde tenemos un TRUE.
# =========================================================================== #
p
p[c(F,T,F,T,F)]     # Retorna las 2 y 4 de p
p[c(T,T,F,T,F)]     # Retorna las 1, 2 y 4 de p.

# Indices de los vectores:
x <- c(3,5,7,10,-12); x

x[3]          # x[i], selecciona la posición del i del vector x
x[1]          # comienza a contar desde 1
x[0]          # 
x[-2]         # devuelve todos los datos excepto el 2 (- : excluir)
x[8]
x[1:3]        # devuelve las posiciones 1, 2, 3
x[4:1]        # devuelve las posiciones 4,3,2,1
x[c(1,3,5)]   # devuelve las posiciones 1,3,5
x[1:10]       #
x[c(1,4,8)] #
##
w <- c(1,5,-4,7,9,10)
w[2,4,6]
w[(2,4,6)]
w[c(2,4,6)]
w[c(-2,-4,-6)]

# Cambiar elementos de un vector:

w <- c(1,4,6,8,1,2,10)
w[6] # posición 6 de w.
w[6] <- 100 # cambia la posición 6 y le asigna 100
w[6]

w[5] <- F         # (1,4,6,8,F,2,10) coerción a numeric F=0 (T=1)
w[4] <- "Hola"; w # (1,4,6,"Hola",1,2,10)

##
w1 <- c(1,4,5,6,10,-1)
w1[10] <- 30; w1   # asigna 30 en la posición 10
###
w1 <- c(1,4,5,6,10,-1); w1
w1[-2] <- 100; w1  # ¿Qúe hace esta sentecia?
##
w1 <- c(1,4,5,6,10,-1); w1
w1[-4] <- 100; w1  # ¿Y acá?

# Relación lógica
x <- c(1,3,5,10,-4)
y <- c(F,T,T,F,T)
x[y]

x <- c(1,3,5,10,-4)
z <- c(T,T,F,F)     # Reciclar los valores (T,T,F,F)
x[z]

# =========================================================================== #
# Match operator :
# Permite determinar si un elemento pertenece a un vector
# =========================================================================== #

x <- c(1,4,-2,10,5,6,30, 10)
10  %in% x                   # Indica si un elemento está en el vector x
x %in% 10
which(x %in% 10)             # Posición donde esta la condición.
-11 %in% x

c(4,20,30) %in% x            # Examina si los elementos estan en x

# =========================================================================== #
# Operaciones con vectores:
# las operaciones con un número se hacen elemento a elemento
# =========================================================================== #
v <- c(1,4,8)
v+2
v*2
v/3
v^3
sqrt(v)
exp(v)
log(v)
# =========================================================================== #
# Operaciones entre vectores
# =========================================================================== #
w1 <- c(3,6,10)
w2 <- c(4,6,7)
w1+w2
w1*w2
w1/w2

w3 <- c(1,3,4,2)
w1*w3              # ERROR !!!
w1/w3              # ERROR !!!

# =========================================================================== #
# Funciones importante para vectores:
# Veremos un conjunto de funciones útiles vectores
# =========================================================================== #

# Suma de las componentes
q1 <- c(1,4,6,8); sum(q1)

# Producto de las compoenentes
q2 <- c(2,6,9,10); prod(q2)

# Invertir los elementos
q3 <- c(3,6,9,10,-3); rev(q3)

# Ordenar el vector de mayor a menor / menor a mayor
q4 <- c(5,7,1,-6,10)

sort(q4)                 # creciente decreasing=F
sort(q4, decreasing = F)
sort(q4, decreasing = T) # Decreciente

# caso especial
q4 <- c(5,7,1,-6,10)
order(q4)                # muestra las posiciones que corresponder al vector 
                         # ordenado (menor a mayor)
sort(q4)
## Ejercicio: Haga uso de order para ordenar el vector de menor a mayor.
# q4[order(q4)]            # otra forma de ordenar el vector

# dos operaciones especiales (tarea)
x <- c(1,5,3)
y <- c(2,3,1)
x %*% y                    # Producto punto.  x*y^{T}
x %o% y                    # Producto matricial x^{T}*y

# =========================================================================== #
# Funciones matemáticas con vectores
# =========================================================================== #
w5 <- c(-4.65,6.45,9,5.5,3.6)

abs(w5)                    # valor absoluto

sqrt(w5)                   # raìz cuadrada  tarea qué es trunc(), ceiling() 
                           # and floor?
round(w5)                  # Redondear decimales
round(w5,1)
mean(w5)                   # Calcula la media

w5 <- c(-4.65,6.45,9,5.5,3.6)
sum(w5)/length(w5)         # media = suma de datos / número de datos


w6 <- c(3,4,0)
factorial(w6)              # 7! =7x6x5x4x3x2x1 ! factorial (cuidado no confundir)
                           # por def. 0!=1

# =========================================================================== #
#               Operadores relacionales con vectores
# =========================================================================== #
x <- c(2,4,5,17,80,45,35)
x>20                       # Esto produce un vector lógico (máscara)
x[x>20]                    # genera el vector
x[x>30 & x<70]

# comparación con dos vectores
x1 <- c(2,3,10,-3,5)
x2 <- c(-2,4,5,10,5,6)
x1<=x2                 # qué sucede?

# La función which permite seleccionar los indices
x3 <- c(3,6,10,-2,10,16,-3)
which(x3<0)                  # posición
x3[which(x3<0)]              # Elementos de esa posición


