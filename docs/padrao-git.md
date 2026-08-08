# Padrão Git

## Branch estável

A branch `main` é a branch estável do projeto.

## Branches de trabalho

Cada alteração deve ser desenvolvida em uma branch associada à respectiva issue Jira:

```text
feature/ELEICOES-XX-descricao
fix/ELEICOES-XX-descricao
docs/ELEICOES-XX-descricao
```

- `feature/`: novas funcionalidades;
- `fix/`: correções;
- `docs/`: documentação e organização sem alteração funcional.

Use uma descrição curta, em letras minúsculas e separada por hífens.

## Commits

As mensagens de commit devem começar com a chave da issue Jira.

Exemplos:

```text
ELEICOES-8: organiza estrutura inicial do projeto
ELEICOES-11: adiciona coleta dos datasets TSE
ELEICOES-13: cria staging PostgreSQL
```

## Pull Requests

Alterações relevantes devem passar por Pull Request antes de serem integradas à `main`. O Pull Request deve identificar a issue Jira, explicar o objetivo da alteração e permitir revisão pela equipe.

O destino deve ser a `main`, a origem deve ser a branch da tarefa e o título deve seguir `ELEICOES-XX — Nome da tarefa`.

> **Merge requer autorização explícita do Gerente de Projeto.** Ninguém da equipe, incluindo o Cline, pode executar merge sem essa autorização.

Consulte o [fluxo oficial completo](fluxo-git-jira.md) para regras de status no Jira, revisão, correções, aprovação e encerramento.