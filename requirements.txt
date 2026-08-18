# 📊 Requisitos do BI — Eleições Municipais de 2020 em São Paulo

> **Status:** 🟡 Rascunho para revisão  
> **Versão:** `0.1`  
> **Escopo:** Município de São Paulo (capital) · Eleições Municipais de 2020 · 1º e 2º turnos, quando aplicável  
> **Artefato:** `/docs/requisitos-bi.md`  
> **Issue:** a preencher

---

## 📌 Sumário

- [Objetivo](#-objetivo)
- [Pergunta principal](#-pergunta-principal)
- [Perguntas secundárias](#-perguntas-secundárias)
- [KPIs candidatos](#-kpis-candidatos)
- [Fontes oficiais](#-fontes-oficiais)
- [Granularidade](#-granularidade)
- [Escopo funcional](#-escopo-funcional)
- [Restrições](#-restrições)
- [Qualidade e validação](#-qualidade-e-validação)
- [Entregáveis](#-entregáveis)
- [Versionamento](#-versionamento)
- [Pontos em aberto](#-pontos-em-aberto)

---

## 🎯 Objetivo

Definir os requisitos iniciais de um **BI para análise das Eleições Municipais de 2020 no município de São Paulo**, com foco em:

- resultados para **prefeito e vereador**;
- participação eleitoral;
- candidaturas;
- distribuição de votos;
- análise por partido/legenda;
- análise territorial, quando suportada pelos dados oficiais.

O BI deverá priorizar:

> **Transparência · Rastreabilidade · Reprodutibilidade**

Os resultados deverão ser reproduzíveis a partir de **dados oficiais da Justiça Eleitoral**.

### Fora do escopo

- ❌ Outras eleições;
- ❌ Outros municípios;
- ❌ Análises causais não sustentadas pelos dados;
- ❌ Inferências além do que as fontes oficiais permitem afirmar.

---

## ❓ Pergunta principal

> **Como se distribuíram os votos e a participação eleitoral nas Eleições Municipais de 2020 no município de São Paulo, considerando prefeito e vereador e os diferentes níveis de agregação disponíveis nos dados oficiais?**

---

## 🔎 Perguntas secundárias

| # | Pergunta |
|---|---|
| **01** | Quais foram os resultados dos candidatos a prefeito no 1º e no 2º turno? |
| **02** | Como se distribuíram os votos válidos entre candidatos e partidos/legendas? |
| **03** | Como foram o comparecimento e a abstenção eleitoral? |
| **04** | Como os resultados de vereador se distribuíram entre candidatos e partidos/legendas? |
| **05** | Como os resultados variam entre zonas e seções eleitorais? |
| **06** | Quantas candidaturas participaram do pleito e como se distribuíram por cargo e partido? |
| **07** | Quais dimensões do eleitorado podem ser relacionadas aos resultados sem extrapolar os dados disponíveis? |

---

## 📈 KPIs candidatos

> ⚠️ **Importante:** os indicadores abaixo são candidatos a KPI.  
> Fórmulas, denominadores, filtros e dimensões deverão ser validados antes da implementação.

| KPI | Descrição | Fonte |
|---|---|---|
| **Votos por candidato** | Quantidade de votos atribuída a cada candidato | TSE |
| **Participação de votos** | Participação de um candidato no conjunto de votos considerado | TSE |
| **Votos por partido/legenda** | Quantidade de votos registrada para partido/legenda | TSE |
| **Comparecimento** | Quantidade de eleitores que compareceram | TSE / TRE-SP |
| **Abstenção** | Quantidade de eleitores que não compareceram | TSE / TRE-SP |
| **Candidaturas por cargo** | Quantidade de candidaturas registradas | TSE |
| **Vagas por partido** | Quantidade de vagas de vereador distribuídas/ocupadas | TRE-SP |

### Critérios para definição dos KPIs

Cada KPI deverá possuir:

- definição funcional;
- fórmula;
- denominador, quando aplicável;
- filtros;
- dimensões;
- granularidade;
- fonte de origem;
- regras de tratamento;
- regra de validação;
- exemplo de cálculo.

---

## 🏛️ Fontes oficiais

### Tribunal Superior Eleitoral — TSE

| Fonte | Finalidade |
|---|---|
| [Eleições 2020](https://www.tse.jus.br/eleicoes/resultados-eleicoes/eleicoes-2020) | Resultados oficiais |
| [Dados Abertos — Resultados 2020](https://dados.gov.br/dados/conjuntos-dados/resultados-2020) | Bases para processamento e análise |
| [Eleições 2020 — informações e serviços](https://www.tse.jus.br/eleicoes/eleicoes-2020) | Informações complementares |

O TSE disponibiliza resultados, estatísticas e dados abertos, incluindo informações de votação nominal, partidos, municípios, zonas e seções eleitorais.

### Tribunal Regional Eleitoral de São Paulo — TRE-SP

| Fonte | Finalidade |
|---|---|
| [Eleições 2020](https://www.tre-sp.jus.br/eleicoes/eleicoes-anteriores/eleicoes-2020) | Resultados e informações do pleito |
| [Estatísticas](https://www.tre-sp.jus.br/eleicoes/estatisticas) | Estatísticas eleitorais |
| [Consulta de dados eleitorais](https://www.tre-sp.jus.br/servicos-eleitorais/carta-de-servicos/consulta-dados-eleitorais-e-documentos-historicos) | Dados e documentos históricos |

> **Fonte primária:** Justiça Eleitoral  
> **Fontes prioritárias:** TSE e TRE-SP

---

## 🧩 Granularidade

A granularidade abaixo é uma **hipótese inicial de modelagem** e deverá ser validada após a inspeção dos arquivos oficiais.

### Nível consolidado

```text
Eleição
  └── Turno
      └── Município
          └── Cargo
              └── Candidato / Partido
