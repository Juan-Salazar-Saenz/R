# =========================================================================== #
#                     Algunas gráficas en R                                   #
# =========================================================================== #

# En R tenemos tres tipos de gráficos esencialmente:

# 1. El sistema base: Es el sistema original de R, es como un lienzo en blanco, 
# que a partir de una función simple, podemos agregarle tamaños, colores, 
# líneas, puntos, ejes, etc. 

# 2. El sistema ggplot2: es un paquete que utiliza ideas tanto del sistema 
# Base como de Lattice. Es muy potente y muy predictivo

# =========================================================================== #
# Vamos a examinar las siguientes funciones: 
# plot(), barplot(), hist(), boxplot()

library(dplyr)
library(readxl)
tp <- read_excel("data/TPERSONAS2.xlsx", na=c("","NA"))
View(tp)
names(tp)


# =========================================================================== #
# FUNCIÓN PLOT:
# La función plot se usa para crear gráficas en general
# esta función principal en el sistema base
# plot(x,y,type, main, sub , xlab, ylab)
# los gráficos dependen de si las variables son numéricas o categóricas.


# Para generar un gráfico de barras, se utiliza una sola variable 
# y esta debe ser tipo factor
str(tp)
# MARCA_DE_AUTOS no es tipo factor
plot(as.factor(tp$`MARCA DE AUTO`))
# Limpieza de la columna MARCA DE AUTO
library(stringr)

unique(tp$`MARCA DE AUTO`)
##
temp<-tolower(tp$`MARCA DE AUTO`); temp
temp<- str_replace(temp,"bwm", "bmw" ); temp
temp<- str_replace(temp,"for", "ford" ); temp
temp<- str_replace(temp,"fordd", "ford" ); temp
##
tp$`MARCA DE AUTO`<- temp
# Un gráfico más elaborado:

plot(as.factor(tp$`MARCA DE AUTO`),                  # datos tipo factor
     xlab = "Marca de auto",                         # etiqueta del eje x
     ylab = "Cantidad",                              # etiqueta del eje y
     main = "Gráfico de barras Marca de Auto vs Cantidad", # Titulo
     col = c("blue", "green", "red" , "pink", "yellow"), # Colores
     )

# Para generar un diagrama de dispersión
# se utilizan dos variables numéricas.

IR <- iris
names(IR)
str(IR)
plot(IR$Sepal.Length, IR$Sepal.Width) #dos variables plot(x,y)


# un gráfico más elaborado

plot(IR$Sepal.Length, IR$Sepal.Width, # gráfico
     xlab="Longitud del Sépalo",
     ylab="Anchura del Sepalo",
     main="Relación entre longitud y anchura del sepalo",
     col=c("blue","red","green"),
     pch=19,  # plot character depende del código
     )

# Quiero hacer en una misma gráfica los dos

par(mfrow=c(2,2))             # Para visualizar más gráficos en una sola imagen



plot(as.factor(tp$`MARCA DE AUTO`),
     xlab = "Marca de auto",
     ylab = "Cantidad",
     main = "Gráfico de barras Marca de Auto vs Cantidad",
     col = rainbow(5))

plot(IR$Sepal.Length, IR$Sepal.Width,
     xlab="Longitud del Sépalo",
     ylab="Anchura del Sepalo",
     main="Relación entre longitud y anchura del sepalo",
     col=c("blue","red","green"),
     pch=19,  # plot character 
)

# Otro ejemplos

# diagramas de dispersión con una sola variable
# la opcion type se refiere al tipo y se indica algunos
# p: points
# l :lines
# b: both
# o. overplot and lines
# h: histogram
# s: stair


plot(iris$Sepal.Length,main="Longitud de Sepalo",type = "l")
plot(iris$Sepal.Width,main="Anchura de Sepalo",type = "s")
plot(iris$Petal.Length,main="Longitud de Petalo",type = "o")
plot(iris$Petal.Width,main="Ancho de Petalo",type = "h")


# Para hacer gráficos de bigotes
# se usa una variable categórica y otra numérica
par(mfrow=c(1,2))
str(iris)
plot(iris$Species, iris$Petal.Length)
plot(iris$Species, iris$Sepal.Width)

# Un gráfico más elaborado
par(mfrow=c(1,2))
plot(iris$Species, iris$Petal.Length,
     xlab="Especie de la flor",
     col = as.numeric(unique(iris$Species)))#iris$Species)#c("blue2", "pink", "green"))
plot(iris$Species, iris$Sepal.Width,
     xlab="Especie de la flor",
     col=c("blue2", "pink", "green")
     )

# Matriz de gráficos de dispersión
# más de dos variables numéricas
names(iris)

plot(iris[,1:4],                       # Todos los diagramas de dispersión
     col = iris$Species,
     pch=19)

iris[,1:4]                            # Columnas 1 2 3 4 todas son numéricas
                                      # col= c(...)



# =========================================================================== #
# FUNCIÓN BARPLOT:
# Se usan para variables categoricas los niveles de factor van en el eje x
# las frecuencias en el eje y. (o proporciones)
# barplot() : debe ir un vector o matriz

#ejemplo con table
tp$`MARCA DE AUTO` # vector tipo character

(tabletp <- table(tp$`MARCA DE AUTO`)) # tabla de frecuencias 

barplot(tabletp) # diagrama de barras.
par(mfrow=c(1,3))
# ejemplo de barplot con colorcitos
barplot(tabletp,
        xlab="Marca de Auto",
        ylab="Frecuencia",
        main="Diagrama de Baras: Marca vs Frecuencia",
        col = rainbow(length(tabletp))
        )   

# ejemplo de barplot con colorcitos Y HORIZONTAL
barplot(tabletp,
        xlab="Marca de Auto",
        ylab="Frecuencia",
        main="Diagrama de Baras: Marca vs Frecuencia",
        col = rainbow(10),
        horiz = T
)  

# gráfico de barras con proporciones
barplot(prop.table(tabletp),
        xlab="Marca de Auto",
        ylab="Frecuencia",
        main="Diagrama de Baras: Marca vs Frecuencia",
        col = rainbow(5),
        horiz = F
)


# gráfico de barra con una matriz
d1 <- c(13,10,4,8,5)
d2 <- c(10,7,2,19,2)
d3 <- c(7,2,14,12,5)
A <- cbind(d1,d2,d3)
A
class(A)
rownames(A) <- c("A-","A+","B","B+","C")
colnames(A) <- c("algortim","operator","discrete")
A
barplot(A,
        xlab="Marca de Auto",
        ylab="Frecuencia",
        main="Diagrama de Baras: Marca vs Frecuencia",
        col = rainbow(5),
        )

# barras con una matriz uno al lado del otro : besides
barplot(A,
        xlab="Marca de Auto",
        ylab="Frecuencia",
        main="Diagrama de Baras: Marca vs Frecuencia",
        col = rainbow(5),
        beside = T
        )

legend(2,20,  #posición
       legend=rownames(A), #legendas
       bty = "n", # forma
       fill=rainbow(5),  #colores
       ncol=2, #columnas
       cex=0.8) # tamaño
# para ver mas : http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

# =========================================================================== #
# HIST HISTOGRAMA
# Un representación de frecuencias para una variable continua
iris$Sepal.Length                                  # Variable continua

hist(iris$Sepal.Length, labels=T, ylim = c(0,40))
hist(iris$Sepal.Length, freq = F)                 # Frecuencia relativa
lines(density(iris$Sepal.Length), # curva de densidad
      col="red",                        # Color
      lwd=2                             # grosor
      )                                 # distribución de los datos (densidad)
sort(iris$Sepal.Length) 

# Analizar
iris %>% filter(Sepal.Length>4.5,Sepal.Length<=5) %>% summarise(n())
count(iris, Sepal.Length>4.5 & Sepal.Length<=5)
sort(iris$Sepal.Length)[iris$Sepal.Length<5]


# =========================================================================== #
# BOXPLOT FUNCTION  -------------------------------------------------------
# Resume alguna informacion de las variables numéricas
summary(iris$Sepal.Width)

boxplot(iris$Sepal.Width,
        main="mi primer boxplot",
        col= "pink")

# dos graficos

boxplot(iris$Sepal.Width,
        main="mi primer boxplot",
        col= "pink",
        horizontal = T)

hist(iris$Sepal.Width)


# Último gráfico.

layout(matrix(c(1:4), nrow=2, byrow=FALSE))
layout.show(4)

hist(iris$Sepal.Width)
boxplot(iris$Sepal.Width ~ iris$Species)  # diagramas de bigoticos continua vs categorica
plot(iris$Petal.Length, iris$Petal.Width) # diagramas de dispersión
barplot(table(iris$Species))