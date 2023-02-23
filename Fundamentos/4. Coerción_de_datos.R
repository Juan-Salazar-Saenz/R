# La coerción de datos significa forzar los datos
# para transformarlos de un tipo de dato a otro
# se sigue el esquema:
# logical-->numeric-->character
#Ejemplos
#revisemos el siguiente ejemplo
x <- c(1,2,3,4)
x 
class(x) # x es de tipo numeric, ahora bien:
#--------------------------------------
y <- c(1,2,3,4,T)  # numeric with logical
y
class(y)

class(c(1,T,F,6,8,FALSE,TRUE,2))
c(1,T,F,6,8,FALSE,TRUE,2)

#---------------------------------------
z <- c(1,"andrea") # numeric and character
z
class(z)

#----------------------------------------
w <- c("andres",T) # character and logical
w
class(w)
#-----------------------------------------
t <- c(1,F,"carro") # numeric and logical and character
t
class(t)



# LA INSTRUCCIÓN as."tipo de dato"()----------------

# esta función as.tipo() permite hacer coerción entre tipo de
# datos. Pero no siempre es posible

# as.integer() :  entero
# as.numeric() : numerico
# as.logical() : logico
# as.character: character
# as.factor : factor
# as.null : null
## ejemplos

u <- 10
u
class(10)


u1 <- as.integer(10)
u1
class(u1)

u2 <- as.character(10)
u2
class(u2)

u3 <- as.logical(10)
u3
class(u3)

p <- "claseR"
p
class(p)

p1 <- as.numeric(p)

p2 <- as.logical(p)


y <- FALSE
y
class(y)

y1 <- as.character(y)

y1<"FALSO"  # "FALSE"<"FALSO".
