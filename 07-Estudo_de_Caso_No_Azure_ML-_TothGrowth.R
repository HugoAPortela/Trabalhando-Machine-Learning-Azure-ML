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



#### PASSO A PASSO NO Azure ML


## Carregando dados


# - Clicar em "New" no menu inferior, escolher no menu lateral esquerdo "datasets" e carregar o arquivo.
# - Após carregar o arquivo, vamos em "Saved Datasets" no lad esquerdo e em "My Datasets" estará o nosso arquivo. 
#   Agora basta arrastar e soltar na nossa área de trabalho.


## Colocando Módulo

# - Após carregar o módulo com os dados, arrastar e carregar o módulo Execute R Script
# - Ao lado direito colar o seguinte código:


library("AzureML")

ws <- workspace(
  id = "",
  auth = "",
  api_endpoint = ""
)

ds <- download.datasets(
  dataset = ws,
  name = "dados_TothGrowth_tipo_OJ.csv"
)

ds2 <- download.datasets(
  dataset = ws,
  name = "dados_TothGrowth_tipo_VC.csv"
)
# head(ds)

# Teste Shapiro-Wilk
result_OJ <- shapiro.test(ds$len)
print("Teste Shapiro-Wilk Grupo OJ")
print(result_OJ)

result_VC <- shapiro.test(ds2$len)
print("Teste Shapiro-Wilk Grupo VC")
print(result_VC)

# Teste F
result_teste_f <- var.test(ds$len, ds2$len)
print("Teste F")
print(result_teste_f)



# Clicar em Run Após Execução dos Códigos

# Clicar na segunda saída do módulo Execute R Script para visualizar o resultado



