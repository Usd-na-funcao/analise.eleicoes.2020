# Camada Staging — TSE Eleições 2020

## Objetivo

Criar uma camada de staging no PostgreSQL para receber amostras dos datasets do TSE de 2020, mantendo os arquivos originais preservados e permitindo a validação inicial dos dados.

## Tecnologias utilizadas

| Tecnologia | Utilização |
|---|---|
| PostgreSQL | Banco de dados utilizado para armazenar as tabelas da camada staging. |
| pgAdmin | Interface utilizada para criar o schema, tabelas, realizar a importação dos CSVs e executar as consultas de validação. |
| Python | Utilizado para criar as amostras dos arquivos CSV e realizar ajustes necessários para a importação. |
| Google Colab | Ambiente utilizado para executar os scripts Python e trabalhar com os arquivos CSV. |
| GitHub | Utilizado para versionar o código SQL e armazenar a documentação do projeto. |
| SQL | Utilizado para criação das estruturas, consultas e validações no PostgreSQL. |
| CSV | Formato dos arquivos de origem disponibilizados pelo TSE. |

## Fontes de dados

Foram utilizados quatro arquivos CSV do TSE:

| Arquivo de origem | Tabela no PostgreSQL |
|---|---|
| `consulta_cand_2020_SP.csv` | `staging.consulta_cand_2020_sp` |
| `perfil_eleitor_secao_2020_SP.csv` | `staging.perfil_eleitor_secao_2020_sp` |
| `bweb_1t_SP_181120201549.csv` | `staging.bweb_1t_sp` |
| `bweb_2t_SP_301120201245.csv` | `staging.bweb_2t_sp` |

## Estrutura

Foi criado o schema `staging` no banco de dados PostgreSQL.

As tabelas foram estruturadas de acordo com as colunas existentes nos arquivos reais, utilizando tipos como:

- `TEXT`
- `INTEGER`
- `BIGINT`
- `DATE`
- `TIME`
- `TIMESTAMP`

O DDL utilizado para criação das tabelas está versionado em:

`/sql/staging/create_staging.sql`

## Carga dos dados

Foram utilizadas amostras de **10.000 registros de cada arquivo** para realizar a carga no PostgreSQL.

Os arquivos originais do TSE foram preservados.

As amostras foram preparadas no Google Colab utilizando Python antes da importação para o PostgreSQL.

## Ajustes realizados

Durante a importação foram necessários alguns ajustes:

- O encoding foi configurado como `WIN1252` para permitir a leitura correta dos caracteres presentes nos arquivos.
- O cabeçalho foi configurado para ser reconhecido como nome das colunas.
- Campos vazios foram convertidos para `\N` nas amostras, permitindo que fossem interpretados como `NULL` pelo PostgreSQL.
- Os valores preenchidos dos arquivos foram preservados.
- Uma duplicação identificada na tabela `staging.bweb_2t_sp` foi corrigida antes da validação final.

## Validação

Após a carga, foram realizadas consultas SQL no pgAdmin para verificar a quantidade de registros e o preenchimento de campos críticos.

Resultado final:

| Tabela | Registros |
|---|---:|
| `staging.consulta_cand_2020_sp` | 10.000 |
| `staging.perfil_eleitor_secao_2020_sp` | 10.000 |
| `staging.bweb_1t_sp` | 10.000 |
| `staging.bweb_2t_sp` | 10.000 |

Também foram validados campos importantes de cada tabela, como identificadores, município, zona, seção e quantidade de votos/eleitores.

## Rastreabilidade

A relação entre os arquivos de origem e as tabelas de destino foi mantida por meio do mapeamento apresentado na seção **Fontes de dados**.

Os arquivos originais foram preservados e as amostras utilizadas na carga foram geradas separadamente.

## Resultado

A camada staging foi criada, carregada e validada com amostras dos dados reais do TSE.

O processo permite a reprodução da estrutura do banco por meio do DDL versionado e mantém a relação entre os arquivos de origem e as respectivas tabelas de staging.
