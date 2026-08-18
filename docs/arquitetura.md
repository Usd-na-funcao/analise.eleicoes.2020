# Arquitetura do projeto

Este documento apresenta a arquitetura conceitual prevista para o projeto **BI Eleições 2020 — São Paulo**.

```text
Portal TSE
    ↓
Dados RAW
    ↓
Python / Pandas
    ↓
Staging
    ↓
PostgreSQL
    ↓
ETL
    ↓
Data Warehouse / Data Mart
    ↓
Python / Jupyter + Power BI
    ↓
Dashboard e Storytelling
```

## Responsabilidades conceituais

- **Portal TSE:** fonte oficial dos dados eleitorais.
- **Dados RAW:** cópia local imutável dos arquivos de origem, fora do Git.
- **Python / Pandas:** leitura, validação e preparação dos dados.
- **Staging:** área intermediária para recebimento e padronização.
- **PostgreSQL:** persistência dos dados estruturados.
- **ETL:** fluxo de extração, transformação e carga.
- **Data Warehouse / Data Mart:** camada analítica modelada para consultas de negócio.
- **Python / Jupyter + Power BI:** análise, visualização e consumo dos dados.
- **Dashboard e Storytelling:** apresentação dos indicadores e descobertas.

> A arquitetura é apenas uma referência nesta etapa. A issue ELEICOES-8 não implementa ETL, banco de dados, análises ou dashboards.

# 2. Detalhamento Operacional por Etapa

### Etapa 1: Fonte de Dados
* **Descrição:** Obtenção automatizada dos arquivos públicos de dados eleitorais no portal do Tribunal Superior Eleitoral (TSE).
* **Ferramenta:** Python (`requests` / `urllib` / `zipfile`).
* **Entregável:** Arquivos originais `.zip` baixados diretamente dos repositórios oficiais sem qualquer manipulação.
* **Frequência:** Carga sob demanda ou agendada conforme a disponibilização de novas eleições/atualizações.

### Etapa 2: Organização e Governança dos Arquivos
* **Descrição:** Estruturação lógica dos diretórios de armazenamento no repositório local/Data Lake.
* **Estrutura de Pastas:**
  * `data/raw/`: Repositório imutável contendo os arquivos baixados exatamente na forma original.
  * `data/processed/`: Arquivos intermediários em formato otimizado (ex: Parquet) pós-sanitização preliminar.
* **Diretrizes de Qualidade:** É expressamente proibida a alteração manual dos arquivos residentes em `data/raw/`.

### Etapa 3: Tratamento e Sanitização de Dados
* **Descrição:** Limpeza, transformação, padronização de tipos e codificação.
* **Ferramentas:** Python (Pandas / Polars / PyArrow).
* **Processos Aplicados:**
  * **Correção de Encoding:** Conversão da codificação original (`ISO-8859-1` / `Latin-1`) para `UTF-8`.
  * **Padronização de Schema:** Normalização dos nomes de colunas para *snake_case* sem caracteres especiais ou acentuação.
  * **Tratamento de Anomalias:** Substituição de marcadores nulos (`#NULO#`, `#NE#`, `-1`, `-3`) por `NULL` nativo.
  * **Casting de Tipos:** Conversão explícita de strings de datas (`DD/MM/YYYY`) para tipo `Date`, valores monetários para `Numeric/Float` e identificadores para `Varchar/Integer`.

### Etapa 4: Camada de Staging
* **Descrição:** Carga dos dados limpos em tabelas temporárias/espelho no banco de dados.
* **Ferramenta:** PostgreSQL (`schema: staging`).
* **Objetivo:** Permitir a validação das regras de negócio e consultas preliminares via linguagem SQL sem impactar a camada de produção (DW).
* **Comportamento:** Carga automatizada via script Python, com recriação ou atualização controlada das tabelas.

### Etapa 5: Arquitetura de Banco de Dados (PostgreSQL)
O PostgreSQL atua como o motor relacional centralizado, estruturado em três schemas lógicos distintos:
1. `staging`: Área temporária de validação de dados limpos.
2. `dw`: Camada de consolidação histórica, modelada para análises eficientes (Star Schema / Snowflake).
3. `marts`: Camada de apresentação contendo Views e tabelas agregadas prontas para consumo final.

### Etapa 6: Data Warehouse e Data Marts
* **Descrição:** Estruturação dimensional focada na otimização de performance analítica.
* **Modelagem Dimensional:**
  * **Tabelas Dimensão (`dw.dim_*`):** Entidades de contexto descritivo (ex: `dim_candidato`, `dim_municipio`, `dim_eleicao`, `dim_partido`).
  * **Tabelas Fato (`dw.fato_*`):** Eventos quantitativos e acumuladores de métricas (ex: `fato_votacao_secao`, `fato_declaracao_bens`).
  * **Data Marts (`marts.vw_*`):** Views simplificadas e consolidadas por área temática (ex: `marts.vw_desempenho_partidario`, `marts.vw_perfil_candidatura`).

### Etapa 7: Visualização e Analytics (Power BI)
* **Descrição:** Camada de consumo executivo e exploração visual de dados.
* **Ferramentas:** Power BI Desktop / Power BI Service.
* **Conexão:** Conexão otimizada (Import Mode ou DirectQuery) apontando diretamente para as Views contidas no schema `marts` do PostgreSQL.
* **Responsabilidades no BI:** Construção do modelo visual de relacionamentos, cálculo de métricas de negócio via DAX e layout de navegação.

---

## 3. Matriz de Responsabilidades

| Camada | Entrada | Saída | Ferramenta Principais | Finalidade |
| :--- | :--- | :--- | :--- | :--- |
| **Ingestão** | Portal TSE | `data/raw/*.zip` | Python (`requests`) | Extração automatizada |
| **Tratamento** | `data/raw/` | `data/processed/*.parquet` | Python (`pandas`) | Limpeza, encoding e tipagem |
| **Staging** | `data/processed/` | `staging.stg_*` | PostgreSQL | Transição relacional |
| **Data Warehouse**| `staging.stg_*` | `dw.dim_*` / `dw.fato_*` | PostgreSQL (SQL) | Modelagem dimensional |
| **Data Marts** | `dw.*` | `marts.vw_*` | PostgreSQL (Views SQL) | Visões pré-agregadas |
| **BI / Dashboards**| `marts.vw_*` | Painéis Executivos | Power BI | Apresentação e relatórios |

---

## 4. Estrutura Padrão do Repositório de Código

O repositório do projeto segue a especificação abaixo:

```text
projeto-tse-dados/
├── .gitignore                    # Regras de exclusão do Git (ignora dados brutos e ambientes)
├── README.md                     # Visão geral do projeto e instruções de uso
├── docs/
│   └── arquitetura.md            # Especificação técnica da arquitetura (este documento)
├── data/                         # Diretório de dados (não versionado)
│   ├── raw/                      # Arquivos originais do TSE (.zip, .csv)
│   └── processed/                # Arquivos higienizados (.parquet)
├── scripts/                      # Códigos executáveis em Python
│   ├── ingestion/                # Automação de download e carga no staging
│   └── transformation/           # Tratamentos e regras de transformação
└── sql/                          # Scripts SQL
    ├── dw_schema/                # DDLs das tabelas Fato e Dimensão (Schema DW)
    └── marts/                    # DDLs das Views do Data Mart (Schema Marts)

