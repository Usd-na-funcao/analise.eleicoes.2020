# Dicionário de Dados — Eleições 2020

## Etapas da atividade

| Etapa | Ferramenta | O que fazer | Resultado |
|---|---|---|---|
| **1. Conhecer os arquivos** | Explorador de arquivos | Identificar os arquivos disponíveis e entender o conteúdo de cada um | Lista dos arquivos |
| **2. Visualizar os dados** | Python / Google Colab | Conferir colunas, primeiras linhas e exemplos dos valores | Entendimento inicial dos dados |
| **3. Conferir estrutura** | Python / Google Colab | Verificar separador, cabeçalho, encoding e estrutura dos arquivos | Encoding/separador identificados |
| **4. Entender os campos** | Python / Google Colab | Identificar o que cada coluna parece representar e quais são os tipos de dados | Informações para o dicionário |
| **5. Verificar relações** | Python / Google Colab | Procurar colunas em comum entre os arquivos, principalmente IDs/códigos | Possíveis chaves e relacionamentos |
| **6. Conferir o escopo** | Python / Google Colab | Verificar se os registros correspondem a São Paulo capital e às Eleições 2020 | Validação do escopo |
| **7. Documentar** | VS Code | Preencher `docs/dicionario-dados.md` com tudo que foi descoberto | **Entrega principal da atividade** |

---

## 1. Lista de Arquivos

- **`consulta_cand_2020_SP.csv`** — Informação sobre os candidatos.
- **`bweb_1t_SP_181120201549.csv`** — Resultados 1º turno.
- **`bweb_2t_SP_301120201245.csv`** — Resultados 2º turno.
- **`perfil_eleitor_secao_2020_SP.csv`** — Perfil do eleitorado por seção.

---

## 2. Entendimento dos dados

### `consulta_cand_2020_SP.csv`

Contém informações sobre os candidatos das eleições de 2020 no estado de São Paulo, incluindo dados sobre o tipo de eleição, turno, município, cargo, número e nome dos candidatos.

Essa foi a tabela em que apareceram exemplos como **Tanabi, Vargem, Leme e Campina do Monte Alegre**. Ela contém informações sobre **candidatos de eleições suplementares**.

| Coluna | O que parece representar | Tipo |
|---|---|---|
| `DT_GERACAO` | Data de geração da base | Data |
| `HH_GERACAO` | Horário de geração | Hora |
| `ANO_ELEICAO` | Ano associado à eleição | Inteiro |
| `ELEICAOCD` | Código da eleição | Inteiro/Código |
| `TIPO_ELEICAONM` | Tipo da eleição | Texto/Categoria |
| `TIPO_ELEICAONR` | Código do tipo de eleição | Inteiro/Código |
| `TURNOCD` | Código do turno | Inteiro/Código |
| `ELEICAODS` | Descrição da eleição | Texto |
| `ELEICAODT` | Data do pleito | Data |
| `ELEICAOTP` | Abrangência da eleição | Texto/Categoria |
| `ABRANGENCIASG` | Sigla/identificação da abrangência | Texto |
| `UFSG` | Estado | Texto |
| `UENM` | Nome do município | Texto |
| `UECD` | Código do município/unidade eleitoral | Inteiro/Código |
| `CARGODS` | Cargo disputado | Texto/Categoria |
| `CARGOSQ` | Código/sequência do cargo | Inteiro/Código |
| `CANDIDATONR` | Número do candidato | Inteiro/Código |
| `CANDIDATONM` | Nome do candidato | Texto |
| `CANDIDATONM_URNA` | Nome utilizado na urna | Texto |
| `CANDIDATONM_SOCIAL` | Nome social do candidato | Texto |

---

### `bweb_1t_SP_181120201549.csv`

Informações sobre o primeiro turno das eleições municipais de 2020 no estado de São Paulo, organizadas por município, zona e seção eleitoral. São apresentados dados como cargo, partido e informações relacionadas ao pleito.

Essa foi a tabela em que apareceram:

- `15/11/2020`
- `TURNOCD = 1`
- São Paulo
- Prefeito
- PT
- REDE
- PSB
- PSDB

| Coluna | O que parece representar | Tipo |
|---|---|---|
| `DT_GERACAO` | Data de geração da base | Data |
| `HH_GERACAO` | Horário de geração | Hora |
| `ANO_ELEICAO` | Ano da eleição | Inteiro |
| `ELEICAOCD` | Código da eleição | Inteiro/Código |
| `TIPO_ELEICAONM` | Tipo da eleição | Texto/Categoria |
| `TIPO_ELEICAOCD` | Código do tipo de eleição | Inteiro/Código |
| `PLEITODT` | Data do pleito | Data |
| `PLEITONR` | Código/número do pleito | Inteiro/Código |
| `TURNOCD` | Número do turno | Inteiro/Código |
| `ELEICAODS` | Descrição da eleição | Texto |
| `ELEICAOSG` | Identificação da eleição | Texto |
| `UFCD` | Estado | Texto/Código |
| `MUNICIPIONM` | Nome do município | Texto |
| `MUNICIPIONR` | Código do município | Inteiro/Código |
| `ZONANR` | Número da zona eleitoral | Inteiro/Código |
| `SECAONR` | Número da seção eleitoral | Inteiro/Código |
| `LOCAL_VOTACAOCD` | Código do local de votação | Inteiro/Código |
| `CARGO` | Cargo disputado | Texto/Categoria |
| `PERGUNTADS` | Descrição de pergunta/consulta, quando aplicável | Texto |
| `CARGO_PERGUNTANR` | Código relacionado ao cargo/pergunta | Inteiro/Código |
| `PARTIDOSG` | Código/número do partido | Inteiro/Código |
| `PARTIDO` | Sigla do partido | Texto |

---

### `bweb_2t_SP_301120201245.csv`

A base contém informações sobre o segundo turno das eleições municipais de 2020 no estado de São Paulo, organizadas por município, zona e seção eleitoral. São apresentados dados como cargo, partido e informações relacionadas ao pleito.

A última tabela possui praticamente a **mesma estrutura da anterior**, mas os valores mostram:

- `PLEITODT = 29/11/2020`
- `TURNOCD = 2`
- `ELEICAOSG = Eleições Municipais 2020`
- `CARGO = Prefeito`
- `PARTIDO = PSDB`, `PSOL` etc.

Portanto, essa é a base do **2º turno das Eleições Municipais de 2020**.

As colunas são as mesmas da tabela anterior.

---

### `perfil_eleitor_secao_2020_SP.csv`

A base contém informações sobre o perfil do eleitorado de São Paulo nas eleições de 2020, organizadas por município, zona e seção eleitoral. São apresentadas características como gênero, estado civil, faixa etária, grau de escolaridade e raça/cor.

| Coluna | O que parece representar | Tipo |
|---|---|---|
| `DT_GERACAO` | Data de geração da base | Data |
| `HH_GERACAO` | Horário de geração | Hora |
| `ANO_ELEICAO` | Ano da eleição | Inteiro |
| `ELEICAOSG` | Sigla da UF | Texto |
| `UFCD` | Código da UF | Texto/Código |
| `MUNICIPIONM` | Nome do município | Texto |
| `MUNICIPIONR` | Código do município | Inteiro/Código |
| `ZONANR` | Número da zona eleitoral | Inteiro/Código |
| `SECAONR` | Número da seção eleitoral | Inteiro/Código |
| `LOCAL_VOTACAONM` | Nome do local de votação | Texto |
| `LOCAL_VOTACAOCD` | Código do local de votação | Inteiro/Código |
| `GENERODS` | Descrição do gênero | Texto/Categoria |
| `GENEROCD` | Código do gênero | Inteiro/Código |
| `ESTADO_CIVILDS` | Descrição do estado civil | Texto/Categoria |
| `ESTADO_CIVILCD` | Código do estado civil | Inteiro/Código |
| `FAIXA_ETARIADS` | Faixa etária | Texto/Categoria |
| `FAIXA_ETARIACD` | Código da faixa etária | Inteiro/Código |
| `GRAU_ESCOLARIDADEDS` | Grau de escolaridade | Texto/Categoria |
| `GRAU_ESCOLARIDADECD` | Código da escolaridade | Inteiro/Código |
| `RACA_CORDS` | Descrição de raça/cor | Texto/Categoria |
| `RACA_COR` | Código de raça/cor | Código |

---

## 3. Encoding e separadores

- **Encoding:** `cp1250`
- **Separador:** `;`

---

## 5. Colunas que podem estabelecer relação

Foram identificadas colunas em comum entre as bases, principalmente códigos de eleição, município, turno, zona, seção e local de votação. Esses campos podem ser utilizados para verificar possíveis relacionamentos entre os arquivos.

| Arquivo | Colunas que podem estabelecer relação |
|---|---|
| **1. Perfil do eleitorado** | `MUNICIPIONR`, `ZONANR`, `SECAONR`, `LOCAL_VOTACAOCD` |
| **2. Candidatos – eleições suplementares** | `ELEICAOCD`, `TURNOCD`, `UECD`, `CANDIDATONR` |
| **3. Eleições – 1º turno** | `ELEICAOCD`, `TURNOCD`, `MUNICIPIONR`, `ZONANR`, `SECAONR`, `LOCAL_VOTACAOCD`, `PARTIDOSG` |
| **4. Eleições – 2º turno** | `ELEICAOCD`, `TURNOCD`, `MUNICIPIONR`, `ZONANR`, `SECAONR`, `LOCAL_VOTACAOCD`, `PARTIDOSG` |

---

## 6. Conferir o escopo

Foi realizada a conferência do escopo das bases, verificando ano, estado, município e turno. As bases de 1º e 2º turno correspondem às Eleições Municipais de 2020 em São Paulo capital. Já as bases de perfil do eleitorado e de eleições suplementares apresentam registros de outros municípios do estado, sendo necessário considerar esse aspecto na análise.

| Arquivo | O que conferir | Resultado observado |
|---|---|---|
| **1. Perfil do eleitorado** | Ano, UF e município | `ANO_ELEICAO = 2020` e `SP`; porém a amostra mostra **Bálsamo**, então não é São Paulo capital |
| **2. Candidatos – eleições suplementares** | Ano, UF, município e tipo de eleição | É de **SP**, mas contém eleições suplementares de municípios como Tanabi, Vargem e Leme; portanto não corresponde exclusivamente à capital |
| **3. Eleições – 1º turno** | Ano, UF, município e turno | `2020`, `SP`, **SÃO PAULO**, `TURNOCD = 1` → corresponde ao escopo |
| **4. Eleições – 2º turno** | Ano, UF, município e turno | `2020`, `SP`, **SÃO PAULO**, `TURNOCD = 2` → corresponde ao escopo |

---

## 7. Ferramentas utilizadas

| Ferramenta | Utilização |
|---|---|
| **Python / Google Colab** | Leitura dos arquivos CSV, análise das colunas, visualização dos registros, verificação do encoding e do separador e análise da estrutura dos dados. |
| **Explorador de arquivos** | Identificação e organização dos arquivos utilizados na atividade. |
