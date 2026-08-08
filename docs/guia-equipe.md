# Guia rápido da equipe

Versão resumida para quem está começando. O processo completo está em [fluxo-git-jira.md](fluxo-git-jira.md), e os comandos passo a passo estão no [guia prático de Git](guia-git-pratico.md).

## Começando uma tarefa

1. Abra sua tarefa no Jira.
2. Leia a descrição e os critérios de aceitação.
3. Assuma a tarefa e coloque-a em **Fazendo**.
4. Atualize sua `main` local.
5. Crie uma branch com o ID `ELEICOES-XX`.
6. Desenvolva sem trabalhar diretamente na `main`.
7. Faça commits pequenos e descritivos.
8. Faça push da branch.
9. Abra uma PR da branch da tarefa para a `main`.
10. Verifique os critérios, preencha a PR e coloque o Jira em **Em análise**.
11. O Gerente define outro integrante como revisor.
12. Se houver correção, volte para **Fazendo**, corrija na mesma branch e retorne para **Em análise**.
13. Aguarde a autorização explícita do Gerente de Projeto.
14. O merge só pode ocorrer depois dessa autorização.
15. Somente após o merge confirmado, mova o Jira para **Feito**.

## Comandos principais

Atualize a `main` e crie a branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/ELEICOES-XX-descricao
```

Outros prefixos permitidos:

```text
fix/ELEICOES-XX-descricao
docs/ELEICOES-XX-descricao
```

Confira, prepare e registre as alterações:

```bash
git status
git add .
git status
git commit -m "ELEICOES-XX: descrição"
```

Primeiro push:

```bash
git push -u origin nome-da-branch
```

Pushs seguintes:

```bash
git push
```

Não use `git push --force` sem razão técnica excepcional e autorização do Gerente de Projeto.

## Pull Request e Jira

- Destino da PR: `main`.
- Origem: branch da tarefa.
- Título: `ELEICOES-XX — Nome da tarefa`.
- Preencha o template, informe como testar e adicione evidências.
- Use `ELEICOES-XX` na branch, nos commits, na PR e no comentário do Jira.
- Não crie GitHub Issues; as tarefas são gerenciadas no Jira.

## Regra de merge

> Merge requer autorização explícita do Gerente de Projeto. O autor, o revisor e o Cline devem parar e pedir autorização quando a PR estiver pronta. Somente depois do merge confirmado a issue pode ir para **Feito**.
