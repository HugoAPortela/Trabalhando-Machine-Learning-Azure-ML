# Lista de Exercícios - Capítulo 12 - Parte 1

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()


# Carregando pacotes

library(rpart)       # Um dos diversos pacotes para arvores de recisao em R
library(rpart.plot)  # outro pacote para visualizaco ficar mais legivel

library(caTools)   # contém a função sample.split() que cria uma amostra que irá fazer a divisão entre dados de treinos e testes



#### EXERCÍCIO 1 - CRIAR UM MODELO DE ÁVORE DE DECISÃO


## Carregando dados (este dataset é disponibilizado junto com o pacote rpart)
dados = kyphosis

## Verificando dados ausentes
any(is.na(dados))
colSums(is.na(dados))

## Tipo de dados
str(dados)
summary(dados)
dim(dados)

## Visualizando os dados
head(dados)
View(dados)


## Entendendo o dataset

# - O conjunto de dados "kyphosis" esta relacionado a um estudo sobre kyphosis, que é uma curvatura anormal da espinha vertebral.
#   Vamos analisar cada variável:

#  -> Kyphosis: Esta é a variável de resposta ou variável dependente. Ela indica se o paciente desenvolveu ou não kyphosis após
#               o tratamento. É uma variável categórica com dois níveis: "absent" (ausente) e "present" (presente).
#  -> Age: Esta é uma variável numérica que representa a idade do paciente.
#  -> Number: Esta é uma variável numérica que indica o número de vértebras afetadas.
#  -> Start: Esta é uma variável numérica que representa o número da vértebra onde a curvatura começa.

# - Portanto, o conjunto de dados está tentando entender se a kyphosis está presente ou ausente em pacientes após o tratamento, 
#   considerando variáveis como idade, número de vértebras afetadas e o ponto de início da curvatura.
# - Cada linha no conjunto de dados corresponde a um paciente específico e suas características.


## Exercício

# a) Após explorar o dataset, crie um modelo de árvore de decisão

modelo_arvore <- rpart(Kyphosis ~ ., data = dados)


# b) Examine o resultado de uma árvore de decisao, para isso existem diversas funcões, mas você pode usar printcp()
#    ( Exemplo: " prp(arvore) " )

printcp(modelo_arvore)
prp(modelo_arvore)


# c) Visualize a ávore (execute uma função para o plot e outra para o texto no plot).
#    Utilize o zoom para visualizar melhor o gráfico.

plot(modelo_arvore)
text(modelo_arvore, cex = 1)



# Fazer previsões com o conjunto de teste (substitua 'conjunto_teste' pelo seu conjunto de teste)
previsoes <- predict(modelo_arvore, conjunto_teste, type = "class")












## Conceito - Modelo de Árvore de Decisão

# - Uma árvore de decisão é um modelo de aprendizado de máquina que é utilizado tanto para tarefas de classificação quanto para
#   tarefas de regressão. Ela é uma representação gráfica de decisões e suas possíveis consequências, onde cada nó representa
#   uma escolha entre diversas alternativas, cada ramificação representa o resultado de uma decisão, e cada folha representa um 
#   resultado final.

# - Para que serve um modelo de árvore de decisão:
  
#  -> Classificação: Em problemas de classificação, a árvore de decisão ajuda a classificar instâncias em categorias ou classes 
#                    distintas.

#  -> Regressão    : Em problemas de regressão, ela prevê um valor numérico com base nas características da instância.

#  -> Interpretação: Além de sua capacidade preditiva, as árvores de decisão são valiosas porque podem ser facilmente interpretadas 
#                    e visualizadas, fornecendo insights sobre quais variáveis são mais importantes na tomada de decisões.

# - Necessidade de uma pergunta de negócio:

#  -> Embora nem sempre seja obrigatório ter uma pergunta de negócio antes de criar um modelo de árvore de decisão, ter uma
#     clara compreensão do problema de negócios pode direcionar a construção do modelo.
#     Entender quais perguntas ou decisões específicas precisam ser respondidas pode orientar a escolha das variáveis e ajustes 
#     do modelo. A árvore de decisão reflete as decisões e as relações entre variáveis, e, portanto, ter uma compreensão clara
#     do contexto de negócios ajuda a construir um modelo mais relevante e útil.








#################   RESPOSTA PROFESSOR   #################


dados = kyphosis


## Exercício

# a) Após explorar o dataset, crie um modelo de árvore de decisão

arvore <- rpart(Kyphosis ~ ., method = "class", data = dados)

class(arvore)

arvore

# - foi escolhido o "method = "class" porque estamos prevendo uma categoria (variável Kyphosis é facotr categórica)




# b) Examine o resultado de uma árvore de decisao, para isso existem diversas funcões, mas você pode usar printcp()
#    ( Exemplo: " prp(arvore) " )

printcp(arvore)



# c) Visualize a ávore (execute uma função para o plot e outra para o texto no plot).
#    Utilize o zoom para visualizar melhor o gráfico.

plot(arvore, uniform = TRUE, main = "Árvore de Decisão em R")
text(arvore, use.n = TRUE, all = TRUE)



















#### REALIZANDO PREVISÕES E DIVINDO EM TREINO E TESTE

## Dividindo os dados em treino e teste
amostra <- sample.split(dados$Kyphosis, SplitRatio = 0.80)

treino <- subset(dados, amostra == TRUE)
teste <- subset(dados, amostra == FALSE)

# -> Lembrando sempre que: Treinamos o modelo com dados de TREINO e fazemos predições com dados de TESTE



## TREINANDO E VISUALIZANDO MODELO

arvore <- rpart(Kyphosis ~ ., method = "class", data = treino)

printcp(arvore)
plot(arvore, uniform = TRUE, main = "Árvore de Decisão em R")
text(arvore, use.n = TRUE, all = TRUE)




## PREVISÕES
previsoes <- predict(arvore, teste, type = "class")
previsoes


## Visualizando perfomance do modelo
resultados <- cbind.data.frame(Real = teste$Kyphosis, predictions = previsoes)
head(resultados)


## Criando um vetor de TRUE/FALSE indicando previsões CORRETAS/INCORRETAS
vetor <- previsoes == teste$Kyphosis

table(vetor)                    # FALSE 4        TRUE 12
prop.table(table(vetor))        # FALSE 0.25     TRUE 0.75  








