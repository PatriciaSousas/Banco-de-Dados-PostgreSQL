/* Variáveis Dummy para Machine Learning */

/* Utilizando o Case */
SELECT
	NOME,
	CARGO,
CASE
	WHEN CARGO = 'Financial Advisor' THEN 'Condicao 01'
	WHEN CARGO = 'Structural Engineer' THEN 'Condicao 02'
	WHEN CARGO = 'Executive Secretary' THEN 'Condicao 03'
	WHEN CARGO = 'Sales Associative' THEN 'Condicao 04'
	ELSE 'OUTRAS CONDICOES'
END AS
	"CONDICOES"
FROM
	FUNCIONARIOS;


SELECT
	NOME,
CASE
	WHEN SEXO = 'Masculino' THEN 'M'
	WHEN SEXO = 'Feminino' THEN 'F'
END AS
	"SEXO"
FROM
	FUNCIONARIOS;


/* Utilizando Valores Booleanos */
SELECT
	NOME,
	CARGO,
	(SEXO = 'Masculino') AS "Masculino",
	(SEXO = 'Feminino') AS "Feminino"
FROM
	FUNCIONARIOS;


/* Mesclando as Técnicas */
SELECT
	NOME,
	CARGO,
CASE
	WHEN (SEXO = 'Masculino') = true THEN 1
	ELSE 0
END AS
	"MASCULINO",
CASE
	WHEN (SEXO = 'Feminino') = true THEN 1
	ELSE 0
END AS
	"FEMININO"
FROM
	FUNCIONARIOS;


/* Filtros de Grupo */

/* Filtros Baseados em Valores Númericos */
SELECT
	NOME,
	DEPARTAMENTO
FROM
	FUNCIONARIOS
WHERE
	SALARIO > 100000;


/* Filtros Baseado em String */
SELECT
	NOME,
	DEPARTAMENTO,
	SALARIO
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO = 'Ferramentas';


/* Filtros Baseados em Múltiplos Tipos e Colunas - Considerar OR e AND */
SELECT
	NOME,
	DEPARTAMENTO,
	SALARIO
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO = 'Ferramentas'
AND
	SALARIO > 100000;


/* Filtro Baseado em Único Tipo e Coluna - Atenção para a Regra do AND e OR - Em Relacionamentos 1 x 1 o filtro AND
Tratando de uma Única Coluna Sempre Dará Falso */
SELECT
	NOME,
	DEPARTAMENTO,
	SALARIO
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO = 'Ferramentas'
AND
	DEPARTAMENTO = 'Books';


/* Filtros Baseados em Padrão de Caracteres */
SELECT
	DEPARTAMENTO,
	SUM(SALARIO) AS "TOTAL"
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO LIKE 'B%'
GROUP BY
	DEPARTAMENTO;


/* Filtros Baseados em Padrão de Caracteres com mais Letras */
SELECT
	DEPARTAMENTO,
	SUM(SALARIO) AS "TOTAL"
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO LIKE 'Bo%'
GROUP BY
	DEPARTAMENTO;


/* Utilizando o Caracter Coringa no Meio da Palavra */
SELECT
	DEPARTAMENTO,
	SUM(SALARIO) AS "TOTAL"
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO LIKE 'B%s'
GROUP BY
	DEPARTAMENTO;


/* Se eu Quisesse Filtrar o Agrupamento pelo Salário ? por Exemplo, Maior que 4000000 */
SELECT
	DEPARTAMENTO,
	SUM(SALARIO) AS "TOTAL"
FROM
	FUNCIONARIOS
WHERE
	DEPARTAMENTO LIKE 'B%'
GROUP BY
	DEPARTAMENTO
HAVING
	SUM(SALARIO) > 4000000;


/* Observação: Colunas Não Agregadas - WHERE; Colunas Agregadas - HAVING */


/* Múltiplos Contadores */
SELECT
	COUNT(*)
FROM
	FUNCIONARIOS;


SELECT
	SEXO,
	COUNT(*) AS "QUANTIDADE TOTAL"
FROM
	FUNCIONARIOS
WHERE
	SEXO = 'Masculino'
GROUP BY
	SEXO;


SELECT
	COUNT(*) AS "QUANTIDADE TOTAL",
	(SELECT
		COUNT(*)
	FROM
		FUNCIONARIOS
	WHERE
		SEXO = 'Masculino'
	GROUP BY
		SEXO) AS "MASCULINO"
FROM
	FUNCIONARIOS;


SELECT
	COUNT(*) AS "QUANTIDADE TOTAL",
	COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "MASCULINO"
FROM
	FUNCIONARIOS;


SELECT
	COUNT(*) AS "QUANTIDADE TOTAL",
	COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "MASCULINO",
	COUNT(*) FILTER(WHERE DEPARTAMENTO = 'Books') as "BOOKS",
	COUNT(*) FILTER(WHERE SALARIO > 140000) AS "SALARIO > 140K",
FROM
	FUNCIONARIOS;


/* Reformatando Strings Usando UPPER CASE */
SELECT
	DISTINCT UPPER(DEPARTAMENTO)
FROM
	FUNCIONARIOS;


/* Usando LOWER CASE */
SELECT
	DISTINCT LOWER(DEPARTAMENTO)
FROM
	FUNCIONARIOS;


/* Concatenando Strings */
SELECT
	CARGO || ' - ' || DEPARTAMENTO
FROM
	FUNCIONARIOS;


SELECT
	UPPER(CARGO || ' - ' || DEPARTAMENTO) AS "CARGO COMPLETO"
FROM
	FUNCIONARIOS;


/* Removendo Espaços */
SELECT
	TRIM(' UNIDADOS  ');

/* Contando Caracteres */
SELECT
	LENGTH('UNIDADOS');


SELECT
	LENGTH(TRIM('   UNIDADOS    '));


/* Desafio - Criar uma Coluna ao Lado da Coluna Cargo que Diga se a Pessoa é Assistente ou Não */
SELECT
	NOME,
	(CARGO LIKE '%Assistente%') AS "ASSISTENTE?"
FROM
	FUNCIONARIOS;


SELECT
	NOME,
CASE
	WHEN (CARGO LIKE '%Assistente%') = TRUE THEN 1
	ELSE 0
	END AS
		"ASSISTENTE?"
FROM
	FUNCIONARIOS;