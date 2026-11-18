# Especificação Técnica de KPIs e Medidas (Power BI)

Este documento define as regras de negócio e as fórmulas em DAX para a construção das medidas no Power BI, garantindo consistência analítica em todas as páginas do relatório.

---

## 1. Métricas de Volume e Participação

### Total de Votos Válidos
* **Regra de Negócio:** Soma de todos os votos nominais e de legenda, desconsiderando votos brancos, nulos e abstenções.
* **Fórmula DAX:**
  ```dax
  Total Votos Validos = 
  CALCULATE(
      SUM(fVotacao[qtd_votos]),
      fVotacao[tipo_voto] = "Válido"
  )

# 🗳️ Análise de Dados Eleitorais — São Paulo 2020



---

## 📌 Sobre o Projeto

Este projeto tem como objetivo explorar, tratar e analisar os dados das **Eleições Municipais de 2020 no estado de São Paulo**, transformando dados eleitorais públicos em informações relevantes para análise e visualização.

A proposta é desenvolver uma solução analítica que permita compreender o comportamento eleitoral, identificar padrões e construir indicadores que apoiem a interpretação dos resultados.

---

## 🎯 Objetivos

- Explorar os dados eleitorais disponibilizados pelo Tribunal Superior Eleitoral (TSE);
- Realizar processos de limpeza e preparação dos dados;
- Identificar padrões e tendências nos resultados eleitorais;
- Desenvolver indicadores (KPIs) para análise;
- Construir visualizações e dashboards interativos;
- Aplicar conceitos de análise de dados e Business Intelligence.

---

## 📊 Escopo

| Item             | Descrição                              |
| ---------------- | -------------------------------------- |
| 📍 Localidade    | Estado de São Paulo                    |
| 📅 Ano eleitoral | 2020                                   |
| 🏛️ Eleição      | Municipal                              |
| 🗳️ Fonte        | Tribunal Superior Eleitoral (TSE)      |
| 📈 Área          | Data Analytics & Business Intelligence |

---

## 🔄 Etapas do Projeto

| Etapa | Descrição                                | Status |
| ----- | ---------------------------------------- | ------ |
| 01    | Obtenção dos dados oficiais              | 🔄     |
| 02    | Inspeção e exploração dos dados          | 🔄     |
| 03    | Criação de amostras para desenvolvimento | 🔄     |
| 04    | Limpeza e preparação dos dados           | ⏳      |
| 05    | Modelagem e definição dos indicadores    | ⏳      |
| 06    | Análise exploratória                     | ⏳      |
| 07    | Desenvolvimento dos dashboards           | ⏳      |
| 08    | Documentação dos resultados              | ⏳      |

---

## 🛠️ Tecnologias e Ferramentas

- **Python** — Manipulação e análise de dados
- **Pandas** — Tratamento de dados
- **Jupyter Notebook** — Exploração e experimentação
- **SQL** — Consultas e análise de dados
- **Power BI** — Visualização e construção de dashboards
- **Git & GitHub** — Versionamento e documentação

---

## 📂 Estrutura do Projeto

```text
├── data/
│   ├── raw/          # Dados originais
│   ├── samples/      # Amostras para desenvolvimento
│   └── processed/    # Dados tratados
├── notebooks/        # Análises exploratórias
├── src/             # Scripts de processamento
├── dashboards/       # Dashboards e visualizações
├── docs/            # Documentação do projeto
└── README.md
```

---

## 📈 Indicadores e Análises

O projeto busca desenvolver análises relacionadas a:

- Distribuição de votos por candidato;
- Desempenho eleitoral por município;
- Comparativo entre candidatos e partidos;
- Participação eleitoral;
- Abstenções, votos brancos e nulos;
- Distribuição geográfica dos resultados.

*Os indicadores e análises serão definidos e validados conforme a disponibilidade, estrutura e consistência dos dados oficiais.*

---

## 📚 Fonte dos Dados

Os dados utilizados neste projeto são provenientes de fontes públicas e oficiais do **Tribunal Superior Eleitoral (TSE)**.

🔗 [Portal de Dados Abertos do TSE](https://dadosabertos.tse.jus.br/)

---

## 🚧 Status do Desenvolvimento

O projeto encontra-se em fase de desenvolvimento, passando pelas etapas de coleta, exploração, preparação e estruturação dos dados.

Novas análises, indicadores e visualizações serão adicionados progressivamente.

---

## 👨‍💻 Autor

Desenvolvido como projeto de estudo e portfólio na área de **Análise de Dados, Business Intelligence e Visualização de Dados**.

