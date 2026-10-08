# CantuStore — projeto editável no Power BI Desktop

O pacote contém o projeto PBIP, oito páginas com visuais nativos, modelo com relacionamentos e 26 medidas DAX. As sete análises também estão calculadas em `analises_conferidas`, para conferir os resultados antes e depois da atualização.

## Abrir

1. Extraia este ZIP em uma pasta curta, por exemplo `C:\CantuStore`. Preserve as pastas `.Report` e `.SemanticModel` ao lado de `CantuStore.pbip`.
2. Feche esse projeto no Power BI se já estiver aberto. No seu notebook, execute a célula abaixo, ajustando o caminho do arquivo extraído:

```python
import runpy

config = runpy.run_path(r"C:\Users\Andrey\OneDrive\Documents\GITHUB\CantuStore-PROVA\CantuStore_PowerBI\configurar.py")
config["configurar"]()
```

O configurador procura a exportação mais recente com os sete CSVs em `C:\Users\Andrey\OneDrive\Documents\GITHUB\CantuStore-PROVA\data\processed`. Ele imprime a pasta escolhida: confira se é a exportação desejada. Para definir uma pasta específica:

```python
config["configurar"](
    pasta_dados=r"C:\Users\Andrey\OneDrive\Documents\GITHUB\CantuStore-PROVA\data\processed\modelo_python_20261008_050336_103641"
)
```

3. Abra `CantuStore.pbip` no Power BI Desktop.
4. Clique em **Atualizar**. O projeto não inclui cache de dados; os visuais receberão dados após a importação dos CSVs locais. A leitura dos tipos já está configurada com ponto decimal e localidade en-US.
5. Confira os resultados com os CSVs de `analises_conferidas` e, para entregar um arquivo PBIX, use **Arquivo → Salvar como → .pbix**.

Se o Power BI não reconhecer o projeto, verifique a versão do aplicativo e use uma versão recente do Desktop comum. A versão otimizada para Power BI Report Server não suporta esse formato. Se sua versão apresentar uma opção de prévia para projetos PBIP, habilite-a e reinicie o aplicativo.

O projeto teve estruturas JSON, referências de campos, relacionamentos e geometria dos visuais conferidos. Não houve abertura no Power BI Desktop nesta sessão: a renderização nativa, o processamento de DAX e a atualização final ainda precisam ocorrer no seu Windows. Envie o texto exato de eventual erro para correção.

## Páginas e requisitos

| Página | Análise |
|---|---|
| 01 Produtos e visão geral | Produtos com mais carrinhos, unidades, valores, canal e perfis |
| 02 Duplas | Pares de produtos com mais carrinhos |
| 03 Aumento mensal | Mês selecionado versus anterior, variação absoluta e percentual |
| 04 Primeiro mês observado | Produtos, primeira aparição e carrinhos no seu primeiro mês |
| 05 Estados | Ranking de estados e cobertura geográfica |
| 06 Relatório mensal por produto | Produto/mês: carrinhos, registros, unidades e valor |
| 07 Relatório por data | Data: carrinhos, registros, unidades e valor |
| 08 Premissas e qualidade | População, abandono, datas, moeda, produtos e validações |

Os filtros de canal e perfil são independentes em cada página. O filtro de mês nas páginas normais usa a data de criação do carrinho. Na página de aumentos, o seletor é independente, seleciona um mês e mantém o mês anterior disponível para comparação. Sem seleção, usa o último mês observado. Na página do primeiro mês, o filtro identifica o mês da primeira aparição do produto.

Apenas os campos da dimensão carrinho filtram a fato de duplas; não existe relacionamento de produto com essa fato. As páginas de duplas não têm segmentação por produto individual.

## Premissas que acompanham a entrega

- A população é de carrinhos com registros de itens. Ausência de endereço ou presença de pagamento não confirma abandono nem conversão. Os títulos de valor não faturado são usados sob essa premissa; não existe taxa de abandono observável.
- A identificação de produto disponível é a chave `p_product`, sem nome comercial. O produto desconhecido é excluído dos rankings e duplas; permanece na conciliação.
- Primeira aparição usa a data de criação do carrinho, que não comprova a data de inclusão do produto nem seu lançamento. Os produtos vistos no começo da janela podem ser anteriores a ela. Não foi possível cumprir literalmente o requisito de lançamento com os campos fornecidos; a aproximação é explícita.
- Não alteramos `p_totalprice`. Valores são expressos em unidades monetárias da origem. Moeda e escala não foram confirmadas. Há preços/valores elevados que precisam de validação na origem; por isso não inserimos “R$”.
- Quantidade de itens = unidades de `p_quantity`; também exibimos o número de registros de itens. Não multiplique o valor total do item pela quantidade novamente.
- Carrinhos distintos por produto ou dupla não são aditivos. Um mesmo carrinho pode constar em várias linhas. Os relatórios de detalhe não mostram uma soma enganosa de carrinhos.
- A localização depende de endereço de entrega, sem enriquecimento por CEP. O ranking identificado não representa toda a população.
- Datas inexistentes ficam no grupo “Sem data”. O calendário tem uma linha nula e não está marcado como tabela de datas; as medidas mensais usam filtros explícitos.
- Última data observada: 26/07/2022. Julho e junho têm exposições distintas, e a extração não comprova que todos os dias de qualquer mês estejam completos. A comparação é uma variação de contagem bruta, sem ajuste por exposição.

## Fontes técnicas

- https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-overview
- https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-report
- https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-dataset

Os schemas oficiais da Microsoft foram usados para conferir os arquivos PBIP, PBIR e PBISM.
