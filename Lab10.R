# Alumna: ALEJANDRA GUZMÁN DIMAS

# T1_04_REDES COMPLEJAS(1) - VisiÛn de redes complejas - parte 1

# Objetivo: Estimar el Maximum Spanning Tree -·rbol de expansiÛn m·xima- (asegurar una visiÛn clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder v. redes complejas

# Regla 1: mantener n-1 conexiones como m·ximo
# Regla 2: Quitar las conexiones con el peso m·s bajo, nos vamos quedar con las del peso m·ximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Usar un matriz hipotetica de datos
# 2. Graficar sus prÛximos adyacentes


##################################################################
# practica 3: VisiÛn clara del espacio-producto: CASO HIPOT…TICO #
##################################################################

# 1)la visualizaciÛn del espacio - producto sea una red conectada: evitar islas de productos aislados. 
# 2)PROBLEMA: tratar de visualizar demasiados enlaces puede crear una complejidad visual innecesaria 
# donde se obstruir·n las conexiones m·s relevantes.
#calculamos el ·rbol de expansiÛn m·xima (MST) de la matriz de proximidad. 
# MST es el conjunto de enlaces que conecta todos los nodos de la red utilizando un n˙mero mÌnimo de conexiones
# y la suma m·xima posible de proximidades. 
#Calculamos el MST usando el algoritmo de Kruskal: B·sicamente, el algoritmo clasifica los valores de la matriz
# de proximidad en orden descendente y luego incluye enlaces en el MST si y solo si conectan un producto aislado. 
#Por definiciÛn, el MST incluye todos los productos, pero el n˙mero de enlaces es el mÌnimo posible.
#DespuÈs de seleccionar los enlaces utilizando los criterios mencionados anteriormente, 
# construimos una visualizaciÛn utilizando un algoritmo de diseÒo dirigido por la fuerza. 

#crear una matriz aleatoria de 200*200
M<-matrix(runif(200*200, min=0, max=100), ncol=200)
diag(M)<-0
head(M[,1:6])
dim(M)

install.packages("igraph")
library (igraph)


#grafica la matriz
g=graph.adjacency(M,mode="undirected",weighted = TRUE)
plot(g)


#Transforma la matriz en en NEGATIVA y para identificar los m·ximos
M<- -M
head(M[,1:6])


#grafica nueva con matriz negativa, ver el espacio-producto, tecnolÛgico 
g=graph.adjacency(M, mode="undirected", weighted = TRUE)
MST=minimum.spanning.tree(g)
plot(MST, vertex.shape="none", vertex.label.cex=.7)

# matriz de adyacencias (nuevo relacionamiento)
A <- get.adjacency(MST, sparse = F)

# ver las aristas que hay entre los nodos
head(A)


#VER LAS ARISTAS(PESOS)


#nodos n-1
write.graph(MST, file = "g.gml", format = "gml")

#exportar resultados para cytoscape o gephi
write.csv(A, file="Adyacentes.csv")