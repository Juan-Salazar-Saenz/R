# =========================================================================== #
#                         Librería ggplot2 .                                  #
# =========================================================================== #

# ggplot2 es una libreri gráfica que funciona por capas. Es un elegante,
# potente y "fácil" graficador.
library(tidyverse)
#library(ggplot2)
d1 <- iris

# =========================================================================== #
# Estéticas
# aes(x, y, ....)
# x ,y son las distancias en x , y
# colour : color
# size : tamaño
# shape : forma de los trazos
# alpha : transparencia
# fill : rellenar barras

# capa 1:
g1 <- ggplot(d1,  # data.frame
             aes(x=Petal.Length ,y=Petal.Width, colour=Species)
                  # estetica del gráfico
                 # colour=Species
             )
g1
class(g1)

# Capa 2:
g2 <- g1+geom_point()
g2

# Capa 3
g3 <- g2+geom_smooth()
g3

# =========================================================================== #
# Existen muchos tipos de capas
# http://docs.ggplot2.org/current/
# geom_point
# geom_line
# geom_histogram
# geom_bar
# geom_boxplot
# geom_density

# =========================================================================== #
# Ejemplo diagrama de boxplot.

 iris %>% ggplot(aes(x=factor(Species) , y= Sepal.Length))+
          geom_boxplot()
            

# ejemplo anterior con colores
iris %>%  ggplot(aes(x=factor(Species) , y= Sepal.Length))+
  geom_boxplot(fill = c("yellow","pink","green"), # fill para rellenar
               color="blue" # color del borde
               )
  
# =========================================================================== #
# Ejemplo anteior con titulos y demas:

iris %>%  ggplot(aes(x=factor(Species) , y= Sepal.Length))+
  geom_boxplot(fill = c("yellow","pink","green"), # para rellenar
               color="blue" # color del borde
               )+
  ggtitle ("Box Plot") +
  labs(x = "Religiones", y = "Cantidad")  # Etiquetas o títulos de los ejes  

# elementos adicionales de diseño
#theme(axis.text.x = element_text(colour="blue",angle = 45, hjust = 1))+ # rotar las etiquetas
#theme(axis.title.x = element_text(face="bold", vjust=-0.5, colour="orange", size=rel(1.0))) +
#theme(axis.title.y = element_text(face="bold", vjust=1.5, colour="blue", size=rel(1.0)))
#theme (plot.title = element_text(family="Comic Sans MS",
                               #  size=rel(1), #Tama?o relativo de la letra del t?tulo
                               # vjust=2, #Justificaci?n vertical, para separarlo del gr?fico
                               # face="italic", #Letra negrilla. Otras posibilidades "plain", "italic", "bold" y "bold.italic"
                               # color="red", #Color del texto
                               # lineheight=1.5)) + #Separaci?n entre l?neas


# =========================================================================== #
# Ejemplo de un histograma.

h1 <- iris %>% ggplot(aes(x=Sepal.Length))+
               geom_histogram()
h1
              
# =========================================================================== #
# El ejemplo anterior más detallado

h2 <- iris %>% ggplot(aes(x=Sepal.Length))+
  geom_histogram(bins=20,               # Cntidad de los bins---binwidth
                 col="blue",            # Color del borde
                 fill="pink",           # Relleno
                 alpha=1.0              # Transparencia
                 )
h2

# =========================================================================== #
# ejemplo con otro relleno
h3 <- iris %>% ggplot(aes(x=Sepal.Length))+
  geom_histogram(bins=20, #cantidad de los bins---binwidth
                 col="red", # color del borde
                 aes(fill=..count..), # relleno
                 alpha=0.8 # transparencia
  )
h3

# =========================================================================== #
# Gráfico de puntos: scatterplot
names(iris)
e1 <- ggplot(d1,aes(x=Petal.Length , y=Petal.Width, colour=Species, 
                    size=Sepal.Length, shape=Species))+ # estetica del gráfico
geom_point()
e1

# grafico de barras
library(readxl)
tp <- read_excel("data/TABLA_PERSONAS.xlsx")
names(tp)

ggplot(tp,                              # llamar la base de datos ,
       aes(x=MARCA_DE_AUTO, fill=SEXO))+ #para rellenar de color por las categorias
geom_bar(col="black")

ggplot(tp,                              # llamar la base de datos ,
       aes(x=MARCA_DE_AUTO, fill=SEXO))+ #para rellenar de color por las categorias
  geom_bar(position="fill",col="black")

# gráfico de pie
f <- as.data.frame(table(tp$MARCA_DE_AUTO)); f

ggplot(f,                             # data.frame
       aes(x="" , y=Freq, fill=Var1)  # para rellenar de color por las categorias
)+ geom_bar(stat="identity", width=1)+
coord_polar(theta="y")
