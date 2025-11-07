# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors;
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone FROM authors;
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT au_fname, au_lname, phone FROM authors
	ORDER BY au_fname, au_lname;
;
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors
	ORDER BY au_fname, au_lname;
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors
	WHERE "state" = 'CA' AND au_lname != 'Ringer'
	ORDER BY au_fname, au_lname;
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * FROM publishers WHERE pub_name LIKE '%Bo%';
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT p.pub_name FROM publishers AS p
	JOIN titles AS t ON p.pub_id = t.pub_id
	WHERE t."type" = 'Business';
```

### *h)* Número total de vendas de cada editora; 

```

SELECT DISTINCT pub_name, sum(t.ytd_sales) AS titles_sold FROM publishers AS p
	JOIN titles AS t ON p.pub_id = t.pub_id
	GROUP BY pub_name;
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT DISTINCT pub_name, title, sum(t.ytd_sales) AS titles_sold FROM publishers AS p 
	JOIN titles AS t ON p.pub_id = t.pub_id
	WHERE t.ytd_sales IS NOT NULL
	GROUP BY pub_name, title;
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT DISTINCT title FROM titles AS t
	JOIN sales AS sal ON t.title_id = sal.title_id
	JOIN stores AS stor ON stor.stor_id = sal.stor_id
	WHERE stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT DISTINCT au_fname AS Fname, au_lname AS Lname FROM authors AS a
	JOIN titleauthor AS ta ON ta.au_id = a.au_id
	JOIN titles AS t ON t.title_id = ta.title_id
	GROUP BY au_fname, au_lname
	HAVING COUNT(DISTINCT "type") > 1;
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT "type", pub_id, AVG(price) AS AVGPrice, SUM(ytd_sales) AS Sales FROM titles
	WHERE price IS NOT NULL 
		AND ytd_sales IS NOT NULL
	GROUP BY "type", pub_id;
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT "type" FROM titles
	GROUP BY "type"
	HAVING MAX(advance) > 1.5 * AVG(Price);

```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT title, au_fname, au_lname, (price * ytd_sales) AS revenue
	FROM authors AS a
	JOIN titleauthor AS tau ON tau.au_id = a.au_id
	JOIN titles AS t ON t.title_id = tau.title_id
	WHERE price IS NOT NULL AND ytd_sales IS NOT NULL
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT title, ytd_sales, 
		(price * ytd_sales) AS faturacao,
		(price * ytd_sales / (SELECT COUNT(*) FROM titleauthor AS ta WHERE ta.title_id = t.title_id)) AS author_revenue,
		(price * ytd_sales / (SELECT COUNT(*) FROM publishers AS pub WHERE pub.pub_id = t.pub_id)) AS publisher_revenue
	FROM titles AS t
	WHERE ytd_sales IS NOT NULL AND title IS NOT NULL;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT DISTINCT title, ytd_sales, au_fname,
		(t.price * ytd_sales) / (SELECT COUNT(*) FROM titleauthor ta WHERE ta.title_id = t.title_id) AS author_revenue,
		(t.price * ytd_sales) / (SELECT COUNT(*) FROM titles WHERE pub_id = t.pub_id) AS publisher_revenue
	FROM titles AS t
	JOIN titleauthor AS ta ON t.title_id = ta.title_id
	JOIN authors AS a ON ta.au_id = a.au_id
	JOIN publishers AS p ON p.pub_id = t.pub_id
	WHERE t.price IS NOT NULL AND ytd_sales IS NOT NULL;
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT stor_name FROM stores AS store
	JOIN sales AS sale ON sale.stor_id = store.stor_id
	JOIN titles AS t ON t.title_id = sale.title_id
	GROUP BY stor_name
	HAVING COUNT(DISTINCT sale.title_id) >= COUNT(t.title_id);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stor_name FROM stores AS store
	JOIN sales AS sale ON store.stor_id = sale.stor_id
	GROUP BY stor_name
	HAVING COUNT(sale.title_id) > (
		SELECT AVG(title_count)
		FROM (
			SELECT COUNT(sale.title_id) AS title_count
			FROM sales as sale
			GROUP BY sale.stor_id
			) AS store_sales
		);

```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
... Write here your answer ...
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
... Write here your answer ...
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```
