ay 9 of SQL Advent Calendar
Today's Question:

A community is hosting a series of festive feasts, and they want to ensure a balanced menu. Write a query to identify the top 3 most calorie-dense dishes (calories per gram) served for each event. Include the dish_name, event_name, and the calculated calorie density in your results.

Table name: events

event_id	event_name
1	Christmas Eve Dinner
2	New Years Feast
3	Winter Solstice Potluck
Table name: menu

dish_id	dish_name	event_id	calories	weight_g
1	Roast Turkey	1	3500	5000
2	Chocolate Yule Log	1	2200	1000
3	Cheese Fondue	2	1500	800
4	Holiday Fruitcake	3	4000	1200
5	Honey Glazed Ham	2	2800	3500
Question level of difficulty: Hard
------------------------------------------------------------------------------------

WITH DishDensity AS (
  SELECT
    m.dish_name,
    e.event_name,
    m.calories / m.weight_g AS calorie_density,
    ROW_NUMBER() OVER (PARTITION BY e.event_name ORDER BY m.calories / m.weight_g DESC) AS rank
  FROM
    menu m
  INNER JOIN events e ON m.event_id = e.event_id
)
SELECT
  dish_name,
  event_name,
  calorie_density
FROM
  DishDensity
WHERE
  rank <= 3;
  ------------------------------------------------------------------------------------

Vamos analisar passo a passo o que cada parte da consulta faz:

Common Table Expression (CTE): DishDensity
Objetivo: Criar uma tabela temporária para calcular a densidade calórica de cada prato e classificá-los por evento.
SELECT m.dish_name, e.event_name, m.calories / m.weight_g AS calorie_density:
Seleciona o nome do prato, o nome do evento e calcula a densidade calórica dividindo as calorias pela quantidade em gramas.
ROW_NUMBER() OVER (PARTITION BY e.event_name ORDER BY m.calories / m.weight_g DESC) AS rank:
Atribui um número para cada prato dentro de cada evento, ordenando-os pela densidade calórica em ordem decrescente.
PARTITION BY e.event_name: Agrupa os pratos por evento.
ORDER BY m.calories / m.weight_g DESC: Ordena os pratos dentro de cada grupo pela densidade calórica.
Consulta Principal
SELECT dish_name, event_name, calorie_density FROM DishDensity:
Seleciona o nome do prato, o nome do evento e a densidade calórica da tabela temporária.
WHERE rank <= 3:
Filtra os resultados para mostrar apenas os pratos com classificação 3 ou menor, ou seja, os 3 pratos mais calóricos de cada evento.
Em resumo:

A consulta calcula a densidade calórica de cada prato.
Classifica os pratos por evento, do mais calórico para o menos calórico.
Seleciona os 3 pratos mais calóricos de cada evento.
Por que usar um CTE?

Leiturabilidade: Torna a consulta mais fácil de entender, pois separa a lógica de cálculo da classificação.
Reusabilidade: A tabela temporária pode ser usada em outras partes da consulta.
Eficiência: Em alguns casos, pode melhorar o desempenho da consulta, especialmente em bancos de dados maiores.
Exemplo de resultado:

dish_name	event_name	calorie_density
Chocolate Yule Log	Christmas Eve Dinner	12.2
Roast Turkey	Christmas Eve Dinner	7
Cheese Fondue	New Years Feast	2.6875
