# Conceito - Criando Experimentos no Azure ML

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/12.Microsoft-Azure-Machine-Learning")
getwd()



#### Criando Experimentos no Azure ML


# - Clicar em New
# - Aba Experiment
# - Blank Experiment (irá carregar o experimento)

# - Começar alterando título do experimento
# - Ao lado direito temos sumário e descrição que poderá ser preenchido.
# - Ao lado esquerdo temos uma série de menus
# - No meio temos a área de trabalho
# - Na barra inferior temos outras opções como salvar, criar cópia, run, configurar web service e publicar na galeria Microsoft.


# - Explorando menu lado esquerdo:

# - Primeiro temos o datasets, ao clicar vemos que já temos alguns datasets oferecidos pela própria Microsoft.
#   Escolheremos um destes datasets, clicamos e arrastamos para área de trabalho.
#   No lad esquerdo estarão informações do dataset escolhido/carregado.

# - Ao clicar com o botão direito em cima do dataset na área de trabalho podemos fazer o download do mesmo, podemos abrir
#   em um "Notebook" utilizando Python ou R.
#   Podemos também ao clicar em "visualizar" ver os dados bem organizados e ao clicarmos na coluna já conseguimos ver a média,
#   mediana, valores máximo e mínimos e gráficos (histrograma e boxplot).

# - Voltando ao menu do lado esquerdo temos...

# - Data Format Conversions que serve para converter os dados independemente de como foram carregados.
# - Data Input and Output serve para fazer importação e exportação dos dados, importa inclusive Modelos já treinados.
# - Data Transformation serve para transformar os dados como aplicar filtros. Cada menu de transformação tem seu submenu.
# - Feature Selection que serve para seleção de atributos, ou seja escolhendo variáveis com base em critérios específicos.
# - Machine Learning são as opções para Machine Learning. Tem módulos para variar o modelo, inicializar o modelo.
# - Módulos para customização utilizando linguagem Python ou R
# - Funções estatísticas com funções prontas
# - Por fim a opção de WebService para publicar o modelo.




#### Trabalhando com Módulos 

# Trabalhando com Módulos:

# - Após escolher e arrastar um dataset para a área de trabalho, você pode adicionar módulos específicos para manipulação 
#   de dados.
# - Dentro do menu "Data Transformation - Manipulation", escolher o módulo "Select Columns in Dataset" e arrastá-lo para a 
#   área de trabalho. (Seleção de colunas)
# - Cada módulo possui portas de entrada e saída representadas por mini botões circulares na parte superior e inferior do 
#   retângulo do módulo.
# - Conectar a porta de saída de um módulo à porta de entrada de outro para estabelecer a sequência do fluxo de dados.

# - Após conectar o módulo com dataset no módulo de seleção de colunas, clicar no módulo de seleção de colunas e no menu
#   direito clicar em "Launch column selector", selecionar as colunas que iremos utilizar e passar para o lado direito.
# - Após a seleção das colunas ("select" em R), clicar em "Run", aguardar e depois com o botão direito clicar no módulo,
#   Results dataset e visualizar.


  

#### Importação e Exportação de Dados

# - Clicar em "New" no menu inferior, escolher no menu lateral esquerdo "datasets" e carregar o arquivo.

# - Dependendo do tamanho, pode levar até alguns minutos para carregar.

# - Após carregar o arquivo, vamos em "Saved Datasets" no lad esquerdo e em "My Datasets" estará o nosso arquivo. 
#   Agora basta arrastar e soltar na nossa área de trabalho.


# O Azure ML tem uma série de módulos para entrada e saída de dados. Iremos explorar o menu "Data Input and Output"

# - Vamos começar arrastando o módulo "Enter Data Manually", onde temos a opção de colocar os dados manualmente.
# - O módulo "Import Data" é um módulo muito mais completo para adicionar dados.
# - O módulo "Unpack Zipped Datasets" serve para compactar datasets muito grandes, ou seja, carregamos o arquivo "zipado".
# - Diferente de "Import Data" onde temos apenas a porta de saída, o "Export Data" possui apenas a porta de entrada.




