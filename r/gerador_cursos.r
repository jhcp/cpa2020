library(knitr)
library(readxl)  # to read excel files
library(markdown)
library(rmarkdown)
library(kableExtra)  # for formatting the tables
library(dplyr)  # for auto-colored and sized values

CalcularNota <- function(data) {
  weighted_sum <- data$pessimo*0 + data$ruim*2.5 + data$regular*5 + data$bom*7.5 + data$excelente*10
  return(round((((weighted_sum)/22.5)/((data$total_respondentes - data$oor)/2.25))*10, digits = 1))
}

respostas_discentes <- read_excel("planilhas/discentes-tema.xlsx", sheet="dados_brutos")
respostas_discentes$nota <- CalcularNota(respostas_discentes)

GerarPagina <- function(curso) {
  respostas_curso <- respostas_discentes[which(respostas_discentes$curso == curso),]
  curso <- gsub("UAG", "UFAPE", curso)
  curso <- gsub("UEDT", "UAEADTec", curso)
  filename <- paste(curso, ".html", sep='')
  filename <- iconv(filename, from="UTF-8", to='ASCII//TRANSLIT')  # remove non-ASCII characters to prevent OS issues
  print(paste("iniciando", filename, sep=" "))
  rmarkdown::render('modelo_relatorio_curso.Rmd', 
                    output_file =  filename,
                    output_dir = 'c:/Temp/reports/cursos',
                    quiet = TRUE,
                    encoding = "UTF-8")
  print(paste(filename, " gerada", sep=" "))
}
  

i <- 1
for (curso in unique(respostas_discentes$curso)) {
  if (i>-1) {
    GerarPagina(curso)
  }
  i <- i + 1
}

#imprimir participação
# i <- 0
# for (curso in unique(respostas_discentes$curso)) {
#   respostas_discentesCurso <- respostas_discentes[which(respostas_discentes$curso == curso),]
#   respostas <- respostas_discentesCurso
#   filename <- paste(respostas_discentesCurso$centro[[1]], curso, sep='|')
#   filename <- paste(filename, respostas_discentesCurso$total_respondentes[[1]], sep='|')
#   filename <- paste(filename, respostas_discentesCurso$total[[1]], sep='|')
#   
#     print(filename)
# }
