# Guia prático de Git para tarefas e Pull Requests

Este guia mostra os comandos do fluxo diário para integrantes iniciantes do projeto **BI Eleições 2020 — São Paulo**. Substitua `ELEICOES-XX` e a descrição pelos dados reais da sua issue.

> Nunca desenvolva diretamente na `main`. Cada tarefa deve ter uma branch própria ligada ao Jira.

## 1. Antes de começar qualquer tarefa

No Jira, leia a issue, assuma a responsabilidade e mova-a de **A fazer** para **Fazendo**. Depois, atualize a `main`:

```bash
git checkout main
git pull origin main
```

Crie a branch:

```bash
git checkout -b feature/ELEICOES-XX-descricao
```

Exemplo:

```bash
git checkout -b feature/ELEICOES-14-eda-inicial
```

Confirme em qual branch você está:

```bash
git branch
```

O asterisco `*` deve aparecer ao lado da branch da tarefa, nunca ao lado da `main` durante o desenvolvimento.

## 2. Durante o desenvolvimento

Veja os arquivos alterados:

```bash
git status
```

Veja as diferenças em arquivos de texto:

```bash
git diff
```

Antes de adicionar qualquer arquivo, execute `git status` e confira se não há credenciais, segredos ou datasets pesados.

Quando possível, adicione somente os arquivos da entrega:

```bash
git add caminho/do/arquivo
```

Exemplo:

```bash
git add notebooks/01_eda_inicial.ipynb
```

Use `git add .` somente depois de conferir que todas as alterações listadas pertencem à tarefa:

```bash
git add .
```

## 3. Atualizar antes de um commit importante

Evite trabalhar sobre uma branch remota desatualizada:

```bash
git status
git branch
git fetch origin
```

Se a branch já existir no GitHub, atualize-a:

```bash
git pull origin NOME-DA-BRANCH
```

Exemplo:

```bash
git pull origin feature/ELEICOES-14-eda-inicial
```

No primeiro commit, a branch pode existir somente no computador. Nesse caso ainda não há branch remota para puxar; isso é normal e não é erro. O vínculo será criado no primeiro push com `-u`.

## 4. Fazer o commit

Confira, adicione e confira novamente:

```bash
git status
git add .
git status
git commit -m "ELEICOES-XX: descrição"
```

Exemplo:

```bash
git commit -m "ELEICOES-14: adiciona análise exploratória inicial"
```

Não use mensagens vagas como `teste`, `update`, `final`, `coisas` ou `mudança`.

## 5. Antes de todo push

Confira o estado local e busque as referências remotas:

```bash
git status
git fetch origin
```

Se a branch já existir no remoto:

```bash
git pull origin NOME-DA-BRANCH
git push
```

No primeiro push:

```bash
git push -u origin NOME-DA-BRANCH
```

Exemplo:

```bash
git push -u origin feature/ELEICOES-14-eda-inicial
```

## 6. Sincronizar com a main antes da Pull Request

Esta etapa é obrigatória antes de abrir a PR. Primeiro, confirme que a branch está limpa:

```bash
git status
```

Se houver alterações ainda não registradas, faça o commit antes de trocar de branch. Depois:

```bash
git checkout main
git pull origin main
git checkout feature/ELEICOES-XX-descricao
git merge main
```

Se não houver conflito, teste novamente e faça push:

```bash
git push
```

Se houver conflito, não escolha alterações aleatoriamente. Resolva corretamente ou peça ajuda ao Gerente de Projeto ou a outro integrante. Depois de resolver:

```bash
git add .
git commit -m "ELEICOES-XX: resolve conflitos com main"
git push
```

Somente então abra a Pull Request.

## 7. Cola rápida para abrir uma PR

### Passo 1

```bash
git checkout main
```

### Passo 2

```bash
git pull origin main
```

### Passo 3

```bash
git checkout -b feature/ELEICOES-XX-descricao
```

### Passo 4

Desenvolva a tarefa.

### Passo 5

```bash
git status
```

### Passo 6

```bash
git fetch origin
```

### Passo 7

```bash
git add .
```

### Passo 8

```bash
git commit -m "ELEICOES-XX: descrição"
```

### Passo 9

```bash
git push -u origin feature/ELEICOES-XX-descricao
```

### Passo 10 — antes da PR

```bash
git checkout main
git pull origin main
git checkout feature/ELEICOES-XX-descricao
git merge main
```

### Passo 11

Teste novamente.

### Passo 12

```bash
git push
```

### Passo 13

Abra a Pull Request no GitHub:

- destino: `main`;
- origem: `feature/ELEICOES-XX-descricao`.

## 8. Abrir a Pull Request

Use o título:

```text
ELEICOES-XX — Nome da tarefa
```

Exemplo:

```text
ELEICOES-14 — Realizar EDA inicial dos resultados eleitorais
```

Preencha o template, copie o link da PR, mova o Jira de **Fazendo** para **Em análise** e comente:

```text
Desenvolvimento concluído.

Branch:
feature/ELEICOES-XX-descricao

PR:
LINK_DA_PR

Aguardando revisão.
```

O Gerente definirá outro integrante como revisor.

## 9. Corrigir uma revisão reprovada

Se houver correções, a PR continua aberta e o Jira volta de **Em análise** para **Fazendo**. Não crie outra branch. Corrija na mesma branch:

```bash
git status
git add .
git commit -m "ELEICOES-XX: corrige apontamentos da revisão"
git pull origin NOME-DA-BRANCH
git push
```

Depois, mova o Jira de **Fazendo** para **Em análise**. O mesmo revisor verificará novamente.

## 10. Comandos proibidos ou perigosos

> **Nunca execute `git push --force` sem autorização do Gerente de Projeto.**

Também não use comandos destrutivos sem entender exatamente o efeito e sem pedir ajuda:

```bash
git reset --hard
git clean -fd
git checkout -- .
```

Esses comandos não fazem parte do fluxo normal da equipe e podem apagar trabalho local.

## 11. Aprovação e merge

Se o revisor aprovar, a issue permanece **Em análise**, na condição de aguardando merge. Alexandre deve autorizar explicitamente. O autor, o revisor e o Cline não devem interpretar silêncio como autorização nem realizar merge antes dessa resposta.

Somente após confirmar que a PR foi realmente integrada à `main`, o revisor ou o Gerente pode mover a issue para **Feito**.
