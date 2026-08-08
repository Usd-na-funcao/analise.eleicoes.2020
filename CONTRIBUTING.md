# Como contribuir

As tarefas deste projeto são gerenciadas no Jira **ELEICOES**. Não crie GitHub Issues.

## Fluxo resumido

1. Assuma a issue e mova-a de **A fazer** para **Fazendo**.
2. Atualize a `main` e crie `feature/ELEICOES-XX-descricao`, `fix/ELEICOES-XX-descricao` ou `docs/ELEICOES-XX-descricao`.
3. Nunca trabalhe diretamente na `main`.
4. Faça commits pequenos no formato `ELEICOES-XX: descrição`.
5. Faça push e abra uma PR para a `main` com o título `ELEICOES-XX — Nome da tarefa`.
6. Preencha o template, valide os critérios e mova a issue para **Em análise**.
7. O Gerente define outro integrante como revisor; a regra obrigatória é `AUTOR != REVISOR`.
8. Se houver correções, a issue volta para **Fazendo**; o autor corrige na mesma branch e devolve para **Em análise**.
9. Se a revisão for aprovada, a issue permanece **Em análise** aguardando autorização de Alexandre.
10. Ninguém, incluindo o Cline, pode executar merge sem autorização explícita do Gerente de Projeto.
11. Somente após o merge confirmado a issue pode ser movida para **Feito**.

Antes de cada commit, execute `git status`. Nunca versione credenciais, segredos ou datasets pesados. Não use `git push --force` sem autorização do Gerente de Projeto.

Consulte o [guia prático de Git](docs/guia-git-pratico.md), o [guia rápido da equipe](docs/guia-equipe.md) e o [fluxo oficial completo](docs/fluxo-git-jira.md).
