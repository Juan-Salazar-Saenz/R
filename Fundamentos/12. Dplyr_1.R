# =========================================================================== #
#                            Libreria dplyr.                                  #
# =========================================================================== #
#install.packages("tidyverse")
#library(tidyverse)
library(dplyr)

ls("package:datasets")       # Lista de dataset disponibles en R
data() # conjuntos de datos

##
data("cars")
cars
##
data("mtcars")
mtcars
str(mtcars)
##
data(iris)
iris
summary(iris)                  # Resumen de los datos de iris.


# =========================================================================== #
# Utilizar nuestros datasets
library(readxl) # es necesario cargar la libreria readxl
TABLA_PERSONAS <- read_excel("data/TPERSONAS2.xlsx")

# file.choose()                     # Buscar archivos en el sistema .
View(TABLA_PERSONAS)                # Me permite ver la tabla
edit(TABLA_PERSONAS)                # Puedo ver los datos y editar
summary(TABLA_PERSONAS)             # Hace un resumen de los datos
colnames(TABLA_PERSONAS)            # Nombre de las columnas

df <- TABLA_PERSONAS                # Creamos nuestro dataframe de trabajo.
df


df2 <- select(df,contains("EST"))
df2

edit(df)
# =========================================================================== #
# Vamos a trabajar el paquete Dyplyr.
# Dyplyr permite trabajar algunos aspectos entre filas y columnas del dataset
# en forma de dataframe.

# En esta sección abordaremos:
# La función select() 
# La función filter() 
# La función arrange()

# Primero cargamos la libreria Dplyr
library(dplyr)

# =========================================================================== #
# La función select():
# Esta función se usa para seleccionar columnas.
df                        # base de datos df <- TABLA_PERSONAS
dim(df)                   # Tamaño del dataset.
str(df)                   # Explorar el dataframe.
names(df)                 # Muestra el nombre de las variables.

seldf <- select(df,       # Indica el nombre del data.frame
                EDAD      # nombre de la variable.
                )
##
seldf
class(seldf)
##
df$EDAD
class(df$EDAD)   

# =========================================================================== #
head(seldf,15)
tail(seldf,10)
sort(seldf)
sort(df$EDAD)


seldf2 <- select(df,PERSONA:ESTATURA) # Las columnas desde persona hasta estatura
seldf2 

seldf3 <- select(df,-SEXO)            # Quitamos la variable SEXO  
seldf3

seldf4 <- select(df,
                 c(ESTATURA,MARCA_DE_AUTO, PERSONA)) # seleccionar varias columnas
seldf4


# =========================================================================== #
# La función filter():
# La función filter sirve para filtrar un data frame con condiciones
# específicas.
df
names(df)

fildf <- filter(df,                   # Nombre del dataset.
                EDAD>=40)             # Condición
fildf  

fildf1 <- filter(df, EDAD>=40 & `NIVEL ESCOLAR`=="MAESTRÍA")
names(fildf1)


filseldf1 <- select(fildf1, EDAD, `MARCA DE AUTO`)
filseldf1  
  

# =========================================================================== #
# Función arrange():
# Esta función permite ordenar los datos de las filas 
# se llama con la instrucción arrange()

df
arrdf <- arrange(df, EDAD)           # Ordena por la columna edad.
arrdf

arrdf20 <- arrange(df, ESTATURA )  
arrdf20

arrdf1 <- arrange(df,`MARCA DE AUTO`)  # Ordena por orden alfabético
arrdf1  

arrdf11 <- select(arrdf1,`MARCA DE AUTO`)
head(arrdf11,20)


arrf2 <- select(arrdf1, EDAD, MARCA_DE_AUTO,NUMERO_DE_HIJOS)
arrf2  


arrf3 <- filter(arrf2, NUMERO_DE_HIJOS==0 & EDAD<=45)  
arrf3

#también podemos ordenar de manera decreciente

df  
arrdf4 <- arrange(df,desc(ESTATURA))           # DE mayor a menor
arrdf4

arrdf4$ESTATURA