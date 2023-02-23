# =========================================================================== #
#                            Libreria dplyr.                                  #
# =========================================================================== #

library(dplyr)
library(readxl)

TABLA_PERSONAS <- read_excel("data/TPERSONAS2.xlsx")
View(TABLA_PERSONAS)                # Me permite ver la tabla
edit(TABLA_PERSONAS)                # Puedo ver los datos y editar
summary(TABLA_PERSONAS)             # Hace un resumen de los datos
colnames(TABLA_PERSONAS)            # Nombre de las columnas

df <- TABLA_PERSONAS                # Creamos nuestro dataframe de trabajo.
df

# =========================================================================== #
# En esta sección abordaremos:
# La función rename() 
# La función mutate() 
# La función group_by()


# Función rename():
# Esta función se usa para cambiar el nombre o renombrar las variables
df
names(df)
rendf <- rename(df, nhijos=`NUMERO DE HIJOS`,mauto=`MARCA DE AUTO`) # cambia el nombre
rendf
names(rendf)
rendf
  
  
# =========================================================================== #
# Función mutate():
# Esta función sirve para agregar nuevas comlumnas a partir de las ya existentes
# función mutate()
df
names(df)
mutdf <- mutate(df, relacion=as.numeric(ESTATURA)/as.numeric(EDAD) )
names(mutdf)
edit(mutdf)

#mutdf2 <- mutate(df,ESTATURA/max(ESTATURA))
#mutdf2


## ##
df$ESTATURA
max(df$ESTATURA)
df$ESTATURA %in% max(df$ESTATURA) 
which(df$ESTATURA %in% max(df$ESTATURA))
df[31,]


# =========================================================================== #
# transmutate function.
# esta función crea una columna con el nombre indicado
df
transdf <- transmute(df, longitud=(NUMERO DE HIJOS/EDAD)*100)
head(transdf,15)


mutdf10 <- mutate(df, longitud=(NUMERO_DE_HIJOS/EDAD)*100)
mutdf10


# =========================================================================== #
# Función group_by:
# Está función agrupa según las condiciones dadas. Esto genera un nuevo 
# dataframe con los datos agrupados.


gr <- arrange(df,`MARCA DE AUTO`)
gr

names(df) 
bygrdf<- group_by(df,`MARCA DE AUTO`)
bygrdf

summarize(bygrdf,max(ESTATURA))
summarize(bygrdf,mean(as.numeric(EDAD)))
summarize(bygrdf,mean(as.numeric(`NUMERO DE HIJOS`)))
#summarize(bygrdf,median(EDAD),min(ESTATURA))

bygrdf1<- group_by(df,SEXO)
bygrdf1

# summarize(bygrdf1,mean(EDAD))