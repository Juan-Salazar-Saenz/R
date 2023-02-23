# =========================================================================== #
#                         Librería ggplot2 .                                  #
# =========================================================================== #

library(ggplot2)
datos<-mpg

# =========================================================================== #
# Funcion base:

ggplot(data=datos,          # Capa uno, agregamos la base de datos objetivo
        aes(x=displ,y=hwy), # Capa dos, parte estetica, variables y 
                            # componenetes visuales      
        )

# =========================================================================== #
# Para la tercera capa, se debee tener claro el tipo de datos que representaré

str(datos)

# =========================================================================== #
# Vamos a agregar la tercera capa: geoms, son la representaci´n de la forma de 
# los datos.

ggplot(data=datos,         # Capa uno, agregamos la tabla de datos.
       aes(x=displ,y=hwy), # Capa dos, parte aestetica, variables y
                           # componenetes visuales      
      
)+geom_point()            # Capa tres, una geometría de puntos , o 
                          # diagrama de dispersion

# =========================================================================== #
# Cuando los datos se pueden segmentar con una variable categórica es 
# posible hacer puntos, rumbos, lineas, de diferentes colores.
# colores (un colos por cada factor.)

ggplot(data=datos, aes(x=displ, y=hwy,colour=class))+geom_point()
ggplot(data=datos, aes(x=displ, y=hwy))+geom_point(colour="blue")
ggplot(data=datos, aes(x=displ, y=hwy))+geom_point(colour="green",shape=4)

# =========================================================================== #
# Facetado: Multiples gráficas en los factores por separado.
ggplot(data=datos,         # Capa uno, agregamos la base de datos objetivo
       aes(x=displ,y=hwy), # Capa dos, parte aestetica, variables y 
                           # componenetes visuales      
)+geom_point()+ facet_wrap(~class)  ### ~=Alt+126


# =========================================================================== #
# Podemos agregar geoms... podemos seguir agregando, con más estilo cada capa.

ggplot(data=datos,         # capa uno, agregamos la base de datos objetivo
       aes(x=displ,y=hwy), # Capa dos, parte aestetica, variables y 
                           # componenetes visuales      
)+geom_point()+geom_smooth()

# =========================================================================== #
# La capa smooth sirve para determinar una tendencia dentro de la correlacion 
# de datos. span: se usa para suavizar aún más el ajuste (0<span<1)

ggplot(data=datos, 
       aes(x=displ,y=hwy),       
)+geom_point()+geom_smooth(span=1)  # Menor precision en la tendencia


ggplot(data=datos, 
       aes(x=displ,y=hwy)       
)+geom_point()+geom_smooth(span=0.2) # Mayor precision en la tendencia

# =========================================================================== #
# Cambiamos el estilo de los datos representados

ggplot(data=datos, 
       aes(x=cyl,y=cty, colour=class)
)+geom_boxplot()