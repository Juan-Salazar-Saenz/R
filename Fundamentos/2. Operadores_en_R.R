# ===============================================================================
#               En esta sección vemos los operadores en R
# ===============================================================================

# Operadores aritméticos --------------------------------------------------
#Son los operadores para las operaciones
# Suma y Resta + y -
# Multiplicación y división  * y /
# Exponentes ^  (alt 94)
# Radicales sqrt()  a^{1/6}
4+7
4-9
3.5+5.9   
4*9
2*8
6/7
13^5
# Operadores de Comparación (relacionales)-----------------------------------------------
#los operadores de comparación son:
#menor : <
#menor o igual : <=
#mayor o igual : >=
#mayor >
#Diferente: !=
#Comparación de igualdad: ==
#Ejemplos 

4>5 # R indica el valor de verdad T or F de la afirmación.
5<10
-8<-9 # generar error : asignacion <-
-8<(-9)
-9>-8

4+5*(5-6)<=9-3*(2-4)
1/7> 5/8
-4< 9

6!=8 #(!= diferente)

7==6*(2-5)+7 #(comparación)

# LA FUNCIÓN isTRUE : confirmación

isTRUE(4>7)
isTRUE((4+5)^2==(4^2+2*(4)*(5)+5^2))

# Operadores lógicos ------------------------------------------------------
#operadores lógicos en R son los siguientes
# o : |
# y : &
# Negacion: !
# Afirmación : isTRUE()

F&F 
F&T
T&T
T&F
F|T
T|T
F|F

(4>7)&(4!=8)

(4>7)|(4!=8)
!F
!T
# si hacemos operaciones logicas con números
# R tomará el cero como FALSE y cualquier otro número como TRUE

4&7 # T&T
4&0 # T&F 
5|9 # T|T
2|0
!5|0
!0|4
!8
!0

isTRUE(6>7)
isTRUE(3/2<7/2)


# Operadores de asignación ------------------------------------------------
# Para asignar a una variable un elemento se utiliza:
# <- o el = .Pero este último no es muy recomendable.

a<-5 
b<-10
a+b
c=9 # pilas no confundir = con ==

# una forma adicional es usar la función assign()
assign("z",7) # ("nombre", valor)
g<-9
h <- 8
x <- 19
x
class(x)
#
TRUE <- 10
FALSE <- 10
NA <- 10
c <- 10
class() <- 3
  