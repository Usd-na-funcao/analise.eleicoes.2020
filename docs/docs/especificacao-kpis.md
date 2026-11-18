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



