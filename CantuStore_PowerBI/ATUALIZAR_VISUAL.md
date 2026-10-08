# Atualizar o projeto já aberto no seu computador

Esta atualização aplica as cores da logo enviada (roxo principal #4F008F e branco), cabeçalhos roxos, fundo claro, cartões e tabelas com a mesma identidade. Insere a logo pequena no canto inferior esquerdo de todas as páginas.

## Aplicar sem perder o caminho dos CSVs

1. Salve e feche o projeto atual no Power BI Desktop.
2. Extraia este ZIP em uma pasta diferente da pasta do seu projeto atual.
3. No notebook, execute o código abaixo com os dois caminhos reais:

```python
import runpy

# Arquivo que veio no ZIP atualizado.
atualizacao = runpy.run_path(
    r"C:\CantuStore_Atualizacao\CantuStore_PowerBI\atualizar_visual.py"
)

# Pasta do seu projeto atual, onde estão o PBIP e as pastas Report/SemanticModel.
atualizacao["atualizar"](
    r"C:\CantuStore\CantuStore_PowerBI"
)
```

4. Abra novamente o PBIP do projeto atual. O atualizador modifica somente o relatório e seus recursos visuais; não modifica a pasta de dados, as consultas ou as medidas do modelo.

Se preferir começar pelo projeto novo do ZIP, ele já vem com a identidade visual aplicada, mas você precisará configurar `PastaDados` novamente conforme `ABRIR_NO_POWERBI.md`.

## Nomes dos produtos — pendência de dados

As bases fornecidas não contêm nomes comerciais dos produtos. `dim_produto.csv` possui apenas `produto_id`, `primeira_aparicao_observada` e `rotulo_produto`; o último campo é “Produto + ID”, e não um nome real.

Para trocar IDs por nomes em gráficos, tabelas e duplas, forneça um CSV de cadastro com:

- `produto_id`: a mesma chave `p_product` usada na fato;
- `nome_produto`: o nome comercial correspondente.

SKU ou código comercial sem ligação com `p_product` não permite o relacionamento por si só. Não foram inventados nomes nem apresentados os rótulos de ID como nomes reais. Essa alteração permanece pendente até recebermos a correspondência.

O layout e a estrutura foram conferidos com os schemas oficiais. A renderização nativa da logo, tema e demais visuais precisa ser conferida após reabrir o Power BI Desktop.
