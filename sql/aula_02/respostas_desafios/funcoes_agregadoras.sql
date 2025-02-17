-- ex 1
SELECT
	COUNT(*)
FROM
	filmes
WHERE
	ano_lancamento < 2000;

-- ex 2
select count(*), ano_lancamento FROM filmes GROUP BY ano_lancamento;
SELECT * FROM filmes WHERE ano_lancamento IN (2002, 2013);


-- ex 3
select avg(idade) from personagens where idade > 30;

-- ex 4
select max(idade) from personagens where esta_morto = 0 and idade > 25;

-- ex 5
SELECT count(*) FROM filmes WHERE ano_lancamento < 1990 OR ano_lancamento > 2010;

-- ex 6
SELECT filme_id, COUNT(*) AS contagem FROM personagens GROUP BY filme_id ORDER BY contagem;
SELECT * FROM filmes WHERE id = 15;

-- ex 7
SELECT filme_id, COUNT(*) AS contagem FROM personagens WHERE esta_morto = 1 AND eh_superheroi = 1 GROUP BY filme_id ORDER BY contagem DESC;
SELECT * FROM filmes WHERE id=11;

-- ex 8
SELECT AVG(preco) FROM produtos WHERE tipo = 'Alimento';

-- ex 9 
SELECT COUNT(*) qnt, filme_id FROM personagens GROUP BY filme_id HAVING COUNT(*) = 4 ORDER BY qnt  DESC;
SELECT * FROM filmes WHERE id = 10;

-- ex 10
SELECT * from vendas;
SELECT 
	SUM(quantidade_vendida) as total
	, produto_id 
FROM 
	vendas 
JOIN 
	vendedores 
	ON personagens.filme_id = filmes.id
GROUP BY 
	SUM(quantidade_vendida) > 1 
HAVING
	COUNT
ORDER BY 
	total DESC;

-- ex 11
SELECT
	SUM(idade) AS total_idades
	, filme_id
FROM
	personagens
GROUP BY
	filme_id
ORDER BY
	total_idades DESC;

-- ex 12
SELECT
	COUNT(*) AS total
	, vendedor_id
FROM 
	vendas
GROUP BY
	vendedor_id
ORDER BY
	total DESC;
SELECT * FROM vendedores WHERE id = 6;
SELECT * FROM personagens WHERE id = 6;

-- ex 13
SELECT 
	COUNT(DISTINCT produto_id) AS qnt
	, cliente_id
FROM
	vendas
GROUP BY
	cliente_id
ORDER BY
	qnt DESC;
SELECT personagem_id FROM clientes WHERE id = 12;
SELECT * FROM personagens WHERE id = 7;

-- EX 14 
SELECT 
	SUM(quantidade_vendida) as qtd
	, produto_id
FROM 
	vendas
GROUP BY	
	produto_id
ORDER BY
	qtd DESC
LIMIT 3;
