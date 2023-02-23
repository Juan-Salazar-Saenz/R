# =========================================================================== #
#                          Carga de datos en R.                               #
# =========================================================================== #
# Vamos a buscar cubrir como cargar información de distintas fuentes.
# La idea central debe ser: como logro colocar la información que poseo es una 
# forma estructurada para su análisis. La respuesta debería ser un data.frame

## (Tomado de Wikipedia) Los archivos csv, son una clase de archivo plano  
## (flat file). Los registros siguen un formato uniforme y no existen 
## estructuras para indexar o reconocer relaciones entre registros. 
## El archivo es sencillo. Un archivo plano puede ser un archivo de texto 
## sin formato (p. ej ., csv , txt o tsv ) o un archivo binario.

## Primero debemos conocer el directorio actual de trabajo
getwd()
## Podemos cambiar el directorio de trabajo con 
# setwd("name_dir")
## Pdemos listar los archivos en el directorio
list.files("data")
## Podemos listar las carpertas en el directorio de trabajo.
list.dirs()
# =========================================================================== #



# =========================================================================== #
# La función read.table().
# Parámetros importantes:
# 1. file: Ruta al archivo.
# 2. header: valores logicos
# 3. sep : Tipo de separador de los registro en la columnas.
# 4 nrows: Núumero de filas.
# 5. skip : numero de filas a omitir
# =========================================================================== #

# Ejemplos 1 .txt todo bonito:
rm(list = ls())                                # Remover variables de entorno.
data <- read.table("data/TABLA_PERSONAS.txt",  #  path
                   header = T,                 #  Encabezados.
                   fill = T,
                   )  

colnames(data)
class(data)
edit(data)
summary(data)
apply(is.na(data), 2, sum)       # No tenemos valores perdidos.

# Ejercicio: Asigne la primera columna como el indice del data.frame. 
# Además elimine la columna personas. Muestre el data.frame resultante.
rownames(data)<-data$PERSONA
data<-data[-c(1)]; View(data)

# Ejemplo 2 .txt faltan variables:
# La siguiente tabla tienen un problema, tiene 5 variables:
data_1 <- read.table('data/test.txt') 
# produce error por el número de columnas
# pero aparecen datos en otras columnas que no tienen nombre
# en ese caso revisamos el número de columnas con
ncol <- max(count.fields('data/test.txt', sep = ""))
ncol # nos dan 8 columnas, en este caso 

data_1 <- read.table('data/test.txt',
                      header=F,             # T cuando si hay nombres de 
                                            # variables o F cuando no.
                      fill=T,               # Rellena esos datos faltantes
                                            # en las columnas problema con NA
                      col.names=paste("col", 1:ncol, sep="_")
                     )
data_1
class(data_1)
summary(data_1)

# Estos comandos ayudan a organizar la información en los datos.
data_exer<- read.table("data/TABLA_PERSONAS.txt",  #  path
                       header = F,                 #  Encabezados.
                       fill = T,); data_exer


colnames(data_exer) <- data_exer[1,]    # ¿Qué hacemo acá?
data_2 <- data_exer[-1,]                # ¿Y acá?
rownames(data_2) <- as.numeric(rownames(data_2))-1; data_2 # ¿?


# =========================================================================== #
# Cargar datos de tipo .csv:
# csv es commas separated values
# es una formato muy comun en datos
# usamos la función read.csv()

data3 <- read.csv("data/TABLA_PERSONAS.csv", sep =";")
# la instrucción sep=":" es importante para determinar como
# están separados los datos : , ; $ espacio, etc
data3

# =========================================================================== #

path = "data/Medals.csv"
data_4 = read.csv(path)
View(data_4)
str(data_4)
summary(data_4)

##
data_5 = read.csv("data/downloaded_medals.csv")
View(data_5)

# Ejercicio: Del data.frame anterior elimine la columna no útil.

# =========================================================================== #
# Lectura de archivos tipo Excel
library(readxl)

## Estos archivos pueden contener hojas (sheets),donde se alojan distintas
## tablas, primero debemos verificar si contiene m?s sheets y luego definir
## cual de ellas importar a nuestro entorno.
excel_sheets("data/Winter Olympic Medals.xlsx")
## Observamos que tenemos tres sheets, para obtener la data realizamos lo
## siguiente:
df_excel = read_excel( "data/Winter Olympic Medals.xlsx",
                       sheet = "Data")
View(df_excel)
## Los parámetros: col_names, col_type, nos ayudan a definir el nombre y tipo
## de dato en las columnas. El parámetro skip, permite omitir los n primeros
## registros.
#############################################################################
df_excel1 = read_excel("data/downloaded_medals.xls",)
View(df_excel1)
df_excel1$...1<-NULL ## Eliminamos la columna in?til
View(df_excel1)

## Si deseamos eliminar varias columnas
borrar <- c("...1","City")
df_excel_borra <- df_excel1[,!(names(df_excel1) %in% borrar)]
View(df_excel_borra)
##
df_excel2<- read_excel("data/downloaded_medals.xls",skip=10)
View(df_excel2)


# =========================================================================== #
library(readr) # paquete para leer datos
# Se pueden cargar datos desde el script o desde el environment

data1 <- read_delim("data/TABLA_PERSONAS.csv")

TABLA_PERSONAS <- read_delim("data/TABLA_PERSONAS.csv", 
                             ";", escape_double = FALSE, trim_ws = TRUE)

# La otra forma de cargar datos es desde el icono de "import data"
# desde el environment.