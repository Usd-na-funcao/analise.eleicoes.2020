# Requisitos do BI — Eleições Municipais de 2020 em São Paulo

> Documento de requisitos para o desenvolvimento do BI de análise das Eleições Municipais de 2020 no município de São Paulo.

| Informação | Valor |
|---|---|
| **Versão** | `0.1` |
| **Status** | Em revisão |
| **Escopo** | Eleições Municipais de 2020 |
| **Abrangência** | Município de São Paulo (capital) |
| **Turnos** | 1º e 2º, quando aplicável |
| **Artefato** | `/docs/requisitos-bi.md` |
| **Issue** | A definir |

---

## Sumário

- [1. Objetivo](#1-objetivo)
- [2. Escopo](#2-escopo)
- [3. Stakeholders](#3-stakeholders)
- [4. Perguntas de negócio](#4-perguntas-de-negócio)
- [5. Indicadores](#5-indicadores)
- [6. Fontes de dados](#6-fontes-de-dados)
- [7. Granularidade](#7-granularidade)
- [8. Regras e restrições](#8-regras-e-restrições)
- [9. Qualidade e validação](#9-qualidade-e-validação)
- [10. Entregáveis](#10-entregáveis)
- [11. Controle de versão](#11-controle-de-versão)
- [12. Pontos em aberto](#12-pontos-em-aberto)

---

## 1. Objetivo

Definir os requisitos iniciais para o desenvolvimento de um **BI de análise das Eleições Municipais de 2020 no município de São Paulo**, utilizando dados oficiais da Justiça Eleitoral.

O BI deverá permitir a análise de:

- resultados para prefeito;
- resultados para vereador;
- votação por candidato;
- votação por partido ou legenda;
- comparecimento e abstenção;
- candidaturas;
- distribuição territorial dos resultados, quando suportada pelos dados oficiais.

### Princípios

O projeto deverá priorizar:

- **Transparência** — utilização de fontes oficiais;
- **Rastreabilidade** — identificação da origem dos dados e dos indicadores;
- **Reprodutibilidade** — possibilidade de reproduzir os resultados;
- **Consistência** — validação dos dados contra os resultados oficiais.

---

## 2. Escopo

### 2.1 Incluído

O BI contemplará exclusivamente:

- **Eleição:** Eleições Municipais de 2020;
- **Localidade:** município de São Paulo (capital);
- **Cargos:** prefeito e vereador;
- **Turnos:** 1º e 2º turnos, quando aplicável;
- **Granularidade:** município e, quando validada, zona e seção eleitoral.

### 2.2 Fora do escopo

Não fazem parte da primeira versão:

- Eleições de 2016;
- Eleições de 2022;
- Eleições de 2024;
- outros municípios;
- outros pleitos eleitorais;
- análises causais não sustentadas pelos dados disponíveis.

---

## 3. Stakeholders

| Stakeholder | Responsabilidade |
|---|---|
| **Analista de Dados / BI** | Exploração, tratamento, modelagem, validação e visualização dos dados. |
| **Gestor / Solicitante** | Validação das perguntas, prioridades e interpretação dos indicadores. |
| **Usuário Final / Consultor Eleitoral** | Consulta e análise dos resultados eleitorais. |
| **Equipe Técnica / Revisão** | Qualidade, documentação, versionamento e segurança. |

---

## 4. Perguntas de negócio

### 4.1 Pergunta principal

> **Como se distribuíram os votos e a participação eleitoral nas Eleições Municipais de 2020 no município de São Paulo, considerando prefeito, vereador e os diferentes níveis de agregação disponíveis nos dados oficiais?**

### 4.2 Perguntas secundárias

1. Quais foram os resultados dos candidatos a prefeito no 1º e no 2º turno?
2. Como os votos válidos se distribuíram entre os candidatos?
3. Como os votos se distribuíram entre partidos e legendas?
4. Qual foi o comparecimento e a abstenção eleitoral?
5. Como os resultados de vereador se distribuíram entre candidatos e partidos?
6. Como os resultados variaram entre zonas e seções eleitorais?
7. Quantas candidaturas participaram do pleito?
8. Como as candidaturas se distribuíram por cargo e partido?
9. Quais dimensões do eleitorado podem ser relacionadas aos resultados sem extrapolar o que os dados oficiais permitem afirmar?

---

## 5. Indicadores

> Os indicadores abaixo são **candidatos a KPI**. As fórmulas, denominadores, filtros e dimensões deverão ser validados antes da implementação.

| Indicador | Descrição | Fonte |
|---|---|---|
| **Votos por candidato** | Quantidade de votos atribuída a cada candidato. | TSE |
| **Participação de votos** | Participação de um candidato no conjunto de votos considerado. | TSE |
| **Votos por partido/legenda** | Quantidade de votos registrada para partido ou legenda. | TSE |
| **Comparecimento** | Quantidade de eleitores que compareceram à votação. | TSE / TRE-SP |
| **Abstenção** | Quantidade de eleitores que não compareceram à votação. | TSE / TRE-SP |
| **Candidaturas por cargo** | Quantidade de candidaturas registradas por cargo. | TSE |
| **Vagas por partido** | Quantidade de vagas de vereador distribuídas ou ocupadas por partido. | TRE-SP |

### 5.1 Requisitos para cada indicador

Antes da implementação, cada indicador deverá possuir:

- definição de negócio;
- fórmula de cálculo;
- denominador, quando aplicável;
- filtros;
- dimensões;
- granularidade;
- fonte de origem;
- regra de tratamento;
- regra de validação.

---

## 6. Fontes de dados

### 6.1 Tribunal Superior Eleitoral — TSE

| Fonte | Utilização |
|---|---|
| [Eleições 2020](https://www.tse.jus.br/eleicoes/resultados-eleicoes/eleicoes-2020) | Consulta aos resultados oficiais. |
| [Dados Abertos — Resultados 2020](https://dados.gov.br/dados/conjuntos-dados/resultados-2020) | Obtenção dos dados para processamento. |
| [Eleições 2020](https://www.tse.jus.br/eleicoes/eleicoes-2020) | Informações e serviços relacionados ao pleito. |

Os dados do TSE incluem informações de votação, candidatos, partidos, municípios, zonas e seções eleitorais, conforme a disponibilidade de cada conjunto.

### 6.2 Tribunal Regional Eleitoral de São Paulo — TRE-SP

| Fonte | Utilização |
|---|---|
| [Eleições 2020](https://www.tre-sp.jus.br/eleicoes/eleicoes-anteriores/eleicoes-2020) | Resultados e informações do pleito em São Paulo. |
| [Estatísticas](https://www.tre-sp.jus.br/eleicoes/estatisticas) | Estatísticas eleitorais. |
| [Consulta de dados eleitorais](https://www.tre-sp.jus.br/servicos-eleitorais/carta-de-servicos/consulta-dados-eleitorais-e-documentos-historicos) | Dados e documentos históricos. |

> **Fonte primária do projeto:** Justiça Eleitoral, prioritariamente TSE e TRE-SP.

---

## 7. Granularidade

A granularidade abaixo representa uma **hipótese inicial de modelagem**. A definição definitiva deverá ocorrer após a inspeção dos arquivos oficiais.

### 7.1 Nível consolidado

```text
Eleição
└── Turno
    └── Município
        └── Cargo
            └── Candidato / Partido
