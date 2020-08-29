#fb.me/EstadisticaRyPython

#1. Importar con extensión ".csv": Usando "read.csv"
CSV <- read.csv("archivo_csv.csv") #Forma básica

CSV <- read.csv("archivo_csv.csv", header = T, sep = ",", 
                row.names = 1) #Forma breve

CSV <- read.csv("archivo_csv.csv", header = T, sep = ",", 
                row.names = 1, quote = "\"", dec = ",",
                comment.char = "-") #Forma extendida

#3. Importar con extensión ".csv": Usando "read_csv"
install.packages("readr")
library(readr)

CSV <- read_csv("archivo_csv.csv", col_names = T,na = "NA",
                 quote = "\"",comment = "-")

#4. Importar con extensión ".csv": Usando csvread"
install.packages("csvread")
library(csvread)

#Revisamos el tipo de dato de nuestro DF
map.coltypes("archivo_csv.csv", header = T)

#Leemos el archivo considerando el tipo de dato
CSV <- csvread("archivo_csv.csv", header = T,delimiter = ",",
               coltypes = c("string","string","integer","string"))

#Tomamos la primera columna como nombre de las filas
rownames(CSV) <- CSV[ , 1]

#Eliminamos la primera columna
CSV[ , 1] <- NULL

#Eliminamos la última fila
CSV = CSV[-6,]

#Encontramos coincidencias y reemplazamos
CSV[] <-lapply(CSV, gsub, pattern='"', replacement='')
CSV[] <-lapply(CSV, gsub, pattern=',', replacement='.')

#Revisamos el tipo de datos, nuevamente
str(CSV)

#Transformamos el tipo de dato, de ser necesario
CSV$Edad <- as.numeric(CSV$Edad)
CSV$Peso <- as.numeric(CSV$Peso)

#5. Importar con extensión ".txt": Usando "read.csv"

TXT <- read.csv("archivo_txt.txt")

TXT = TXT[ , -1]
TXT = TXT[-6,]

TXT[] <-lapply(TXT, gsub, pattern='"', replacement='')
TXT[] <-lapply(TXT, gsub, pattern=',', replacement='.')

str(TXT)

TXT$Edad <- as.numeric(TXT$Edad)
TXT$Estatura <- as.numeric(TXT$Estatura)

#6. Importar con extensión ".sav": Usando read.spss"
install.packages("foreign")
library(foreign)
