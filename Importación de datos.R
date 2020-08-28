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

CSV <- read_csv()

#Importar con extensión ".txt": Usando "read.csv"

TXT <- read.csv("archivo_txt.txt")
