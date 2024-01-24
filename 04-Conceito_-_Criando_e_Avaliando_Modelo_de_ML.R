# Conceito - Criando e Avaliando um Modelo de ML

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



#### Criando e Avaliando um Modelo de Machine Learning no Azure ML


# Após limpar toda área de trabalho, iremos criar um experimento de Machine Learning do início ao fim.



##  Carregando Dados

# - Iremos carregar o dataset Iris. Digitar no campo de busca "iris" e aparecerá em "Samples" o dataset
#   "Iris Two Class Data", selecionamos este módulo e arrastamos para a área de trabalho.


##  Dividindo dataset em dados de treino e teste

# - Digitar "split" na busca e escolher o módulo "Split Data"


##  Selecionando Modelo de Algortimo de ML

# - Iremos selecionar um algoritmo de Regressão Linear.
# - No campo de busca, digitar "linear" e selecionar o módulo "Linear Regression" e arrastar para área de trabalho.


##  Selecionar o Módulo de Treinamento do Modelo

# - Digitar "train" na busca e escolher o módulo "Train Model"


##  Aplicando modelo aos dados de teste (score)

# - Digitar 'score mo' na busca e escolher o módulo 


##  Avaliar modelo para ver o nível de performance

# - Digitar "evaluate" e escolher o módulo "Evaluate Model"


# -> Acima temos um fluxo de trabalho básico para criar e avaliar um modelo de ML.

# -> Agora que escolhemos os módulos que iremos utilizar, podemos minimizar o menu lat esquerdo e focar no lad direito.


##  Fazendo a ligação dos Módulos

# - Ligar o módulo do dataset iris com o módulo de divisão de testes e treino "Split Data"
# - Podemos observar que este módulo possui duas portas de saída.
# - Após ligar o modulo do dataset iris com o módulo "Split Data", no lad direito podemos definir como ele irá dividir
#   os dados. Iremos alterar o "Fraction of rows" para 0.7. Em "Random seed" colocar um valor para reproduzir os mesmos
#   resultados.

# - Agora vamos olhar para o módulo "Train Model" que possui duas portas de entrada. Na primeira porta de entrada ele
#   recebe o módulo "Linear Regression" com o algortimo e na segunda porta ele recebe da primeira porta de saída (lad esq)
#   do módulo "Split Data" que contém os dados de treino.

# - Ainda no módulo "Train Model", devemos clicar nele e escolher nossa variável alvo.
#   Clicamos no módulo e no lad direito clicamos em "Launch column selector", após isso na nova aba digitaremos o nome da
#   variável (neste caso é a variável "sepal-length" cujo o tipo é um valor numérico, por o algoritmo de regressão linear)

# - Agora vamos olhar para o módulo "Score Model" que também possui duas portas de entrada. A primeira porta receberá os
#   dados do módulo "Train Model" enquanto a segunda porta receberá os dados da segunda porta de entrada do módulo 
#   "Split Data" com os dados de teste.

# - Por fim conectamos o módulo "Score Model" no módulo "Evaluate Model"

# - Agora clicar em "Run" no menu inferior e aguardar.

# - Para visualizar o resultado final, clicar com o botão direito no módulo "Evaluate Model" e selecionar "Visualize", 
#   onde irá aparecer as métricas de avaliação do modelo. O "coefficient of Determination" é o R-squared em R.




##  Comparando a Performance entre dois Modelos de Machine Learning

# Será que nós conseguiríamos um modelo com uma performance melhor utilizando outro algoritmo de regressão linear?


# - Vamos buscar o módulo "Neural NetWork Regression", selecionar e arrastar para a mesma área de trabalho.

# - Feito isso podemos selecionar o módulo de "Train Model" ou clicar em cima do já existem e selecionar "copy" e
#   arrastar este novo módulo "Train Model" para a área de trabalho.
# - Repetir o mesmo processo para o módulo "Score Model".

# - Como o módulo "Train Model" foi 'copiado' do já existente, não precisamos selecionar a variável alvo pois ela já
#   está escolhida. Se tivessemos colocado um novo módulo "Train Model" teríamos que repetir o processo de escolher a
#   variável alvo.

# - Agora vamos ligar o módulo "Neural NetWork Regression" na primeira porta de "Train Model" e ligar a primeira porta
#   de saída de "Split Data" na segunda porta de entrada de "Train Model".

# - Agora vamos ligar o módulo "Train Model" na primeira porta de entrada "Score Model" e ligar a segunda porta de saída
#   de "Split Data" na segunda porta de entrada de "Score Model".

# - Por fim ligar o módulo de "Score Model" na segunda porta de entrada de "Evaluate Model" e assim conseguiremos comparar
#   os dois modelos.
# - O módulo "Evaluate Model" possui duas portas de entrada que serve justamente para comparar os modelos.


# - Agora ao clicar em "Visualize" do módulo "Evaluate Model" teremos a comparação das métricas de ambos os modelos.



## DOCUMENTAÇÃO E EXEMPLOS

# - Ao clicar no módulo "Linear Regression" e ir no lad direito e clicar em "more help" abrirá uma página da Microsoft com a 
#   documentação do algoritmo. 

# - Na página web, podemos descer até o subtítulo "Examples" e ao clicar em um exemplo, poderemos visualizar todo um roteiro
#   de um projeto já pronto.

# - Podemos também clicar em "Open In Studio" e ele irá abrir o projeto direto no Azure ML.





