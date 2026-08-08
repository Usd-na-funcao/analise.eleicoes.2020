# Fluxo oficial de trabalho com Jira, Git e GitHub

Este documento define o processo oficial do projeto **BI Eleições 2020 — São Paulo**. O Jira é a fonte de verdade para planejamento e status; o GitHub é usado para versionamento, Pull Requests (PRs) e revisão. Não são usadas GitHub Issues para gerenciar tarefas.

> **Regra absoluta de merge:** ninguém da equipe, incluindo o Cline, deve executar merge de Pull Request sem autorização explícita do Gerente de Projeto. Silêncio, ausência de resposta ou mensagens como “ok, vou ver” não são autorização.

## Fluxo oficial no Jira

```text
A fazer
   ↓
Fazendo
   ↓
Em análise
   ↓ ↑
   │ └── retorna para Fazendo quando houver correções
   ↓
Feito
```

O Jira possui somente os quatro status acima. **Aguardando merge** é uma condição dentro de **Em análise**, e não um status adicional.

### A fazer

Significa que a tarefa está planejada e ainda não foi iniciada. Deve possuir, quando possível, responsável definido, critérios de aceitação claros e Sprint definida. Ninguém deve iniciar o desenvolvimento sem assumir a tarefa.

Antes de começar:

1. abrir a issue no Jira;
2. ler a descrição;
3. ler os critérios de aceitação;
4. conferir dependências;
5. atribuir a tarefa ao integrante responsável;
6. mudar o status de **A fazer** para **Fazendo**;
7. somente então começar o desenvolvimento.

### Fazendo

Significa que a tarefa está realmente sendo executada. Deve existir um responsável e uma branch específica. Os commits devem mencionar a issue Jira.

Primeiro, atualize a `main` local:

```bash
git checkout main
git pull origin main
```

Depois, crie a branch da tarefa. Nunca trabalhe diretamente na `main`.

Padrões:

```text
feature/ELEICOES-XX-descricao
fix/ELEICOES-XX-descricao
docs/ELEICOES-XX-descricao
```

Exemplos:

```text
feature/ELEICOES-13-staging-postgresql
feature/ELEICOES-14-eda-inicial
docs/ELEICOES-9-requisitos-bi
fix/ELEICOES-20-correcao-etl
```

Use `feature/` para funcionalidade, `fix/` para correção e `docs/` para documentação. A descrição deve ser curta, em letras minúsculas e separada por hífens.

### Em análise

Significa que o desenvolvimento terminou, há uma Pull Request aberta e **outra pessoa** está revisando. A tarefa ainda não está concluída e não deve ser marcada como **Feito**.

A mudança de **Fazendo** para **Em análise** só ocorre quando:

- o desenvolvimento estiver concluído;
- a branch estiver no GitHub;
- a PR estiver aberta;
- os critérios de aceitação tiverem sido verificados pelo autor;
- não houver erros conhecidos bloqueantes;
- a documentação necessária estiver atualizada;
- a PR estiver pronta para outra pessoa revisar.

Comentário sugerido no Jira:

```text
Implementação concluída.

Branch:
feature/ELEICOES-XX-descricao

Pull Request:
#XX

Aguardando revisão.
```

### Feito

Significa que a entrega foi revisada, teve merge explicitamente autorizado pelo Gerente de Projeto e foi integrada à `main`. Uma issue só pode ser marcada como **Feito** quando todos os itens forem atendidos:

- [ ] critérios de aceitação atendidos;
- [ ] implementação concluída;
- [ ] Pull Request revisada;
- [ ] merge aprovado pelo Gerente de Projeto;
- [ ] merge realizado na `main`;
- [ ] documentação atualizada;
- [ ] testes ou validações realizados;
- [ ] nenhuma pendência bloqueante;
- [ ] evidências adicionadas quando aplicável.

Se qualquer condição estiver pendente, a issue não deve ir para **Feito**.

## Commits

Faça commits pequenos e descritivos. Vários commits pequenos são aceitáveis e facilitam a revisão.

Formato:

```text
ELEICOES-XX: descrição
```

Exemplos:

```text
ELEICOES-13: cria tabelas da camada staging
ELEICOES-14: adiciona análise descritiva inicial
ELEICOES-20: implementa transformação do pipeline ETL
ELEICOES-27: adiciona página de visão geral do dashboard
```

Evite mensagens vagas como `update`, `teste`, `mudanças`, `arrumei`, `final` ou `coisas`.

## Conferência, commit e push

Depois do desenvolvimento:

```bash
git add .
git status
git commit -m "ELEICOES-XX: descrição"
```

O `git status` deve ser conferido antes do commit para garantir que somente arquivos esperados serão enviados.

No primeiro push da branch:

```bash
git push -u origin nome-da-branch
```

Nos pushes seguintes:

```bash
git push
```

Nunca use `git push --force`, salvo razão técnica excepcional e autorização do Gerente de Projeto.

## Pull Request

Quando a tarefa estiver pronta:

1. faça push da branch;
2. abra uma Pull Request;
3. selecione `main` como destino;
4. selecione a branch da tarefa como origem;
5. use o título `ELEICOES-XX — Nome da tarefa`;
6. preencha todo o template da PR;
7. relacione a PR no comentário da issue Jira;
8. mova a issue para **Em análise** somente após cumprir os critérios dessa etapa.

Exemplo de título:

```text
ELEICOES-13 — Criar camada de staging no PostgreSQL
```

## Revisão em Em análise

Ao mover uma tarefa de **Fazendo** para **Em análise**, o Gerente de Projeto deve definir um revisor que não seja o autor. Neste projeto:

- **AUTOR:** pessoa que desenvolveu a tarefa;
- **REVISOR:** outro integrante que verifica a entrega;
- **GERENTE:** Alexandre, responsável pela escolha do revisor e pela autorização final do merge.

Quem desenvolveu uma tarefa não pode ser seu único revisor. A regra obrigatória é **AUTOR != REVISOR**.

Fluxo de entrada na revisão:

```text
Autor termina
   ↓
abre a PR
   ↓
Jira → Em análise
   ↓
Gerente define outro integrante como revisor
   ↓
Revisor analisa
```

Checklist do revisor:

- [ ] Issue Jira lida
- [ ] Critérios de aceitação lidos
- [ ] PR lida
- [ ] Código e documentação revisados
- [ ] Dados validados
- [ ] Testes executados quando possível
- [ ] Nenhuma credencial adicionada
- [ ] Nenhum dataset pesado enviado
- [ ] Resultado faz sentido
- [ ] Documentação atualizada

Durante a revisão, verifique o que for aplicável à entrega.

### Código

- lógica;
- legibilidade;
- organização;
- erros.

### Dados

- consistência;
- quantidade de registros;
- valores inesperados;
- qualidade.

### SQL

- consultas;
- chaves primárias e estrangeiras;
- relacionamentos;
- performance, quando relevante.

### EDA

- cálculos;
- gráficos;
- interpretação;
- conclusões.

### Power BI

- relacionamentos;
- DAX;
- filtros;
- indicadores;
- valores.

### Documentação

- README;
- arquivos em `docs/`;
- instruções;
- evidências.

## Correções solicitadas na revisão

Se o revisor encontrar qualquer problema:

1. a PR continua aberta;
2. o revisor comenta **“Alterações solicitadas.”** e explica claramente cada correção;
3. a issue retorna de **Em análise** para **Fazendo**;
4. o autor corrige na mesma branch, sem criar outra branch;
5. o autor faz commit, atualiza a branch remota e faz push;
6. ao concluir, a issue volta de **Fazendo** para **Em análise**;
7. o mesmo revisor verifica novamente.

```text
Em análise
   ↓
Fazendo
   ↓
corrigir na mesma branch + commit + push
   ↓
Em análise
```

Exemplo:

```bash
git add .
git status
git commit -m "ELEICOES-XX: corrige apontamentos da revisão"
git pull origin NOME-DA-BRANCH
git push
```

A Pull Request será atualizada automaticamente.

## Revisão aprovada

Se a entrega estiver correta, o revisor deve:

1. confirmar os critérios de aceitação;
2. revisar código, dados e documentação aplicáveis;
3. aprovar tecnicamente a Pull Request no GitHub;
4. registrar a aprovação no Jira;
5. solicitar autorização de Alexandre para o merge.

Comentário sugerido no Jira:

```text
Revisão aprovada.

Revisor:
NOME

PR:
#XX

Critérios de aceitação atendidos.

Aguardando autorização do Gerente para merge.
```

O status continua **Em análise**. A condição passa a ser **aguardando merge**, mas isso não cria um novo status no Jira.

Mensagem para solicitar autorização:

```text
Revisão concluída para ELEICOES-XX.

PR: #XX

Critérios de aceitação:
OK

Testes/validação:
OK

Documentação:
OK

PR aprovada tecnicamente.

Alexandre, autoriza o merge?
```

## Escolha do revisor por área

O Gerente escolhe o revisor conforme a área e a disponibilidade, sem obrigar sempre a mesma pessoa.

| Área | Autor principal normalmente | Possíveis revisores |
|---|---|---|
| Banco, SQL e Data Warehouse | Maria | Alexandre ou Murilo |
| Python, EDA e Estatística | Murilo | Alexandre ou Lucas |
| Power BI e DAX | Nicholas | Lucas ou Alexandre |
| KPIs, Negócio e Storytelling | Lucas | Alexandre ou Nicholas |
| Gestão, Documentação e Arquitetura | Alexandre | Maria ou Lucas |

Essas são preferências, não atribuições automáticas. A regra que não muda é **AUTOR != REVISOR**.

## Aprovação obrigatória e merge

A equipe não deve executar merge por conta própria. Alexandre é o Gerente de Projeto e responsável pela autorização final. Quando a revisão estiver concluída, o responsável, o revisor ou o Cline deve enviar:

```text
ELEICOES-XX está pronta para merge.

PR:
#XX

Revisor:
NOME

Revisão:
APROVADA

Autoriza o merge?
```

Nesse momento, deve-se **parar e aguardar autorização explícita**. São autorizações válidas, por exemplo: “Pode dar merge”, “Merge aprovado” ou “Pode juntar na main”.

O Cline deve seguir a mesma regra e, quando uma PR estiver pronta, informar:

```text
PR #XX está pronta para revisão e merge.
Os critérios de aceitação foram verificados.
Você autoriza o merge na main?
```

O Cline nunca deve executar merge sem autorização explícita do Gerente de Projeto.

## Após o merge autorizado

Depois que o Gerente autorizar e o merge for realizado:

1. confirme que a PR foi integrada à `main`;
2. verifique se CI e testes continuam passando, caso existam;
3. atualize o repositório local:

```bash
git checkout main
git pull origin main
```

4. o revisor ou o Gerente confirma que a PR foi mergeada, que a `main` está atualizada e que nenhuma falha foi detectada;
5. somente depois o revisor ou o Gerente move a issue de **Em análise** para **Feito**;
6. adicione o comentário final no Jira.

Comentário final sugerido:

```text
Entrega concluída.

PR:
#XX

Revisão:
Aprovada por NOME.

Merge:
Aprovado pelo Gerente.

Status:
Integrado à main.
```

## Diagrama completo

```text
A FAZER
│
│ assumir tarefa
▼
FAZENDO
│
│ branch
│ desenvolvimento
│ pull
│ commit
│ push
│ PR
▼
EM ANÁLISE
│
├──────── PROBLEMA ────────┐
│                           │
│                           ▼
│                        FAZENDO
│                           │
│                     corrigir + push
│                           │
└───────────────◄───────────┘
│
│ APROVADO
▼
AGUARDANDO MERGE
│
│ Alexandre autoriza
▼
MERGE NA MAIN
│
▼
FEITO
```

**AGUARDANDO MERGE** é somente uma condição interna de **Em análise**, não um quinto status do Jira.

## Responsabilidades

### Gerente de Projeto

- Alexandre exerce a função de Gerente de Projeto;
- acompanhar o Jira e as Sprints;
- verificar bloqueios;
- acompanhar Pull Requests;
- definir um revisor diferente do autor;
- solicitar revisão adicional quando necessário;
- dar a autorização final para merge;
- verificar se a entrega está realmente pronta;
- encerrar ou autorizar o encerramento da issue;
- coordenar a integração entre áreas;
- garantir que o fluxo seja seguido, sem precisar implementar todas as tarefas.

### Autor da tarefa

- assumir a tarefa no Jira e movê-la para **Fazendo**;
- criar a branch correta;
- desenvolver, fazer commits e push;
- abrir a PR e preencher o template;
- adicionar evidências;
- responder aos comentários da revisão;
- corrigir problemas encontrados;
- avisar quando a entrega estiver pronta para merge.

### Revisor

- analisar a PR;
- testar quando possível;
- verificar os critérios de aceitação;
- solicitar alterações quando necessário;
- não executar merge sem autorização;
- informar quando considerar a PR tecnicamente aprovada.

O autor e o revisor devem ser pessoas diferentes.

## Segurança

Nunca versione:

- `.env`;
- tokens;
- senhas;
- credenciais;
- chaves privadas;
- segredos.

Não envie datasets grandes do TSE sem necessidade. O diretório `data/raw` deve permanecer fora do versionamento conforme o `.gitignore`. Antes de cada commit, execute `git status` e confira tudo o que será enviado.

## Atualização da branch e conflitos

Antes de abrir a PR, quando necessário, atualize a referência local da `main`:

```bash
git checkout main
git pull origin main
git checkout nome-da-branch
```

Atualize a branch a partir da `main` usando a estratégia segura adotada pelo projeto. Se houver conflito e você não souber resolvê-lo, não escolha arquivos aleatoriamente nem descarte mudanças. Peça ajuda ao Gerente de Projeto ou a outro integrante.

## Ligação obrigatória entre Jira e GitHub

Use sempre o código `ELEICOES-XX` no nome da branch, na mensagem de commit, no título da PR e no comentário do Jira.

Exemplo completo:

```text
Jira:
ELEICOES-20

Branch:
feature/ELEICOES-20-pipeline-etl

Commit:
ELEICOES-20: implementa extração de dados

PR:
ELEICOES-20 — Implementar pipeline ETL reproduzível
```

## Exemplo completo: ELEICOES-14

Murilo recebe a issue `ELEICOES-14`, assume a tarefa e move o Jira de **A fazer** para **Fazendo**:

```bash
git checkout main
git pull origin main
git checkout -b feature/ELEICOES-14-eda-inicial
```

Depois de desenvolver:

```bash
git status
git add .
git commit -m "ELEICOES-14: adiciona EDA inicial"
git push -u origin feature/ELEICOES-14-eda-inicial
```

Antes da PR:

```bash
git checkout main
git pull origin main
git checkout feature/ELEICOES-14-eda-inicial
git merge main
git push
```

Murilo abre a PR `ELEICOES-14 — Realizar EDA inicial` e move o Jira de **Fazendo** para **Em análise**. Alexandre define Lucas como revisor.

Se Lucas encontrar um problema, comenta as alterações solicitadas e a issue volta para **Fazendo**. Murilo continua na mesma branch:

```bash
git add .
git commit -m "ELEICOES-14: corrige análise solicitada na revisão"
git pull origin feature/ELEICOES-14-eda-inicial
git push
```

A issue volta para **Em análise** e Lucas revisa novamente. Se aprovada, Lucas aprova tecnicamente a PR e pede autorização a Alexandre. Somente após Alexandre responder claramente, por exemplo, **“Pode dar merge”**, o merge pode ser realizado. Confirmado o merge na `main`, o Jira passa de **Em análise** para **Feito**.
