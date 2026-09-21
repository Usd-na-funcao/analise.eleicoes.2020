# Camada Staging — TSE Eleições 2020

## Objetivo

Criar uma camada de staging no PostgreSQL para receber amostras dos datasets do TSE de 2020, mantendo os arquivos originais preservados e permitindo a validação inicial dos dados.

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

## Ajustes realizados

Durante a importação foram necessários alguns ajustes:

- O encoding foi configurado como `WIN1252` para permitir a leitura correta dos caracteres presentes nos arquivos.
- O cabeçalho foi configurado para ser reconhecido como nome das colunas.
- Campos vazios foram convertidos para `\N` nas amostras, permitindo que fossem interpretados como `NULL` pelo PostgreSQL.
- Os valores preenchidos dos arquivos foram preservados.
- Uma duplicação identificada na tabela `staging.bweb_2t_sp` foi corrigida antes da validação final.

## Validação

Após a carga, foram realizadas consultas para verificar a quantidade de registros e o preenchimento de campos críticos.

Resultado final:

| Tabela | Registros |
|---|---:|
| `staging.consulta_cand_2020_sp` | 10.000 |
| `staging.perfil_eleitor_secao_2020_sp` | 10.000 |
| `staging.bweb_1t_sp` | 10.000 |
| `staging.bweb_2t_sp` | 10.000 |

Também foram validados campos importantes de cada tabela, como identificadores, município, zona, seção e quantidade de votos/eleitores.

## Resultado

A camada staging foi criada, carregada e validada com amostras dos dados reais do TSE.

O processo mantém a rastreabilidade entre os arquivos de origem e as tabelas correspondentes no PostgreSQL, além de permitir a reprodução da estrutura por meio do DDL versionado.
