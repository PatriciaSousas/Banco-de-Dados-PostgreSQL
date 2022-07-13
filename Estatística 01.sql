/* Quantidade, Total, Média, Máximo, Mínimo, Amplitude, Variância, Desvio Padrão, Mediana, Coeficiente de Variância */
SELECT
	MAQUINA,
	COUNT(QTD) AS QUANTIDADE,
	SUM(QTD) AS TOTAL,
	ROUND(AVG(QTD), 2) AS MEDIA,
	MAX(QTD) AS MAXIMO,
	MIN(QTD) AS MINIMO,
	MAX(QTD) - MIN(QTD) AS "AMPLITUDE TOTAL",
	ROUND(VAR_POP(QTD), 2) AS VARIANCIA,
	ROUND(STDDEV_POP(QTD), 2) AS "DESVIO PADRAO",
	ROUND(MEDIAN(QTD), 2) AS MEDIANA,
	ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100, 2) AS "COEFICIENTE DE VARIACAO"
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	1;


/* Calculando a Moda */
SELECT
	MAQUINA,
	COUNT(QTD) AS QUANTIDADE,
	SUM(QTD) AS TOTAL,
	ROUND(AVG(QTD), 2) AS MEDIA,
	MAX(QTD) AS MAXIMO,
	MIN(QTD) AS MINIMO,
	MAX(QTD) - MIN(QTD) AS "AMPLITUDE TOTAL",
	ROUND(VAR_POP(QTD), 2) AS VARIANCIA,
	ROUND(STDDEV_POP(QTD), 2) AS "DESVIO PADRAO",
	ROUND(MEDIAN(QTD), 2) AS MEDIANA,
	ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100, 2) AS "COEFICIENTE DE VARIACAO",
	MODE() WITHIN GROUP (ORDER BY QTD) AS MODA
FROM
	MAQUINAS
GROUP BY
	MAQUINA
ORDER BY
	1;