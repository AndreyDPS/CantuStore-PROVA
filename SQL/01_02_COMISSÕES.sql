-- criação da tabela exemplo de comissões
create or replace table comissoes (
    COMPRADOR string,
    VENDEDOR string,
    DATAPGTO date,
    VALOR DECIMAL(10,2)
);

INSERT INTO comissoes (COMPRADOR, VENDEDOR, DATAPGTO, VALOR) VALUES
    ('LEONARDO', 'BRUNO',   '2000-01-01', 200.00),
    ('LEONARDO', 'MATHEUS', '2003-09-27', 1024.00),
    ('LEONARDO', 'LUCAS',   '2006-06-26', 512.00),
    ('MARCOS',   'LUCAS',   '2020-12-17', 100.00),
    ('MARCOS',   'LUCAS',   '2021-03-20', 10.00),
    ('CINTHIA',  'LUCAS',   '2021-03-20', 500.00),
    ('MATHEUS',  'BRUNO',   '2007-06-02', 400.00),
    ('MATHEUS',  'BRUNO',   '2006-06-26', 400.00),
    ('MATHEUS',  'BRUNO',   '2015-06-26', 200.00);

--particionando por vendedor e ordenando por vendas para conseguir filtrar as 3 maiores de cada vendedor
with df as(
select
    vendedor as nome_vendedor,
    valor,
    row_number() over(partition by vendedor order by valor desc) as rn
from comissoes)

--selecionando apenas as 3 maiores e pegando apenas 
select 
nome_vendedor
--sum(valor) as valor -- apenas verificando se o somatório está batendo
from df where rn <=3
group by 1
having sum(valor) >=1024;
