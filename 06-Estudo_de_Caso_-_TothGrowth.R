# Estudo de Caso

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



# - Neste estudo de caso usaremos o dataset ToothGrowth disponível no pacote datasets em Re carregado quando você inicializa
#   o RStudio.

# - Esse dataset contém um conjunto de registros com informações sobre o comprimento dos dentes de Porcos da Guiné.

# - Pesquisadores ministraram diferentes doses de 2 tipos de suplementos vitamínicos em 60 porquinhos e avaliaram o
#   resultadono crescimento dos dentes dos animais.

# - Com base nesses dados iremos responder à seguinte pergunta:

#  -> Há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado nos Porcos da Guiné ?
#     Um teste estatístico vai nos ajudar a encontrar a resposta!

#   -> H0 = afirma que não há diferença significativa.
#   -> H1 = afirma que há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado.



# Carregando pacotes
library(dplyr)
library(car) # qqplot
library(ggplot2)
library(GGally)



# Carregando dados
dados <- ToothGrowth
head(dados)

View(dados)

# Tipo de dados
str(dados)
summary(dados)

# Histograma da variável len
hist(dados$len)

# GGPairs
ggpairs(dados)

# BoxPlot por tipo de suplemento (supp)
qplot(supp,
      len,
      data = dados,
      main = "Crescimento dos Dentes dos Porcos da Guiné por Tipo de Suplemento",
      xlab = "Tipo de Suplemento",
      ylab = "Comprimento do Dente") +
  geom_boxplot(aes(fill = supp))

# - Analisando o BoxPlot acima podemos interpretar que parece haver uma diferença no crescimento dos dentes,
#   associada ao tipo de suplemento. Será necessário validar.



# Dividindo os dados em dois tipos de suplemento
tipo_OJ <- 
  dados %>% 
  filter(supp == 'OJ') %>% 
  na.omit(tipo_OJ)

tipo_VC <- 
  dados %>% 
  filter(supp == 'VC') %>% 
  na.omit(tipo_VC)






#### RESPOSTA 1 (Não foi considerado a variável "dose")


##### Validações


## qqPlot

qqPlot(tipo_OJ$len)
qqPlot(tipo_VC$len)

# - Ambos os grupos estão com a pontos de dados (bolinhas) dentro do intervalo de confiança, o que indica
#   uma distribuição normal



## teste shapiro-wilk

shapiro.test(tipo_OJ$len)             # valor-p = 0.02359 (ou seja, menor que 0.05)
shapiro.test(tipo_VC$len)             # valor-p = 0.4284  (ou seja, maior que 0.05)

# - Para o grupo "OJ", o teste de Shapiro-Wilk tem um valor-p de 0.02359, que é menor que 0.05. Isso sugere uma evidência
#   fraca contra a normalidade. No entanto, em contextos práticos, valores-p ligeiramente abaixo de 0.05 são frequentemente
#   considerados aceitáveis, especialmente com tamanhos de amostra grandes.



## teste f (valor-p precisa ser maior que 0.05)

var.test(tipo_OJ$len, tipo_VC$len) # p-value = 0.2331 

# - O teste F para comparar as variâncias tem um valor-p de 0.2331, que é maior que 0.05. Isso sugere que não há evidência para
#   rejeitar a hipótese nula de homogeneidade de variâncias.



## Aplicando teste t

t.test(tipo_OJ$len, tipo_VC$len, alternative = "two.sided")  # p-value = 0.06063


## Conclusão:

# - O valor de p de 0.06063 é maior que 0.05, indicando que não há evidências estatísticas suficientes para concluir que as médias
#   dos grupos "OJ" e "VC" são diferentes em termos de crescimento dos dentes.

# - Portanto, não há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado nos Porcos da Guiné,
#   com base nos dados disponíveis neste estudo. 






#### RESPOSTA 2 (aplicando teste ANOVA e considerando variável "dose")

# - É correto dizer que se houvesse apenas um valor de dose específico para cada tipo de suplemento ("supp"), o teste t seria
#   apropriado. O teste t é apropriado para comparar as médias de dois grupos independentes, e neste caso, você teria dois grupos
#   distintos (um para "VC" e outro para "OJ"), cada um com um único valor de dose.

# - No entanto, como existem múltiplos valores de dose para cada tipo de suplemento, o teste de Análise de Variância (ANOVA)
#   torna-se mais apropriado. O ANOVA é utilizado quando há mais de dois grupos a serem comparados e pode fornecer informações
#   sobre as diferenças entre as médias de grupos com base nos níveis de uma ou mais variáveis independentes.

# - Portanto, ao lidar com um design experimental em que há mais de um valor de dose para cada tipo de suplemento, o uso de
#   ANOVA permite avaliar as diferenças globais entre os grupos, considerando tanto o efeito do tipo de suplemento quanto o
#   efeito da dose, incluindo possíveis interações.


teste_anova <- aov(len ~ supp * dose, data = dados)
teste_anova

summary(teste_anova)


# Explicando o uso de "supp * dose" ao invés de "supp + dose"

# - Utilizando o "*": nesta formulação, o termo supp * dose inclui tanto os efeitos principais de "supp" e "dose" quanto a interação 
#   entre eles. Isso significa que o modelo avaliará não apenas os efeitos independentes de "supp" e "dose" nas médias, mas também
#   se há uma interação significativa entre "supp" e "dose" (ou seja, se o efeito de "supp" é diferente em diferentes níveis de
#   "dose" e vice-versa).

# - Utilizando o "+": nesta formulação, os termos supp e dose são considerados como efeitos principais sem uma interação explícita. 
#   Isso significa que o modelo avaliará apenas os efeitos principais de "supp" e "dose" nas médias, sem considerar uma interação
#   entre eles. Se houver uma interação real entre "supp" e "dose", essa formulação pode não capturar adequadamente esse efeito.


## Conclusão

# - Com base nos resultados do teste ANOVA, podemos concluir que há diferenças significativas no crescimento dos dentes de acordo
#   com o tipo de suplemento usado nos Porcos da Guiné.

# - Além disso, a dose do suplemento e a interação entre tipo de suplemento e dose também têm efeitos significativos nas médias
#   dos grupos.

# - Portanto, a resposta à pergunta é sim, há diferença significativa no crescimento dos dentes com base no tipo de suplemento, 
#   dose e a interação entre eles





#### COMPARAÇÃO ENTRE A RESPOSTA 1 E RESPOSTA 2

# Resposta 1: Teste t para médias entre os grupos "OJ" e "VC":

# - O teste t verifica se há uma diferença significativa nas médias do comprimento dos dentes entre os grupos "OJ" e "VC".
#   O valor-p associado ao teste t é 0.06063, que é ligeiramente maior que 0.05. Portanto, não há evidências estatísticas suficientes
#   para rejeitar a hipótese nula de que as médias são iguais. 
# - Essa abordagem avalia diretamente a diferença entre as médias dos dois grupos.

# Resposta 2: Teste ANOVA considerando "supp" e "dose" e a interação:
  
# - O teste ANOVA avalia não apenas a diferença entre as médias dos grupos "OJ" e "VC" (efeito de "supp") mas também considera o
#   efeito da variável "dose" e a interação entre "supp" e "dose". O valor-p global para o teste ANOVA é < 0.05, indicando que 
#   pelo menos um dos fatores ou a interação entre eles tem um efeito significativo nas médias. O efeito significativo de "dose" 
#   sugere que a dose do suplemento tem impacto nas médias dos grupos.


## Conclusão:
  
# - Ambas as abordagens indicam que há algo acontecendo com os grupos "OJ" e "VC". A resposta pode variar dependendo do foco. 

# - Se a ênfase for na diferença direta entre as médias dos grupos "OJ" e "VC", a Resposta 1 é mais apropriada. 
#   Se a análise incluir a influência da variável "dose" e a interação, a Resposta 2 oferece uma visão mais abrangente.

# - Portanto, ambas as respostas estão corretas, e a escolha entre elas depende do escopo e dos objetivos específicos da análise. 






#### RESPOSTA 3 (Gabarito Professor)

# Carregando dados
dados <- ToothGrowth
head(dados)

?ToothGrowth

# Tipo de dados
str(dados)
summary(dados)

# Histograma da variável len
hist(dados$len)

# GGPairs
ggpairs(dados)

# BoxPlot por tipo de suplemento (supp)
qplot(supp,
      len,
      data = dados,
      main = "Crescimento dos Dentes dos Porcos da Guiné por Tipo de Suplemento",
      xlab = "Tipo de Suplemento",
      ylab = "Comprimento do Dente") +
  geom_boxplot(aes(fill = supp))

# - Analisando o BoxPlot acima podemos interpretar que parece haver uma diferença no crescimento dos dentes,
#   associada ao tipo de suplemento. Será necessário validar.

# - Este boxplot não está levando com consideração a variável "dose"





## SOLUÇÃO 1: Aplicar um Teste t de amostras independentes a fim de verificar se os tipos de suplementos tem
#             impacto no crescimento dos dentes nos animais. 


#   -> H0 = afirma que não há diferença significativa entre a média dos dois grupos.
#   -> H1 = afirma que há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento usado.


# Para aplicar o Teste t primeiro precisamos validar as 5 suposições deste Teste:

#  1 -> Os dados são aleatórios e representativos da população (apesar de não ser eu a coletar os dados, vamos considerar como verdadeiras)
#  2 -> A variável dependente é contínua.
#  3 -> Ambos os grupos são independentes (ou seja, grupos exaustivos e excludentes).
#  4 -> Os resíduos do modelo são normalmente distribuídos. (os dados seguem uma distribuição normal? Para validar, aplicaremos teste estatístico)
#  5 -> A variância residual é homogênea (princípio da homocedasticidade). (as duas amostras tem a mesma variância?)

# - Para este Estudo de Caso iremos considerar como verdadeiras as suposições 1, 2 e 3 e iremos validar as suposições 4 e 5.
#   Usaremos o Teste de Shapiro-Wilk para validar a suposição 4 e usaremos o Teste f para a suposição 5.
#   (tal como foi feito na resposta pessoal 1)



# Validando a suposição 4 com o Teste de Shapiro-wilk

shapiro.test(tipo_OJ$len)             # valor-p = 0.02359 (ou seja, menor que 0.05)
shapiro.test(tipo_VC$len)             # valor-p = 0.4284  (ou seja, maior que 0.05)

# - Para o grupo "OJ", o teste de Shapiro-Wilk tem um valor-p de 0.02359, que é menor que 0.05. Isso sugere uma evidência
#   fraca contra a normalidade. E diferentemente da resposta pessoal 1, iremos abordar melhor esta questão.



## Uma das suposições do Teste t não foi satisfeita e por isso o teste não pode ser usado! (O correto é mudar o teste)

## Para fins didáticos vamos realizar o Teste f e na sequência o Teste t mesmo assim



# Validando suposição 5 com o Teste f

var.test(len ~ supp, data = dados)  # p-value = 0.2331

# - Este teste f em termos de eficiência e clareza de código, é geralmente preferida, pois evita a necessidade de 
#   como foi por exemplo na resposta pessoal 1 criar subconjuntos manualmente.

# - O valor p é de 0.2331, logo é maior que 0.05.
#   Portanto não há diferença significativa entre a variância dos 2 grupos. Suposição validada.


# Teste t

t.test(tipo_OJ$len, tipo_VC$len, alternative = "two.sided")  # p-value = 0.06063

## Conclusão

# - Assim como na resposta pessoal 1, o valor-p é de 0.06063, logo é maior que 0.05 e portanto falhamos em rejeitar a H0.

# - Logo, segundo o Teste t (onde uma das suposições não foi validada) não há diferença significativa no crescimento dos
#   dentes de acordo com o tipo de suplemento usado nos Porcos da Guiné.

# Observação: olhando BoxPlot novamente podemos ver que existe sim uma diferença no crescimento dos dentes e lembrando que
#             SABEMOS também que uma das validações do Teste t não foi satisfeit, o correto é aplicarmos outro tipo de teste.


# -> E para finalizar podemos afimar que a Solução 1 e a resposta pessoal 1 não são válidas para este problema de negócio 
#    específico pois os dados não satisfazem uma das suposições!




## E agora ? O que fazer quando a suposição do teste estatístico não é satisfeita ?





## SOLUÇÃO 2: Aplicar o teste ANOVA a fim de verificar se as dosagens dos tipos de suplemento é que causam impacto no crescimento
#             dos dentes dos animais.

# - Diferentemente da da resposta pessoal 1 e da solução 1 vamos abordar a seguinte questão:

#  -> "Será que a dosagem do suplemento é que realmente faz a diferença e não o tipo de suplemento?"



# Para aplicarmos o teste ANOVA, temos as seguintes suposições:

#  1 -> Dentro de cada amostra, as observações são amostradas aleatoriamente e independemente umas das outras.
#  2 -> Cada amostra de grupo é extraída de uma população normalmente distribuída.
#       (precisaremos verificar se os dados seguem uma distribuição normal, tal como suposição 4 do teste t)


# Iremos considerar a suposição 1 como verdadeira (não temos como verificar a veracidade dos dados)


## Validando Suposição 5

# - Assim como na suposição 4 do teste t, iremos dividir nossos dados em grupos de acordo com as doses.


# Verifica quais tipos de valor de dose
unique(dados$dose)


# Separando as doses por grupo

dose_0_5 <-              # dose_0_5 <- dados$len[dados$dose == 0.5]
  dados %>% 
  filter(dose == 0.5)

dose_1_0 <-              # dose_1_0 <- dados$len[dados$dose == 1.0]
  dados %>% 
  filter(dose == 1.0)

dose_2_0 <-              # dose_2_0 <- dados$len[dados$dose == 2.0]
  dados %>% 
  filter(dose == 2.0)


# Aplicando teste de Normalidade Shapiro-Wilk em cada grupo

shapiro.test(dose_0_5$len) # valor-p = 0.2466 (ou seja, maior que 0.05)
shapiro.test(dose_1_0$len) # valor-p = 0.1639 (ou seja, maior que 0.05)
shapiro.test(dose_2_0$len) # valor-p = 0.9019 (ou seja, maior que 0.05)

## Conclusão

# - O valor-p de todos os 3 grupos são maiores que 0.05, logo as 3 amostras são distribuídas.
#   A suposição foi validada.


# Teste Anova

teste_anova2 <- aov(len ~ dose, dados)
summary(teste_anova2)

# - Com base nesta análise unidirecional, a dosagem tem um efeito muito significativo no comprimento do dente.


## Conclusão

# - O tipo de suplemento não parece fazer diferença. O que faz a diferença é a dosagem do suplemento.



## Indo além

# - Como percebemos pelo teste ANOVA, o que faz diferença é a dosagem do suplemento

# - Sendo assim, podemos validar isso com um Modelo De Reressão Linear

modelo_lm <- lm(len ~ supp + dose, dados)
summary(modelo_lm)













# Vamos supor que você deseja salvar o dataframe 'dados' em um arquivo chamado 'dados.csv'
write.csv(tipo_OJ, file = "dados_TothGrowth_tipo_OJ.csv", row.names = FALSE)
write.csv(tipo_VC, file = "dados_TothGrowth_tipo_VC.csv", row.names = FALSE)
write.csv(dados, file = "dados_TothGrowth.csv", row.names = FALSE)

