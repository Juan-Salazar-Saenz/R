# =========================================================================== #
#                     Datos perdidos: Missing Data                            #
# =========================================================================== #

# Ejemplo con un vector
x <- c(10,NaN,4,NA,7,2,NA,5,NA,-3,2,NaN); x

is.na(x)                        # Es cierto que hay na en x?
is.nan(x)                       # Es cierto que hay nan en x?
NA %in% x                       # Indica si hay valores NA
NaN %in% x                      # Indica si hay valores NaN

x[!is.na(x)]                    # Máscara para obtener los valores NO na.
x[!is.nan(x)]                   # Máscara para obtener los valores NO nan.
x[!is.na(x) & !is.na(x)]        # Compare con la linea # 13.
x[is.na(x)]=0; x                # Manejo de na. Reemplazamos por 0
x[is.na(x) & !is.nan(x)]=0; x   # Manejo de Na. Reemplazamos por 0

# =========================================================================== #
# Ejemplo con dataframe:

edad <- c(30,20,16,19)
estatura <- c(1.50, 1.67, 1.98,1.65)
nombres <- c("camila", "andres", "jorge","luisa")
hijos <- c("si", "no", NA, "si")
trabajo <- c(F,NA,T,T)
df <- data.frame(edad,estatura,hijos,nombres,trabajo); df
##
is.na.data.frame(df)                            # Matriz booleana.
is.na(df$trabajo)                               # Vector booleano.
df$trabajo[is.na(df$trabajo)] <- "cuidado"; df

df[is.na.data.frame(df)] <- "HOLA"; df


x<-c(24, 14, 17, 25, 12, NA, 11, NA); x

is.na(x)                          # Vector booleano con T==NA
any(is.na(x))                     # TRUE = hay al menos un valor NA
anyNA(x)                          # Alternativa a lo anterior
which(is.na(x))                   # Indica las coordenadas donde están los NA
sum(is.na(x))                     # Cantidad de valores perdidos en el vector
na.omit(x)                        # Función para omitir NA
x[!is.na(x)]                      # Omitir NA con lógica

# =========================================================================== #
# Ejercicio:
# Haga uso de apply para determinar en la data df lo siguiente:
# 1. % de valores NA por columnas.
# 2. Cantidad de NA por columnas.
# 3. ¿En qué posiciones se tienen dicho valores faltantes?

df <- data.frame(edad,estatura,hijos,nombres,trabajo); df

apply(is.na(df), 2, mean)       # Porcentaje de NA por columnas
apply(is.na(df), 2, sum) 
apply(is.na(df), 2, which) 

x1 <- c(2,4,5,NA,NA,4,5)
x2 <- c(3,NA,5,5,5,NA,0)
x3 <- c("do", "re", "mi", "fa", "sol", "NA" , NA)
X <- data.frame(x1,x2,x3)
apply(is.na(X),2,sum)
apply(is.na(X),2,mean)
apply(is.na(X), 2, which) 
