# Resultados conferidos — CantuStore

Os indicadores descrevem carrinhos com itens, sob a premissa de abandono adotada. Não há confirmação individual de não conversão.

População: **2.110.291 carrinhos**, **2.461.258 registros de itens** e **6.345.211 unidades**. Datas observadas: 2019-12-16 a 2022-07-26.

## 1. Produtos com mais carrinhos

| Produto ID | Carrinhos | Unidades |
|---|---:|---:|
| 8797277388801 | 33.617 | 95.386 |
| 8800160153601 | 29.213 | 82.844 |
| 8797234200577 | 29.177 | 86.526 |
| 8801372176385 | 22.381 | 62.724 |
| 8797232398337 | 21.861 | 64.880 |
| 8801373749249 | 19.277 | 62.048 |
| 8800160120833 | 19.084 | 51.407 |
| 8797277159425 | 16.858 | 49.748 |
| 8797234790401 | 16.479 | 46.846 |
| 8800160284673 | 16.284 | 47.093 |

## 2. Duplas com mais carrinhos

| Produto A | Produto B | Carrinhos |
|---|---|---:|
| 8797983080449 | 8800160120833 | 1.205 |
| 8800160153601 | 8801372176385 | 1.005 |
| 8797234200577 | 8799375851521 | 909 |
| 8797164437505 | 8800160120833 | 702 |
| 8800160186369 | 8802909716481 | 682 |
| 8797304815617 | 8800160284673 | 578 |
| 8797329063937 | 8800160120833 | 537 |
| 8797277388801 | 8801370537985 | 465 |
| 8797982916609 | 8800160153601 | 443 |
| 8797164437505 | 8797983080449 | 441 |

## 3. Produtos com aumento

No recorte bruto de **2022-07 versus 2022-06**, 1.720 produtos tiveram aumento. Julho termina no dia 26; não tratar essa diferença como mudança de taxa de abandono nem como comparação ajustada por exposição.

| Produto ID | Atual | Anterior | Aumento | Variação |
|---|---:|---:|---:|---:|
| 8800160153601 | 2.803 | 960 | 1.843 | 191.98% |
| 8800160186369 | 1.915 | 573 | 1.342 | 234.21% |
| 8799375851521 | 1.357 | 52 | 1.305 | 2509.62% |
| 8808349663233 | 1.679 | 397 | 1.282 | 322.92% |
| 8800160284673 | 1.100 | 222 | 878 | 395.50% |
| 8804122394625 | 1.393 | 649 | 744 | 114.64% |
| 8802941698049 | 1.758 | 1.028 | 730 | 71.01% |
| 8808349696001 | 808 | 83 | 725 | 873.49% |
| 8797234200577 | 2.340 | 1.623 | 717 | 44.18% |
| 8797231382529 | 1.060 | 352 | 708 | 201.14% |

## 4. Produtos novos e primeiro mês

A tabela `04_primeiro_mes_produtos.csv` contém a primeira aparição de cada produto e os carrinhos, registros, unidades e valores em seu próprio primeiro mês observado. Isso é uma aproximação explícita: não existe data de lançamento. O indicador `primeiro_mes_da_base` destaca produtos cuja aparição coincide com o início da janela, sujeitos a histórico anterior não observado.

## 5. Estados

| Estado | Carrinhos |
|---|---:|
| NI | 1.976.326 |
| SP | 31.985 |
| MG | 22.058 |
| RJ | 11.318 |
| BA | 8.637 |
| RS | 7.617 |
| PR | 7.558 |
| SC | 6.585 |
| GO | 6.439 |
| ES | 5.581 |
| PE | 4.162 |

Cobertura geográfica: **6.35%**. NI significa estado não identificado. SP lidera somente o subconjunto com localização disponível.

## 6 e 7. Relatórios mensal e diário

`06_produto_mes.csv` e `07_por_data.csv` contêm carrinhos distintos, registros de itens, unidades e valor dos itens. Os totais de unidades e valores foram conciliados com a fato, inclusive os grupos sem data/produto. Carrinhos por produto não são aditivos.

Valor total registrado na base: **15,800,560,606.395 unidades monetárias**. Moeda e escala monetária não confirmadas. Valor não faturado depende da premissa de abandono; não corresponde a receita perdida comprovada.

## Validação

Chaves dimensionais e de itens únicas; integridade das referências validada; duplas sem duplicidade e com ordem A < B; totais compatíveis com auditoria. Sete itens sem carrinho correspondente foram excluídos. Um item sem produto foi preservado para conciliação. Há 28.758 carrinhos sem data e 1.976.326 sem região identificada.
