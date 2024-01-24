# Pacote Caret

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



#### Usando o Pacote Caret para criar e customizar Modelos de Machine Learning

# -> O Pacote Caret é um dos principais pacotes para construção de Modelos de Machine Learning em R.

# -> Usaremos o pacote Caret para customizar os modelos de Machine Learning no Azure ML Studio.



# Instalando os pacotes
installed.packages("caret")
installed.packages("randomForest")


# Carregando os pacotes
library(caret)
library(randomForest)



# Usando dataset mtcars
dados <- mtcars
head(dados)


# Utilizando função do Caret para a divisão dos dados
set.seed(1234)
split <- createDataPartition(y = dados$mpg, p = 0.7, list = FALSE)

# Dividindo dados em treino e teste
dados_treino <- dados[split, ]
dados_teste <- dados[-split, ]



#### Treinando o modelo

# Versão 1 - utilizando todas as variáveis (método lm)
modelo_v1 <- train(mpg ~ ., data = dados_treino, method = 'lm')
summary(modelo_v1)

# Mostrando importância das variáveis para a criação do modelo
varImp(modelo_v1)

# Plot das Variáveis mais importantes
plot(varImp(modelo_v1))


# Versão 2 - utilizando as variáveis wt, hp, am e disp (método lm)
modelo_v2 <- train(mpg ~ wt + hp + am + disp, data = dados_treino, method = 'lm')
summary(modelo_v2)
varImp(modelo_v2)


# Versão 3 - utilizando as variáveis hp e wt (método lm)
modelo_v3 <- train(mpg ~ hp + wt, data = dados_treino, method = 'lm')
summary(modelo_v3)
varImp(modelo_v3)


# Versão 4 - utilizando as variáveis wt, hp, am e disp (método rf) - não exibe nível de precisão
modelo_v4 <- train(mpg ~ wt + hp + am + disp, data = dados_treino, method = 'rf')
summary(modelo_v4)
varImp(modelo_v4)


## Ajuste do Modelo (permite utilizar os parâmetros para treinar o modelo criado com o pacote caret)

# - O uso de validação cruzada ajuda a estimar o desempenho do modelo de maneira mais robusta

controle1 <- trainControl(method = 'cv', number = 10) # técnica para dividir os dados em vários pedaços ()

modelo_final <- train(mpg ~ wt + hp + am + disp, data = dados_treino, method = 'lm',
                      trControl = controle1, metric = "Rsquared")
summary(modelo_final)
varImp(modelo_final)




#### Previsões

# Coletando resíduos
residuals_v2 <- resid(modelo_v2)
residuals_final <- resid(modelo_final)

# Fazendo as previsões

predictValues_v2 <- predict(modelo_v2, dados_teste)
predictValues_v2
plot(dados_teste$mpg, predictValues_v2)

predictValues_final <- predict(modelo_final, dados_teste)
predictValues_final
plot(dados_teste$mpg, predictValues_final)



## Conferindo as previsões
resultados_modelo_v2 <- cbind.data.frame(mpg_real = dados_teste$mpg, predictions = predictValues_v2)
head(resultados_modelo_v2)

resultados_modelo_final <- cbind.data.frame(mpg_real = dados_teste$mpg, predictions = predictValues_final)
head(resultados_modelo_final)

