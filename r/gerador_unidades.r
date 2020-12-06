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

# Load data
respostas_discentes <- read_excel("planilhas/discentes-tema.xlsx", sheet="unidades")
respostas_docentes <- read_excel("planilhas/docentes-tema.xlsx", sheet="unidades")
respostas_tecnicos <- read_excel("planilhas/tecnicos-tema.xlsx", sheet="unidades")

respostas_discentes$nota <- CalcularNota(respostas_discentes)
respostas_docentes$nota <- CalcularNota(respostas_docentes)
respostas_tecnicos$nota <- CalcularNota(respostas_tecnicos)

respostas_discentes_sede <- respostas_discentes[which(respostas_discentes$unidade == "sede"),]
respostas_discentes_UACSA <- respostas_discentes[which(respostas_discentes$unidade == "uacsa"),]
respostas_discentes_UFAPE <- respostas_discentes[which(respostas_discentes$unidade == "ufape"),]
respostas_discentes_UAST <- respostas_discentes[which(respostas_discentes$unidade == "uast"),]
respostas_discentes_UAEADTEC <- respostas_discentes[which(respostas_discentes$unidade == "uaeadtec"),]

respostas_docentes_sede <- respostas_docentes[which(respostas_docentes$unidade == "sede"),]
respostas_docentes_UACSA <- respostas_docentes[which(respostas_docentes$unidade == "uacsa"),]
respostas_docentes_UFAPE <- respostas_docentes[which(respostas_docentes$unidade == "ufape"),]
respostas_docentes_UAST <- respostas_docentes[which(respostas_docentes$unidade == "uast"),]
respostas_docentes_UAEADTEC <- respostas_docentes[which(respostas_docentes$unidade == "uaeadtec"),]

respostas_tecnicos_sede <- respostas_tecnicos[which(respostas_tecnicos$unidade == "sede"),]
respostas_tecnicos_UACSA <- respostas_tecnicos[which(respostas_tecnicos$unidade == "uacsa"),]
respostas_tecnicos_UFAPE <- respostas_tecnicos[which(respostas_tecnicos$unidade == "ufape"),]
respostas_tecnicos_UAST <- respostas_tecnicos[which(respostas_tecnicos$unidade == "uast"),]
respostas_tecnicos_UAEADTEC <- respostas_tecnicos[which(respostas_tecnicos$unidade == "uaeadtec"),]

GerarPagina <- function(respostas_discentes, respostas_docentes, respostas_tecnicos, nomeUnidade) {
  sigla <- respostas_discentes$unidade[1]
  filename <- paste(sigla, ".html", sep='')
  rmarkdown::render('modelo_relatorio_unidade.Rmd',
                    output_file =  filename, 
                    output_dir = 'c:/Temp/reports/unidades',
                    quiet = TRUE,
                    encoding = "UTF-8")
  print(paste(filename, " gerada", sep=" "))
}

GerarPagina(respostas_discentes_sede, respostas_docentes_sede, respostas_tecnicos_sede, 'Sede (Campus Dois Irmãos)')
GerarPagina(respostas_discentes_UACSA, respostas_docentes_UACSA, respostas_tecnicos_UACSA, 'Unidade Acadêmica do Cabo de Santo Agostinho (UACSA)')
GerarPagina(respostas_discentes_UFAPE, respostas_docentes_UFAPE, respostas_tecnicos_UFAPE, 'Unidade Acadêmica de Garanhuns')
GerarPagina(respostas_discentes_UAST, respostas_docentes_UAST, respostas_tecnicos_UAST, 'Unidade Acadêmica de Serra Talhada (UAST)')
GerarPagina(respostas_discentes_UAEADTEC, respostas_docentes_UAEADTEC, respostas_tecnicos_UAEADTEC, 'Unidade Acadêmica de Educação à Distância e Tecnologia (UAEADTEC)')