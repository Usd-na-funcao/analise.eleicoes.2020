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

% Comparecimento = 
DIVIDE(
    SUM(fComparecimento[qtd_comparecimento]),
    [Eleitores Aptos],
    0
)

% Abstencao = 
DIVIDE(
    SUM(fComparecimento[qtd_abstencoes]),
    [Eleitores Aptos],
    0
)

% Votos Validos = 
VAR VotosCandidato = [Total Votos Validos]
VAR TotalGeralCargo = 
    CALCULATE(
        [Total Votos Validos],
        ALL(dCandidatos)
    )
RETURN
DIVIDE(VotosCandidato, TotalGeralCargo, 0)

% Brancos e Nulos = 
VAR VotosNaoValidos = 
    CALCULATE(
        SUM(fVotacao[qtd_votos]),
        fVotacao[tipo_voto] IN {"Branco", "Nulo"}
    )
RETURN
DIVIDE(VotosNaoValidos, SUM(fComparecimento[qtd_comparecimento]), 0)

