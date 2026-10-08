"""Configura a pasta dos CSVs no projeto, sem alterar dados de origem."""
from pathlib import Path
import json

TABELAS = (
    'dim_canal', 'dim_regiao', 'dim_carrinho', 'dim_produto',
    'dim_data', 'fato_itens_carrinho', 'fato_duplas_carrinho'
)

def arquivos_validos(pasta):
    if not pasta.is_dir():
        return False
    nomes = [p.name for p in pasta.glob('*.csv')]
    return all(
        sum(n == t + '.csv' or n.endswith('-' + t + '.csv') for n in nomes) == 1
        for t in TABELAS
    )

def configurar(pasta_dados=None, pasta_projeto=None):
    projeto = Path(pasta_projeto) if pasta_projeto else Path(__file__).resolve().parent
    if pasta_dados is None:
        base = Path(r'C:\Users\Andrey\OneDrive\Documents\GITHUB\CantuStore-PROVA\data\processed')
        candidatas = [p for p in base.glob('*') if arquivos_validos(p)]
        if arquivos_validos(base):
            candidatas.append(base)
        if not candidatas:
            raise FileNotFoundError('Não localizei uma pasta com os sete CSVs. Passe pasta_dados explicitamente.')
        pasta = max(candidatas, key=lambda p: p.stat().st_mtime)
    else:
        pasta = Path(pasta_dados)
    if not arquivos_validos(pasta):
        raise ValueError('A pasta precisa conter uma única cópia de cada um dos sete CSVs.')
    arquivo = projeto / 'CantuStore.SemanticModel' / 'model.bim'
    modelo = json.loads(arquivo.read_text(encoding='utf-8'))
    parametro = next(e for e in modelo['model']['expressions'] if e['name'] == 'PastaDados')
    parametro['expression'] = (
        '"' + pasta.resolve().as_posix().replace('"', '""') + '"'
        ' meta [IsParameterQuery=true, Type="Text", IsParameterQueryRequired=true]'
    )
    arquivo.write_text(json.dumps(modelo, ensure_ascii=False, indent=2), encoding='utf-8')
    print('Fontes configuradas:', pasta)
    print('Abra:', projeto / 'CantuStore.pbip')
    print('Depois clique em Atualizar no Power BI Desktop.')
    return str(pasta)

if __name__ == '__main__':
    configurar()
