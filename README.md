# Relatório de autoavaliação institucional 2020 (CPA/UFRPE)

Este repositório contém o código usado para gerar os relatórios sintéticos da autoavaliação institucional da Universidade Federal Rural de Pernambuco (UFRPE) e da Universidade Federal do Agreste de Pernambuco (UFAPE), ambos produzidos pela sua Comissão Própria de Avaliação (CPA) da UFRPE. A versão pública dos relatórios está hospedada aqui, disponível na pasta 'docs/'

## Como visualizar os relatórios

Os relatórios estão disponíveis para visualização nos seguintes links:
- [Relatório Sintético da Autoavaliação UFRPE 2020](https://jhcp.github.io/cpa2020/)
- [Relatório Sintético da Autoavaliação UFAPE 2020](https://jhcp.github.io/cpa2020/ufape/)

## Como gerar os relatórios

Os relatórios foram criados usando [R](https://www.r-project.org/). O código-fonte está disponível na pasta 'r', para fins de preservação e verificação. No entanto, para gerar os relatórios novamente, é preciso ter acesso às planilhas contendo os resultados da autoavaliação, que não estão publicamente disponíveis por confidencialidade. As planilhas discentes-tema.xlsx, docentes-tema.xlsx e tecnicos-tema.xlsx devem ser inseridas na pasta 'r/planilhas/'.

Para gerar os relatórios, é preciso ter o [R](https://www.r-project.org/) instalado no seu computador. Recomenda-se também a instalação da versão gratuita do [RStudio](https://rstudio.com/). Os comandos a seguir podem ser usados para instalar as dependências:

```
install.packages("readxl")
install.packages("knitr")
install.packages("kableExtra")
install.packages("dplyr")
install.packages("markdown")
install.packages("rmarkdown")
```

Os relatórios gerais da UFRPE e da UFAPE são produzidos diretamente a partir dos respectivos arquivos RMarkdown (.Rmd): 'relatorio_geral.Rmd' e 'relatorio_geral_ufape.Rmd'.

Os relatórios de unidades, de cursos, e de departamentos acadêmicos são gerados a partir dos respectivos arquivos R (.r): 'gerador_unidades.r', 'gerador_cursos.r', e 'gerador_departamentos.r'. Por sua vez, os **modelos** desses relatórios são os seguintes arquivos RMarkdown (.Rmd): 'modelo_relatorio_unidade.Rmd', 'modelo_relatorio_curso.Rmd' e 'modelo_relatorio_departamento.Rmd'. Por padrão, esses relatórios serão salvos na pasta 'C:\Temp\Reports'. A pasta-alvo pode ser alterada nos respectivos arquivos .r.

Os dados referentes ao Departamento de Física (UFRPE-Sede) e ao curso de Licenciatura em Letras (UFRPE-UAST) não foram coletados durante a autoavaliação, por isso os seus relatórios não foram gerados automaticamente. Notas explicativas foram criadas manualmente, contidas nos arquivos 'DEPARTAMENTO DE FISICA.html' e 'LICENCIATURA EM LETRAS - PORTUGUES E INGLES-UAST.html', respectivamente. 

As páginas que listam os relatórios foram criadas manualmente, e estão disponíveis na pasta 'r/site/'.

### Como montar o site

- O Relatório Geral da UFRPE precisa ser renomeado para 'geral.html' e movido para a pasta 'r/site/'.
- O Relatório Geral da UFRPE precisa ser renomeado para 'geral.html' e movido para a pasta 'r/site/ufape/'.
- As pastas 'cursos', 'departamentos' e 'unidades', geradas em 'C:\Temp\Reports', devem ser movidas com os seus conteúdos para a pasta 'r/site/reports/'
- Os relatórios dos cursos da UFAPE devem ser movidos para a pasta 'r/site/ufape/reports/cursos/'
- O arquivo 'DEPARTAMENTO DE FISICA.html' deve ser movido de 'r/' para 'r/site/reports/departamentos/'
- O arquivo 'LICENCIATURA EM LETRAS - PORTUGUES E INGLES-UAST.html'deve ser movido de 'r/' para 'r/site/reports/cursos/'