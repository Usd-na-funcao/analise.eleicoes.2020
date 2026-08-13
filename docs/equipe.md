# Equipe

Projeto: BI Eleições 2020 — São Paulo
Equipe: Usd Na Função

## P1 — Alexandre Leone Souza da Cruz
### Gerente de Projeto / Scrum Master

Responsabilidades:

- administrar o Jira;
- planejar e acompanhar as Sprints;
- distribuir e acompanhar tarefas;
- acompanhar prazos e entregas;
- identificar e gerenciar bloqueios;
- organizar o fluxo de trabalho da equipe;
- acompanhar o GitHub e Pull Requests;
- coordenar a integração entre Banco, EDA e Power BI;
- acompanhar a arquitetura geral do projeto;
- revisar documentação e entregas;
- conduzir reuniões e Sprint Reviews.

---

## P2 — Maria Eduarda Mendes de Souza
### Engenheira de Dados

Responsabilidades:

- modelagem de banco de dados;
- PostgreSQL / SQL;
- criação da camada de staging;
- definição de PKs e FKs;
- Data Warehouse;
- Data Mart;
- modelagem dimensional;
- tabelas fato e dimensão;
- suporte ao pipeline ETL;
- validação e qualidade dos dados;
- documentação da estrutura de dados.

---

## P3 — Murilo Maggio Faria
### Analista de Dados

Responsabilidades:

- Python;
- Jupyter Notebook;
- Pandas;
- NumPy;
- análise exploratória de dados (EDA);
- estatística descritiva;
- análise de dados ausentes;
- análise de outliers;
- criação de gráficos;
- correlação;
- regressão linear;
- interpretação dos resultados;
- produção dos insights estatísticos.

---

## P4 — Nicholas Alves do Amaral
### Desenvolvedor BI

Responsabilidades:

- Power BI;
- conexão com o Data Mart;
- Power Query;
- modelagem no Power BI;
- relacionamentos;
- medidas DAX;
- criação dos dashboards;
- filtros e segmentações;
- drill-through;
- tooltips;
- visualizações;
- desenvolvimento das páginas finais do BI.

---

## P5 — Lucas Sena Marcelo
### Analista de BI

Responsabilidades:

- definição e validação dos KPIs;
- levantamento das perguntas de negócio;
- interpretação dos indicadores;
- análise dos resultados do Power BI;
- validação do dashboard;
- apoio na definição das visualizações;
- identificação de insights;
- storytelling com dados;
- documentação funcional;
- apoio na apresentação final.

---

## P6 — Luigi
### QA / Quality Assurance

Responsabilidades:

- validar as entregas realizadas pelos integrantes;
- conferir os critérios de aceitação da issue Jira;
- revisar as evidências, testes e validações apresentados;
- confirmar se os arquivos esperados foram enviados corretamente para a branch e para a Pull Request;
- depois do merge, confirmar se a entrega foi integrada corretamente à `main`;
- verificar se não há arquivos esperados ausentes nem arquivos indevidos no repositório;
- registrar no Jira o resultado da validação;
- solicitar correções quando a entrega não estiver correta;
- mover a issue para **Feito** somente após a PR estar revisada, o merge ser explicitamente autorizado pelo Gerente de Projeto e a integração na `main` estar confirmada.

O QA não autoriza merge e não deve mover uma issue para **Feito** apenas porque o desenvolvimento ou a revisão terminou. Se encontrar um problema, deve registrar o resultado e devolver a entrega para correção conforme o fluxo oficial.

---

# Organização

A equipe utiliza:

- Jira para gerenciamento do projeto;
- GitHub para versionamento;
- Scrum com Sprints semanais;
- Discord para comunicação.

## Fluxo de trabalho

1. A tarefa é planejada no Jira.
2. Um responsável assume a tarefa.
3. O status é alterado de **A fazer** para **Fazendo**.
4. O desenvolvimento é realizado em branch própria.
5. O código/documentação é enviado ao GitHub.
6. Uma Pull Request é aberta e a tarefa passa para **Em análise**.
7. É realizada a revisão e as correções necessárias.
8. O merge aguarda autorização explícita do Gerente de Projeto.
9. Após o merge, o QA confirma se a entrega e os arquivos esperados foram integrados corretamente à `main`.
10. Somente depois dessa validação, o QA move a tarefa para **Feito** no Jira.

O fluxo detalhado, incluindo responsabilidades do autor, revisor e Gerente de Projeto, está em [fluxo-git-jira.md](fluxo-git-jira.md).

## Padrão de Branch

```text
feature/ELEICOES-XX-descricao
fix/ELEICOES-XX-descricao
docs/ELEICOES-XX-descricao
```