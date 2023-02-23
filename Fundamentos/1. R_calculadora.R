# ===================================================================
#     Sesión 1. Instrucciones básicas y Operaciones Aritméticas     #
# ===================================================================
# Su usa el símbolo "#" para hacer comentarios
# Para compilar o correr una instrucción se usa el botón RUN
# también se puede: CTRL+ENTER
#instrución para ver el dir. de trabajo
getwd()
#instrucción para ver lo que hay en el directorio
dir()
list.files()
#para un demo de algunos elementos de R
demo()
demo(graphics)
#Buscar ayuda en R 
help("factor") 
# Ejercicio: explorar la dirección: www.r-graph-gallery.com para m?s ejemplos
#=========================================================
# CALCULADORA: OPERACIONES BÁSICAS
#=========================================================
---------------------------------------------
#suma y resta: + y -
12+6
12-8
class()  # me indica el tipo de dato
class(12) # R mira que tipo de dato es 12

(2+5i)+(4+7i) #número complejo
#multiplicación y división: * y /
1190*3434 
23/9
(34+4)*(4-9+7)
#combinar operaciones
12+(3+6)-8*(2-3-4)
5-8*(2+3)
(5-8)*(2+3)
12-3(3+18/9) # omisión de * produce error
3/(4+3)
(4+5i)/(4-5i)
(2+1i)*(2-1i)
1/1000000000000 # e-12=10^(-12)
1/0
class(1/0)
#Exponentes
10^5   # ^ circumflex accent alt+94

(2+7)^4
2+7^4    #pilas con los paréntesis

2-3*(4-8) # 2-3*(-4)=2+12=14
(2-3)*(4-8) # (-1)*(-4)=4

8^{1/3} # 1/m raíz m-esima.
4^{-1/2} # 1/2 raíz cuadrada
-9^{1/2}
(-9)^{1/2}

#algunos errores con las operaciones

5/(4-4) #Inf: infinito
sqrt(-4) # NaN Not a number

# raíz cuadrada : exponente fraccionario or sqrt
100^{1/2}
sqrt(100) # es equivalente 100^{1/2}

#el número e, de la exponencial 
exp(1)
exp(10)
exp(-3)

#para calcular logaritmo log(valor, base)
log(100) #pilas este es logaritmo natural ln.

log(100,10)
log(16,2)

log(625,5) #log(valor, base)

#el número PI 
pi
3*pi

#imprimir más digitos y redondear

#la función print() imprimir /mostrar

print(pi,10) # print(número, número de decimales)
print(pi,15)
print(pi,18)
print(pi,20)

round(3.4)  # funcion de redondeo 
round(3.7)
round(3.5)

round(3.865,1) # round(x,1) redondea al primer decimal
round(3.358,2) # round(x,2) redondea al segundo decimal
round(3.353,2)

#Observaciones acerca de los números
#la función class() se indica que tipo de elemento es 
class(6)
class(5.7)
# con una L al final
30L+50L
30+50
class(30L+50L)
class(30+50)
class(30+50L)


# algunas funciones en R

sin(pi/6)
cos(1) #radianes
tan(3) 
tan(90)
tan(pi/2) #tan(x) en 90Â° grados no está definido.
sqrt(6)
6^0.5
6^(1/2)
log(exp(1))
log(exp(10))

#algunas gráficas en R

#para graficar se usa el comando curve

#grafica de f(x)=x^2
# para graficar utilizamos la función curve()

curve(x^2)#grafica desde 0 hasta 1 por defecto

curve(x^2,-4,4)#curve(función, de , hasta )

curve(x^3-x,-4,4)

curve(sin(x), from=0, to=2*pi)

curve(cos(x), # función
      -4*pi,  # limite inferior desde donde arranca x
      to = 4*pi, # límite superior hasta donde llega x
      col = "red" # color "---"
      ) 

# como graficar varias funciones al tiempo

curve(1*x,-4,4, col="red")

curve(x^3-x,-4,4, add = T, col="blue") # se coloca add =T # nolint
# add = T or F me permite hacer dos grÃ¡ficas usando el mismo plano
#TRUE : T
#FALSE : F









# ejemplo 1 de grafica en R -------------------------------------------------
install.packages("tidyverse")
install.packages("hrbrthemes")
install.packages("viridis")
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(dplyr)
library(ggplot2)
# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
)
# Plot
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("A boxplot with jitter") +
  xlab("")
# ejemplo 2 de grafica en R -----------------------------------------------
# Libraries

library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%
  
  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme(legend.position="none")
p

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp



#===========================================







