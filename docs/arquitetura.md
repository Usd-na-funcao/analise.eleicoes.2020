# Arquitetura do Projeto
 
Este documento apresenta a arquitetura conceitual do projeto **BI Eleições 2020 — São Paulo**, considerando as ferramentas, tecnologias e etapas definidas para a preparação, organização e análise dos dados eleitorais.
 
```text
Portal TSE
    ↓
Arquivos CSV
    ↓
Python / Pandas
    ↓
Inspeção e Visualização das Colunas
    ↓
Criação de Amostras (10.000 linhas)
    ↓
Tratamento de Valores Nulos (\N)
    ↓
SQL Server / T-SQL
    ↓
Staging
    ↓
Data Mart
    ↓
Consultas e Análises
    ↓
Visualização dos Resultados
```
 
## 1. Responsabilidades Conceituais
 
- **Portal TSE:** fonte oficial dos dados eleitorais utilizados no projeto.
- **Arquivos CSV:** arquivos públicos disponibilizados pelo Tribunal Superior Eleitoral.
- **Python / Pandas:** utilizado para leitura inicial dos arquivos, inspeção e visualização dos nomes e da estrutura das colunas.
- **Amostragem:** criação de arquivos reduzidos contendo até 10.000 registros, além do cabeçalho, para facilitar a manipulação dos dados.
- **Tratamento de Valores Nulos:** substituição dos campos vazios pelo marcador `\N`, preparando os arquivos para importação no banco de dados.
- **SQL Server / T-SQL:** tecnologia utilizada para armazenamento, manipulação, tratamento e consultas dos dados.
- **Staging:** camada intermediária para recebimento, organização e validação dos dados importados.
- **Data Mart:** camada analítica destinada à organização dos dados conforme os objetivos e indicadores do projeto.
- **Consultas e Análises:** exploração dos dados eleitorais por meio de consultas SQL e visualização com Python/Pandas.
## 2. Detalhamento Operacional por Etapa
 
### Etapa 1: Fonte de Dados
 
- **Descrição:** obtenção dos arquivos públicos de dados eleitorais disponibilizados pelo Tribunal Superior Eleitoral (TSE).
- **Fonte:** Portal de Dados Abertos do TSE.
- **Formato:** arquivos CSV.
- **Entregável:** arquivos eleitorais utilizados como fonte para o desenvolvimento do projeto.
### Etapa 2: Inspeção e Visualização dos Dados
 
- **Descrição:** análise inicial dos arquivos para compreender sua estrutura e identificar as colunas disponíveis.
- **Ferramenta:** Python (Pandas).
- **Processos aplicados:**
  - Leitura do cabeçalho dos arquivos CSV.
  - Identificação e visualização dos nomes das colunas.
  - Verificação da estrutura dos arquivos.
  - Identificação do delimitador e da codificação utilizados.
- **Entregável:** identificação das colunas e compreensão inicial da estrutura dos dados.
### Etapa 3: Criação de Amostras
 
- **Descrição:** geração de arquivos reduzidos para facilitar a manipulação e o desenvolvimento das etapas seguintes.
- **Ferramentas:** Python (biblioteca CSV).
- **Processos aplicados:**
  - Preservação do cabeçalho original.
  - Seleção de até 10.000 registros por arquivo.
  - Geração de novos arquivos CSV contendo as amostras.
- **Objetivo:** reduzir o volume de dados durante o desenvolvimento e facilitar a importação no banco de dados.
- **Entregável:** arquivos CSV de amostragem.
### Etapa 4: Preparação e Tratamento dos Arquivos
 
- **Descrição:** preparação dos arquivos amostrados para importação no banco de dados.
- **Ferramenta:** Python (biblioteca CSV).
- **Processos aplicados:**
  - Preservação do delimitador original (`;`).
  - Manutenção da estrutura das colunas.
  - Substituição de campos vazios pelo marcador `\N`.
  - Preservação da codificação utilizada na leitura e gravação dos arquivos.
- **Objetivo:** adequar a representação dos valores ausentes para o processo de importação.
- **Entregável:** arquivos CSV amostrados e preparados para carga.
### Etapa 5: Banco de Dados e Camada de Staging
 
- **Descrição:** utilização do Microsoft SQL Server como ambiente relacional para recebimento e manipulação dos dados.
- **Ferramenta:** Microsoft SQL Server.
- **Linguagem:** T-SQL.
- **Objetivo:** realizar a importação, organização, validação e tratamento dos dados.
- **Processos previstos:**
  - Criação das estruturas de tabelas.
  - Importação dos arquivos CSV.
  - Definição e adequação dos tipos de dados.
  - Consultas para validação dos registros.
  - Aplicação das regras de tratamento e padronização.
- **Entregável:** tabelas estruturadas na camada de Staging, preparadas para utilização na camada analítica.
### Etapa 6: Data Mart
 
- **Descrição:** organização dos dados em uma estrutura analítica direcionada aos indicadores e objetivos do projeto.
- **Ferramenta:** Microsoft SQL Server (T-SQL).
- **Objetivo:** disponibilizar dados organizados para consultas e análises eleitorais.
- **Processos previstos:**
  - Definição da estrutura analítica.
  - Organização das informações por entidades e temas de interesse.
  - Relacionamento entre os dados eleitorais.
  - Criação de tabelas, consultas ou Views para apoiar as análises.
- **Entregável:** Data Mart estruturado para exploração analítica dos dados.
### Etapa 7: Consultas, Análises e Visualizações
 
- **Descrição:** exploração dos dados e apresentação dos resultados obtidos.
- **Ferramentas:** SQL Server (T-SQL) e Python (Pandas).
- **Responsabilidades:**
  - Execução de consultas analíticas utilizando T-SQL.
  - Visualização e exploração de dados com Pandas.
  - Identificação de padrões e indicadores eleitorais.
  - Organização dos resultados para apresentação e storytelling.
- **Entregável:** resultados e indicadores que apoiem a compreensão do cenário eleitoral de São Paulo em 2020.
---
 
## 3. Matriz de Responsabilidades
 
| Camada | Entrada | Saída | Ferramenta | Finalidade |
|---|---|---|---|---|
| Fonte de dados | Portal TSE | Arquivos CSV | Portal TSE | Obtenção dos dados |
| Inspeção | Arquivos CSV | Colunas identificadas | Python / Pandas | Visualização da estrutura |
| Amostragem | Arquivos CSV | Amostras de até 10.000 registros | Python / CSV | Redução do volume |
| Preparação | Arquivos amostrados | CSV com campos vazios representados por `\N` | Python / CSV | Preparação para importação |
| Staging | Arquivos preparados | Tabelas de Staging | SQL Server / T-SQL | Recebimento e validação |
| Data Mart | Dados do Staging | Estrutura analítica | SQL Server / T-SQL | Organização para análises |
| Análises | Data Mart | Indicadores e resultados | T-SQL / Pandas | Exploração e visualização |
 
---
 
## 4. Estrutura Padrão do Repositório de Código
 
O repositório do projeto considera a seguinte organização:
 
```text
projeto-tse-dados/
├── .gitignore
├── README.md
├── docs/
│   └── arquitetura.md
├── data/
│   └── samples/                 # Amostras dos arquivos CSV
├── scripts/
│   ├── inspection/              # Inspeção e visualização dos dados
│   └── preparation/             # Criação e preparação das amostras
└── sql/
    ├── staging/                 # Scripts de criação e carga das tabelas
    └── data_mart/               # Estruturas e consultas analíticas
```
 
## 5. Considerações sobre a Arquitetura
 
A arquitetura contempla uma estrutura simplificada, direcionada à construção de um Data Mart, sem implementação de Data Warehouse ou utilização de uma camada de armazenamento RAW.
 
O Python foi utilizado com Pandas para inspeção e visualização das colunas dos arquivos. A geração das amostras e a substituição dos campos vazios pelo marcador `\N` foram realizadas utilizando a biblioteca CSV do Python.
 
O Microsoft SQL Server será utilizado como banco de dados relacional, com T-SQL para as operações de carga, organização, tratamento e consultas dos dados na camada de Staging e no Data Mart.
