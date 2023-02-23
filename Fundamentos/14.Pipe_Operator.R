# =========================================================================== #
#                           El operador PIPE                                  #
# =========================================================================== #

# El Operador %>% pipe operator atajo : (mayús+ctrl+M) se usa para concatenar 
# operaciones o funciones y facilita la escritura de la siguiente forma.

# Ejemplo: Supongamos que en la tabla df queremos hacer tres acciones:
# 1.Cambiar de nombre la variable “pclass” y dejarla como “clase”.
# 2. Filtrar por aquellas personas que tienen 45 años.
# 3. Seleccionar la variable embarked

# FORMA 1:
# Paso 1.
rename(df, clase=pclass)
# Paso 2.
filter(rename(df,clase=pclass), df$age==45)
# Paso 3. 
select(filter(rename(df,clase=pclass), df$age==45), embarked)

# La sintaxis se vuelve un poco compleja al tener que definir cada paso 
# como una variable o en escribir de forma anidada la operación.

df %>% rename(clase=pclass) %>% filter (age==45) %>% select(embarked)

# =========================================================================== #

rm(list=ls())
#Primero cargamos la libreria Dplyr
library(dplyr)
library(readxl) # es necesario cargar la libreria readxl
TABLA_PERSONAS <- read_excel("DATOS/TABLA_PERSONAS.xlsx")
df <- TABLA_PERSONAS
df

# el operador PIPE es %>%
#sirve para simplificar notación y concatenar operaciones o funciones con dplyr
# funciona de izquierda a derecha
# atajo : CTRL+SHIFT+M  

df
dfmod <- df %>% select(EDAD,ESTATURA, NUMERO_DE_HIJOS) %>% rename(HIJOS=NUMERO_DE_HIJOS)%>% 
  arrange(ESTATURA) %>% filter(EDAD>=40) %>% mutate(frec=HIJOS/sum(HIJOS)*100)
dfmod                                                  

# tarea 
lead
leg
contains()
cumsum() 
cumprod()










plot(as.factor(dfmod$HIJOS))

plot(as.factor(df$NIVEL_ESCOLAR), col =c("blue", "pink","red"))
