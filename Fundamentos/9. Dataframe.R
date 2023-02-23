# =========================================================================== #
#                           Data Frames en R                                  #
# =========================================================================== #
# Los data frames son arreglos bidimensionales, se distribuyen en filas y 
# columnas. Se diferencia con una matriz, pues puede tener diferentes tipos 
# de elementos. Los vectores que forman el data frame deben tener igual
# longitud. Se forman con la función: data.frame()

# =========================================================================== #
# Creación de un data frame:

edad <- c(30,20,16,19)                              # Vector1
estatura <- c(1.50, 1.67, 1.98,1.65)                # Vector2
nombres <- c("camila", "andres", "jorge","luisa")   # Vector3
hijos <- c("si", "no", NA, "si")                    # Vector4
trabajo <- c(F,NA,T,T)                              # Vector5
##
df <- data.frame(edad,estatura,hijos,nombres,trabajo)
df
View(df)               # Visualizar los datos
class(df)
str(df)                # Estructura del data.frame
##
df$trabajo <- as.character(df$trabajo); df
str(df)

# =========================================================================== #
# Selección de elementos de un dataframe.

df[1]              # Obtenemos la columna 1
df["edad"]
df["estatura"]    # Obtenemos la columna --> estatura
df[2]             # Obtenemos la columna 2 --> etatura
df$edad

df[3,]            # Obtenemos el registro 3.
df[-2,]           # Todos, excepto el registro 2.
df[-2]            # Quitamos columna 2.
df[c(1,3),]       # Solo los registros 1 y 3.

df[c(1,3)]        # Obtenemos las columnas (variables), posición 1 y 3.
df[c("edad","hijos")]

df[1,3]           # Obtenemos el valor en la posición 1 y 3.
df[3,4]           # Obtenemos el valor en la posición 1 y 3.

# =========================================================================== #
# Selección por medio de la variables
df
df$edad           # Obtenemos la variable edad.
class(df[1])
dim(df[1])

class(df$edad)

df$estatura       # Sucede los mismo con estatura.
class(df$nombres)
df$nombres
df$nombres[2]    # Obtenemos de la variable nombres la posición 2

# =========================================================================== #
# Subgrupos de un dataframes:
# La función subset() sirve para crear subgrupos del dataframe
# tomemos el mismo dataframe df

df

df
df[c(T,F,F,F)]    ## Seleccionamos por columnas.
df[c(T,F,F),]     ## Seleccionamos por registro

edad>20
df[edad>20]
df[edad>20,]
df[df$edad>20]    ## Note la diferencia con el anterior. ¿Qué piensa? 

colnames(df)   

df10 <- subset(df,edad>18)      #  df[edad>18,]
df10

df2 <- subset(df,estatura>1.65) # EStructura general. (data, condicion)
df2

df11 <- subset(df,estatura>1.55 & edad<40 & trabajo == T)
df11

df12 <- subset(df,estatura>1.55 & edad<40 & trabajo == T)
df12

df3 <- subset(df,estatura<1.80 & !nombres=="andres")
df3

df4 <- subset(df, edad>15 & trabajo==T)
df4


df5 <- subset(df, edad >17, select=hijos) #, select = hijos
df5

df6 <- subset(df, hijos=="si", select = c(edad,estatura))
df6

df7 <- subset(df, hijos=="no", select=-nombres) 
df7

# =========================================================================== #
# Las funciones rbind y cbind:
# Estas funciones sirve para añadir columnas o filas al dataframe
# rbind : añade filas
# cbind : añade columnas
df
# Otro registro. 
w <- c(36,1.89,"si","carlos", FALSE)
df_w <- rbind(df,w)
df_w

w <- c("36",1.89,"si","carlos", FALSE)
df_w1 <- rbind(df,w)                    ## ¿Qué diferencia observa?

# Otra columna
nac <- c("col", "usa", "col", "usa")
df_v <- cbind(df,nac)
df_v

# =========================================================================== #
# Función edit():
# Es una función para generar la tabla y poderla editar.
df
df_e <- edit(df)
df_e
