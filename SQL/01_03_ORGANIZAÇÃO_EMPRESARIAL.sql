--CRIANDO A TABELA DE FUNCIONÁRIOS

CREATE OR REPLACE TABLE colaboradores (
    ID INT,
    NOME STRING,
    SALARIO INT,
    LIDER_ID INT
);

INSERT INTO colaboradores (ID, NOME, SALARIO, LIDER_ID) VALUES
(40, 'HELEN',    1500,  50),
(50, 'BRUNO',    3000,  10),
(10, 'LEONARDO', 4500,  20),
(20, 'MARCOS',  10000, NULL),
(70, 'MATEUS',   1500,  10),
(60, 'CINTHIA',  2000,  70),
(30, 'WILIAN',   1501,  50);



with recursive df as(
--PUXANDO RECURSIVAMENTE TODOS OS LIDERES DIRETOS E INDIRETOS DE CADA FUNCIONARIO
    select
        id as funcionario_id,
        salario as funcionario_salario,
        lider_id,
        1 as nivel
        from colaboradores
    UNION all
    select
        a.funcionario_id,
        a.funcionario_salario,
        b.lider_id,
        nivel + 1 as nivel
        from df as a join colaboradores as b
        on a.lider_id = b.id
),
df2 as(
--FILTRANDO APENAS FUNCIONÁRIOS CUJOS LIDERES POSSUEM PELO MENOS 2X O SALÁRIO (o rn vai ficar diferente do nível por conta disso)
    select
        a.funcionario_id,
        a.lider_id,
        a.nivel,
        row_number() over(partition by a.funcionario_id order by a.nivel) as rn
    from df as a

    join colaboradores as lider
    on lider.id = a.lider_id
    where lider.salario >= 2* a.funcionario_salario
)

--PEGANDO TODOS OS FUNCIONÁRIOS DA BASE VISTO QUE O ID20 NAO POSSUI LIDER E FILTRANDO APENAS RN=1 PARA MANTER APENAS O PRIMEIRO LIDER COM 2X O SALÁRIO
    select 
        a.id as funcionario_id, -- pegaremos todos os funcionarios da base, para manter o funcionario id=20 que não possui líder 
        b.lider_id 
    from colaboradores as a 
    left join df2 as b 
    on a.id = b.funcionario_id and b.rn = 1
    
    order by a.id;
