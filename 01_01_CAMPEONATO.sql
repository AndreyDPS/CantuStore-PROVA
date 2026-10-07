

--CRIAÇÃO DA TABELA COM OS TIMES 
CREATE OR REPLACE TABLE equipes (
  time_id   INT,
  time_nome STRING
);

INSERT INTO equipes (time_id, time_nome) VALUES
  (10, 'Financeiro'),
  (20, 'Marketing'),
  (30, 'Logistica'),
  (40, 'TI'),
  (50, 'Dados');

-- CRIAÇÃO DA TABELA COM OS JOGOS
create or replace table jogos (
    jogo_id INT,
    time_mandante INT,
    time_visitante INT,
    gols_mandante INT,
    gols_visitante INT
);

INSERT INTO jogos (jogo_id, time_mandante, time_visitante, gols_mandante, gols_visitante) VALUES
  (1, 30,20,1,0),
  (2,10,20,1,2),
  (3,20,50,2,2),
  (4,10,30,1,0),
  (5,30,50,0,1);




-- CÁLCULO DOS PONTOS
With pontuacao as(
--TIME MANDANTE  
    select
        time_mandante as time_id,
        case
            when gols_mandante > gols_visitante then 3
            when gols_mandante = gols_visitante then 1
            else 0
        end as pontos
    from jogos
UNION all
  --TIME VISITANTE
    select
        time_visitante as time_id,
        case
            when gols_mandante < gols_visitante then 3
            when gols_mandante = gols_visitante then 1
            else 0
        end as pontos
    from jogos
)
select
    a.time_id,
    a.time_nome,
    coalesce(sum(b.pontos),0) as pontuacao
from equipes as a left join pontuacao as b on a.time_id = b.time_id
group by 1,2
order by pontuacao desc, time_id asc;
