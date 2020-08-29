#Facebook: fb.me/EstadisticaRyPython
#GitHub: https://github.com/MiguelSenChi

#Limpiamos el workspace, por si hubiera info cargada
rm(list = ls())

#Limpiamos la consola
cat("\014")

#1. Importar con extensi?n ".csv": Usando "read.csv"
CSV <- read.csv("archivo_csv.csv") #Forma b?sica

CSV <- read.csv("archivo_csv.csv", header = T, sep = ",", 
                row.names = 1) #Forma breve

CSV <- read.csv("archivo_csv.csv", header = T, sep = ",", 
                row.names = 1, quote = "\"", dec = ",",
                comment.char = "-") #Forma extendida

#2. Importar con extensi?n ".csv": Usando "read_csv"
install.packages("readr")
library(readr)

CSV <- read_csv("archivo_csv.csv", col_names = T,na = "NA",
                 quote = "\"",comment = "-")

#3. Importar con extensi?n ".csv": Usando csvread"
install.packages("csvread")
library(csvread)

#Revisamos el tipo de dato de nuestro archivo
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

#4. Importar con extensión ".txt": Usando "read.csv"

TXT <- read.csv("archivo_txt.txt")

TXT = TXT[ , -1]
TXT = TXT[-6,]

TXT[] <-lapply(TXT, gsub, pattern='"', replacement='')
TXT[] <-lapply(TXT, gsub, pattern=',', replacement='.')

str(TXT)

TXT$Edad <- as.numeric(TXT$Edad)
TXT$Estatura <- as.numeric(TXT$Estatura)

#5. Importar con extensi?n ".sav": Usando read.spss"
install.packages("foreign")
library(foreign)

SPSS <- read.spss("archivo_sav.sav")

SPSS <- read.spss("archivo_sav.sav",to.data.frame=T,
                  use.value.labels=T, use.missings=T)

SPSS <- read.spss("archivo_sav.sav",to.data.frame=T,
                  use.value.labels=F, use.missings=T)

#6. Importar con extensi?n ".sav": Usando "read_spss"
install.packages("haven")
library(haven)

SPSS <- read_spss("archivo_sav.sav", user_na = T, 
                  col_select = c(1:3, 5:10, 12:14, 17:20),
                  n_max = 20)

#7. Importar con extensi?n ".xlsx": Usando "read_excel"
install.packages("readxl")
library(readxl)

XLSX <- read_excel("archivo_xlsx.xlsx", col_names = T)

XLSX$RRSS <- as.numeric(XLSX$RRSS)

str(XLSX)

#8. Importar con extensión ".pdf": Usando "pdf_text"
install.packages("pdftools")
library(pdftools)

texto <- pdftools::pdf_text("archivo_pdf.pdf")
texto[1]
