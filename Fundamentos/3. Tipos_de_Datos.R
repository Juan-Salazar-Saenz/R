# En esta sección vemos los tipos de datos
# Tipos de Datos -----------------------------------------------------------
#En R se manejan los siguientes tipos de datos:
# Numérico
# Entero
# Cadenas de Texto
# Lógico
# Factor
# Vacío, Perdido

# Datos Numéricos ---------------------------------------------------------
# Los datos numéricos corresponden a los números reales
# tambíen son denominados float o double
# se componen de parte entera y parte decimal
# ejemplos: 1 ,4 ,6, 9.8 , -4.7
4+7
1/3
sqrt(2)
exp(4)
pi
class(3.67) # class() se usa para ver el tipo de dato 

# Datos Enteros -----------------------------------------------------------
# Los datos enteros como su nombre lo dice son número enteros
# Ejemplos: -3,0,4,5,
# No tienen parte decimal
# class(entero)= integer
# Para que R reconozca los enteros debemos colocar una L al final

x <- 5+7
x
class(x)

4L+5L
class(4L+5L)
class(4+5)

9.7L # arrojará error 

2L-6L
class(7L+8L)
class(7+8)

8+6L
class(8+6L)

# Datos Cadena de Texto ---------------------------------------------------
# Las cadenas de texto como su nombre lo indica son secuencias de
# caracteres: letras, números, símbolos especiales.
# se deben colocar entre comillas dobles
# son de tipo character: class()= character
# Ejemplos:

"Fabian"

class("Fabian")

"Este es mi primer curs@ a R 2020-I"

56 # numeric : número para R
"56"  # 

class(4+4)

class("4"+"5")

class("4+5")

"fab"+"juddg" # operaciones usuales no aplican 

"fab">"gre" # comparación
"Fab" >="fab"

"fabi" & "gre" # no se puede operar
6&9

# Datos Lógicos -----------------------------------------------------------
# R maneja dos tipos de datos lógicos:
# FALSE : F   FALSO
# TRUE : T    VERDADERO
# Class() = logical
# Son letras restringidas, es decir, no se pueden usar para nombrar variables
FALSE
F
class(F)

5>3 | 5!=7 # | es el (o) lógico
class(5>3 | 5!=7)
class(5>3)

TRUE 
T
class(T)

# Datos tipo Factor -------------------------------------------------------
# Se usan para variables categóricas
# Etiqueta datos por niveles
# Class() = factor
# Ejemplos

w <- 6
1
4
c(1,4) # c(x1,x2,x3,...,xn) genera un vector de n entradas

w1 <- c(1,4)
w2 <- c(2,4,5,6,7)

sexo <- c("masculino", "femenino", "femenino",
          "masculino", "femenino")

str(sexo) # str descripción del elemento u objeto


f <- factor(sexo) # instrucción: factor()
str(f)

f

class(f)

str(f) #descripción del tipo de datos. 

plot(sexo) # función plot : gráfica.

plot(f, # variable factor
     col=rainbow(2), #asignar color a las barras (numero de barras)
     xlab="Sexo", # nombre al eje x
     ylab="cantidad", # nombre al eje y 
     main="mi primera grafica" #asigna título
     ) # pilas con las comas

w4 <- c("si","si","si","no","si","no") 
str(w4)

f2<-factor( c("si","si","si","no","si","no") )
str(f2)

plot(f2, #datos
     col="red" # todas la barras son rojas
     )

plot(f2, #datos
     col=c("blue","pink"), # todas la barras son rojas
     xlab="Tiene HIjos", # nombre al eje x
     ylab="Frecuencia", # nombre al eje y 
     main="mi segunda grafica" #asigna título
     )
       
# Datos NA and NULL -------------------------------------------------------
# NA : Not Available , no disponible
# NULL : ausencia de datos

g <- c(10,30,40)
g
g[3] # muestra la posición 3 del vector
g[5] # la posición 5 existe pero el dato no está.

f <- list(a=c(1,2), b=c(2,5), d=c(2,3,5))

# visualizar la variable a : $ signo pesos

f$a
f$b
f$d
f$e

d1 <- c(1,2,3,4,5,6,7,8,9,10)

d2 <- c(d1,20)
d2

