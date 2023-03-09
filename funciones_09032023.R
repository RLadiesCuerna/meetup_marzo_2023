# Entorno de RStudio -------------
#   1. Superior izq.: Scripts (¡Aqui!)
#   2. Inferior izq.: Consola (Console)
#   3. Superior der.: Entorno (Environment)
#   4. Inferior izq.: Plots, Ayuda, Paquetes, etc

# Tipos de variables -------------
# Numericas:
  x <- 10
  x = 5
  
  y <- 2.5
  z <- 1e10
  
# Caracter:
  nombre <- "Dulce"
  apellido <- "Valdivia"
  
  telefono <- "00520123456789"
  telefono <- "+520123456789"
  correo <- "dulce.valdivia@cinvestav.mx"
  
  # Vectores
  c(1,2,3,4) # Función combinar
  v <- c(1,2,3,4)
  v <- c(1,2,"3",4)
  v[4]
  v[4] <- "hola"

  # Booleanos
  TRUE
  T
  FALSE
  F
  
  # Operadores
  5 + 2
  7 - 4
  8 * 10
  
  10 < 5
  5 < 10
  
  y == x
  x > y
  x < y 
  
# Funciones base -----------------

  # No necesariamente llevan argumentos:
  history()
  plot.new()
  
  # Funciones con argumentos:
  plot() # ¡Necesita al menos un argumento!
  plot(c(0,100), c(0,200))
  plot(y = c(0,100), x = c(0,200))
  plot(y = c(0,500), x = c(0,500), xlab = "", ylab = "")
  plot(y = c(0,500), x = c(0,500), xlab = "", ylab = "", type = "n")
  
  # Colores de la paleta rainbow
  rainbow(10) 
  rainbow(x)
  
  # Dibujemos rectangulos
  rect(0,0,100,100) #vertice inf. izq., vertice sup. der.
  rect(xleft = 0, xright = 200,
       ybottom = 0, ytop = 200)
  
  rect(xleft = 0, xright = 200,
       ybottom = 0, ytop = 200,
       col = "purple")
  
  # Los argumentos tambien pueden ser vectores.
  # Pongamos un cuadrado junto al otro  
  
  rect(xleft = c(0,200), xright = c(200,400),
       ybottom = c(0,200), ytop = c(200,400),
       col = c("purple","green"))
  
  # Bandera 8M!
  rect(xleft = c(0,150,300), 
       xright = c(150,300,450),
       ybottom = c(0,0,0),
       ytop = c(500,500,500),
       col = c("purple","green","pink"),
       border = c(NA,NA,NA))
  
  # Bandera rainbow de 4 colores
  rect(xleft = c(0,150,300,450), 
       xright = c(150,300,450,500),
       ybottom = c(0,0,0,0),
       ytop = c(500,500,500,500),
       col = rainbow(4),
       border = c(NA,NA,NA))

# Nuestras funciones -------------
  # Importancia de las funciones:
  # Que pasaria si quisieramos una bandera de 100 colores?
  
  # rect(xleft = c(0,150,300,450, , , , , ,), 
  #      xright = c(150,300,450,500 , , , , ,),
  #      ybottom = c(0,0,0,0 , , , , ,),
  #      ytop = c(500,500,500,500 , , , , ,),
  #      col = rainbow(100),
  #      border = c(NA,NA,NA, , , , , ,))
    
  bandera_raibow <- function(n_colores = 5){
    paso <- 500/n_colores
    
    # Otras funciones que utilizaremos:
      # seq(inicio,fin,paso)
      # rep(que, cuantas veces)
    
    rect(xleft = seq(0,500 - paso,paso),  
         xright = seq(paso,500,paso),
         ybottom = rep(0, n_colores),  # tambien puede ser solo 0
         ytop = rep(500, n_colores),   # tambien puede ser solo 500
         col = rainbow(n_colores),
         border = rep(NA,n_colores)    # tambien puede ser solo NA
         )
  }
  
  # Vamos a probar nuestra bandera \(^O^)/
  bandera_raibow()
  bandera_raibow(10)
  bandera_raibow(15)
  bandera_raibow(100)
  
  # Funcion numerica con salida implicita:
  suma_cool <- function(x = 10, y = 2){
    x + y # Ultima instruccion
  }
  
  suma_cool()
  suma_cool(5)
  suma_cool(y = 2)
  suma_cool(5,2)
  
  #Vamos a cambiar la ultima instruccion
  suma_cool <- function(x = 10, y = 2){
    x + y
    -1 * x # ultima instrucción
  }
  suma_cool() 
  
  #Vamos a cambiar la ultima instruccion
  suma_cool <- function(x = 10, y = 2){
    x + y
    -1 * x # ultima instrucción
    y
  }
  
  suma_cool()
  
  # Funcion numerica con salida explicita:
  suma_cool <- function(x = 10, y = 2){
    z <- x + y
    -1 * x # ultima instrucción
    y
    
    return(z)
  }
  
  suma_cool()
  
# Entornos --------------------
  # Mismos nombres, diferentes valores 
  # (variables locales)
  
  # //////////////////////////////////////
  suma_cool <- function(x = 10, y = 2){
    z <- x + y
    print(paste("El valor de y: ",y))
    return(z)
  }
  # //////////////////////////////////////
  
  y <- 10
  suma_cool()
  suma_cool(y = 4)
  suma_cool(y = y)
  
  # Se pueden usar los valores externos si no son
  # argumentos (variables globales)
  
  # //////////////////////////////////////
  # Aquí el valor de y no se toma de los parametros
  # Busca en afuera del entorno de la funcion por 
  # el valor de y
  
  suma_cool <- function(x = 10){
    z <- x + y
    print(paste("El valor de y: ",y))
    return(z)
  }
  # //////////////////////////////////////
  
  y <- 10
  suma_cool()
  suma_cool(y = 4)
  suma_cool(y = y)
  
  
  # Definiendo operadores
    # Concatenar strings
    `%+%` <- function(palabra_1, palabra_2){
      palabra_final <- paste(palabra_1,palabra_2)
      return(palabra_final)
    }
    
    # Los argumentos van entre la funcion
    nombre %+% apellido
    nombre %+% apellido %+% telefono
    
    # Entorno: re-defininendo operadores
    `+` <- function(x,y){
      return(x - y)
    }
    
    2 + 2  # !!!
    rm('+')

    2 + 2  # :D !!
    
    # Gracias ---------------
    quit()
            