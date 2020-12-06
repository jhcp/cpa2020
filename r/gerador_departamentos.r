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

respostas_docentes <- read_excel("planilhas/docentes-tema.xlsx", sheet="dados_brutos")
respostas_docentes$nota <- CalcularNota(respostas_docentes)

GerarPagina <- function(departamento) {
  respostas_departamento <- respostas_docentes[which(respostas_docentes$orgao == departamento),]
  filename <- paste(departamento, ".html", sep='')
  filename <- iconv(filename, from="UTF-8", to='ASCII//TRANSLIT')  # remove non-ASCII characters to prevent OS issues
  print(paste("iniciando", filename, sep=" "))
  rmarkdown::render('modelo_relatorio_departamento.Rmd', 
                    output_file =  filename,
                    output_dir = 'c:/Temp/reports/departamentos',
                    quiet = TRUE,
                    encoding = "UTF-8")
  print(paste(filename, " gerada", sep=" "))
}
  
  
i <- 1
for (departamento in unique(respostas_docentes$orgao)) {
  if (i>-1) {
    GerarPagina(departamento)
  }
  i <- i + 1
}

#imprimir participação
# i <- 0
# for (departamento in unique(respostas_docentes$orgao)) {
#   respostas_docentesCurso <- respostas_docentes[which(respostas_docentes$orgao == departamento),]
#   respostas <- respostas_docentesCurso
#   filename <- paste(respostas_docentesCurso$centro[[1]], departamento, sep='|')
#   filename <- paste(filename, respostas_docentesCurso$total_respondentes[[1]], sep='|')
#   filename <- paste(filename, respostas_docentesCurso$total[[1]], sep='|')
#   
#     print(filename)
# }
