/* Criando uma Tabela */
CREATE TABLE MAQUINAS (
	MAQUINA VARCHAR(20),
	DIA INT,
	QTD NUMERIC(10,2)
);


/* Importando Arquivo CSV para o Banco de Dados */
Z:\Scripts 

COPY MAQUINAS
FROM 'Z:\Scripts\LogMaquinas.csv'
DELIMITER ','
CSV HEADER;


/* Qual a Média de cada Máquina */
SELECT
	MAQUINA,
	ROUND(AVG(QTD),2) AS MEDIA_QTD
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	2 DESC;


/* Qual a Moda das Quantidades */
SELECT
	MAQUINA,
	QTD,
	COUNT(*) AS MODA
FROM
	MAQUINAS
GROUP BY
	MAQUINA,
	QTD
ORDER BY
	3 DESC;


/* Qual a Moda das Quantidades de cada Máquina */
SELECT
	MAQUINA,
	QTD,
	COUNT(*)
FROM
	MAQUINAS
WHERE
	MAQUINAS = 'Maquina 01'
GROUP BY
	MAQUINA,
	QTD
ORDER BY
	3 DESC
LIMIT
	1;


SELECT
	MAQUINA,
	QTD,
	COUNT(+)
FROM
	MAQUINAS
WHERE
	MAQUINAS = 'Maquina 02'
GROUP BY
	MAQUINA,
	QTD
ORDER BY
	3 DESC
LIMIT
	1;


SELECT
	MAQUINA,
	QTD,
	COUNT(*)
FROM
	MAQUINAS
WHERE
	MAQUINAS = 'Maquina 03'
GROUP BY
	MAQUINA,
	QTD
ORDER BY
	3 DESC
LIMIT
	1;


/* Moda do Dataset Inteiro */
SELECT
	QTD,
	COUNT(*) AS MODA
FROM
	MAQUINAS
GROUP BY
	QTD
ORDER BY
	2 DESC;


/* Qual o Máximo e Mínimo e Amplitude de cada Máquina */
SELECT
	MAQUINA,
	MAX(QTD) AS MÁXIMO,
	MIN(QTD) AS MÍNIMO,
	MAX(QTD) - MIN(QTD) AS AMPLITUDE
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	4 DESC;


/* Acrescente a Média ao Relatório */
SELECT
	MAQUINA,
	ROUND(AVG(QTD), 2) AS MÉDIA,
	MAX(QTD) AS MÁXIMO,
	MIN(QTD) AS MÍNIMO,
	MAX(QTD) - MIN(QTD) AS AMPLITUDE
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	5 DESC;


/* Desvio Padrão e Variância */
SELECT
	MAQUINA,
	ROUND(AVG(QTD), 2) AS MEDIA,
	MAX(QTD) AS MAXIMO,
	MIN(QTD) AS MINIMO,
	MAX(QTD) - MIN(QTD) AS AMPLITUDE,
	ROUND(STDDEV_POP(QTD), 2) AS DESV_PAD,
	ROUND(VAR_POP(QTD), 2) AS VARIANCIA
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	5 DESC;


/* Criando uma Função para Calcular a Mediana */
CREATE OR REPLACE FUNCTION _final_median(numeric[])
   RETURNS numeric AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;


CREATE AGGREGATE median(numeric) (
  SFUNC=array_append,
  STYPE=numeric[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);


/* Calculando a Mediana */
SELECT
	MEDIAN(QTD) AS MEDIANA
FROM
	MAQUINAS
WHERE
	MAQUINA = 'Maquina 01';


SELECT
	MEDIAN(QTD) AS MEDIANA
FROM
	MAQUINAS
WHERE
	MAQUINAS = 'Maquina 02';


SELECT
	MEDIAN(QTD) AS MEDIANA
FROM
	MAQUINAS
WHERE
	MAQUINAS = 'Maquina 03';


/* Inserindo Dados na Tabela */
INSERT INTO
	MAQUINAS
VALUES (
	'Maquina 01',
	11,
	15.9
);


INSERT INTO
	MAQUINAS
VALUES (
	'Maquinas 02',
	11,
	15.4
);


INSERT INTO
	MAQUINAS
VALUES (
	'Maquina 03',
	11,
	15.7
);


INSERT INTO 
	MAQUINAS 
VALUES (
	'Maquina 01', 
	12,
	30
);


INSERT INTO 
	MAQUINAS
VALUES (
	'Maquina 02',
	12,
	24
);


INSERT INTO 
	MAQUINAS
VALUES (
	'Maquina 03',
	12,
	45
);