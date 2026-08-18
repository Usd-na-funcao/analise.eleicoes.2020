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


