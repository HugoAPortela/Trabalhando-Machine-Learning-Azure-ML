# Conceito - O que é o Microsoft Azure Machine Larning ?

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()





####   O que é o Microsoft Azure Machine Larning ?   ####


# - É o ambiente em nuvem da Microsoft, concorrente do ambientes em nuvem da Amazon (AWS), IBM, Oracle e etc...

# - Entre os muitos serviços oferecidos na Nuvem Microsoft, um deles é para Machine Learning (Microsoft Azure).

# - Uma das principais vantagens é sua característica de "arrastar e soltar" típico da Microsoft.
#   Desta forma iremos montar os módulos dentro de um fluxo de trabalho.


# -> Definição formal: é um framework de Machine Learning que pode ser usado para construir modelos de análise preditiva,
#                      através de conjunto de dados de treinamento e uma variedade de fonte de dados.


# - Portanto o Azure é um serviço em nuvem que tem como objetivo implementar modelos de Machine Learning de forma rápida e
#   fácil. Com o Azure é possível construir modelos de análise preditiva e posteriormente fazer o deploy destes modelos
#   através de um web service na própria Nuvem Microsoft.



# -> Ou seja, o que temos com o Microsoft Azure é o Machine Learning em nuvem que significa que um Ambiente de Nuvem onde 
#    estamos rodando nossos projetos nos "computadores da Microsoft" ao invés das nossas máquinas.

# -> Lembrando que: Análise Preditiva não é adivinhação. É ciência sendo usada para extrair previsões a partir dos dados!



# - O principal conceito por trás do Azure é "fail fast", ou seja, cometa erros mais rapidamente.



## Vantagens de se usar o Azure:

# -> Poder trabalhar com o Azure Machine Learning Studio.

# - E o que é isso? É uma área de trabalho totalmente via navegador, onde podemos escolher módulos como: 
#   carregar os dados, módulo para pré processar os dados, módulo para normalizar os dados, módulo com algum algoritim de 
#   Machine Learning e por fim iremos "arrastando" para a parte central e executa.

# - Basicamente iremos montar este "fluxo" de módulos na área de trabalho, e este fluxo é basicamente tudo aquilo que a
#   gente vem fazendo em outros projetos. Este fluxo consiste em definir problema de negócio, coletar e carregar dados,
#   pré processamento, normalizar ou não (depende do algoritmo), divide em treino e teste, crie e treina o algoritmo.

# - No Azure Machine Learning Studio podemos trabalhar com as linguagens R, Python e SQL.

# - No momento em que utilizarmos o Azure Studio, ele abre uma opção para incluirmos módulos com o nosso script em R, Python ou SQL.
#   Caso souberemos uma dessas linguagens, conseguiremos customizar o fluxo de trabalho no Azure Studio.

# - Não confundir Microsoft Azure Machine Learning com o Microsoft Azure.
#   O primeiro é o serviço de Machine Learning na nuvem Microsoft, chamado Azure.


# -> Possibilidade de se criar um Workflow (fluxo de trabalho)

# - Ou seja, tudo começa com a definição do problema de negócio, coleta, preparação, exploração, criação do modelo,
#   avaliação e otimização e por fim o Deploy. Exatamente tudo aquilo que fizemos em R e iremos fazer em Python.

# - Ao iniciar precisamos dos dados, e os dados podem estar na Nuvem ou então localmente no nosso pc.
#   E aqui temos mais uma vantagem em usar o Azure Machine Learning, pois já estamos na Nuvem e com isso poderíamos já ter um
#   banco de dados em Nuvem como o SQL, poderia ter o ambiente Hadoop e assim todo seu ambiente ficaria em nuvem. Desde o 
#   armazenamento dos dados, processamento e criação do modelo.

# - Após obtermos os Dados, iremos criar o Modelo de Machine Learning utilizando o Azure Machine Learning Studio

# - E uma vez este modelo já estando criado, iremos implementar este modelo fazendo o Deploy.
#   Podemos utilizar este modelo para criação de apps para smartphones ou desktop.
#   Podemos também integrar o modelo com dashboards criados com Power Bi.



## O que é Azure Machine Learning Toolkit ?

# - É um conjunto de ferramentas oferecidas no Azure Machine Learning Studio para todo o processo de modelagem preditiva.

# - Entre todas as ferramentas oferecidas no Toolkit, as mais importantes são aquelas que permitem a construção dos modelos
#   de Machine Learning. Portanto no Toolkit temos ferramentas para:

#  -> Classificação: algoritmos usados para classificar dados em diferentes categorias e então fazer previsões sobre dados com
#                    variáveis qualitativas.

#  -> Regressão    : algoritmos usados para prever uma ou mais variáveis numéricas.

#  -> Clustering   : algoritmos usados para identificar grupos ou padrões em conjuntos de dados e então fazer previsões de
#                    classificação em grupos, para uma determinada variável.

# - Classificação e Regresão são atividades de aprendizagem supervisionadas enquanto a Clustering é uma ativade não supervisionada.






