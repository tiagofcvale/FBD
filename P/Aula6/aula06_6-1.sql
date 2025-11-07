USE pubs;

-- a)
SELECT * FROM authors;

-- b)

SELECT au_fname, au_lname, phone FROM authors;

-- c)

SELECT au_fname, au_lname, phone FROM authors
	ORDER BY au_fname, au_lname;
;

-- d)

SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors
	ORDER BY au_fname, au_lname;

-- e)

SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors
	WHERE "state" = 'CA' AND au_lname != 'Ringer'
	ORDER BY au_fname, au_lname;

-- f)

SELECT * FROM publishers WHERE pub_name LIKE '%Bo%';

-- g)

SELECT DISTINCT p.pub_name FROM publishers AS p
	JOIN titles AS t ON p.pub_id = t.pub_id
	WHERE t."type" = 'Business';


-- h)

SELECT DISTINCT pub_name, sum(t.ytd_sales) AS titles_sold FROM publishers AS p
	JOIN titles AS t ON p.pub_id = t.pub_id
	GROUP BY pub_name;
	
-- i)

SELECT DISTINCT pub_name, title, sum(t.ytd_sales) AS titles_sold FROM publishers AS p 
	JOIN titles AS t ON p.pub_id = t.pub_id
	WHERE t.ytd_sales IS NOT NULL
	GROUP BY pub_name, title;

-- j)

SELECT DISTINCT title FROM titles AS t
	JOIN sales AS sal ON t.title_id = sal.title_id
	JOIN stores AS stor ON stor.stor_id = sal.stor_id
	WHERE stor_name = 'Bookbeat';

-- k)

SELECT DISTINCT au_fname AS Fname, au_lname AS Lname FROM authors AS a
	JOIN titleauthor AS ta ON ta.au_id = a.au_id
	JOIN titles AS t ON t.title_id = ta.title_id
	GROUP BY au_fname, au_lname
	HAVING COUNT(DISTINCT "type") > 1;

-- l)

SELECT "type", pub_id, AVG(price) AS AVGPrice, SUM(ytd_sales) AS Sales FROM titles
	WHERE price IS NOT NULL 
		AND ytd_sales IS NOT NULL
	GROUP BY "type", pub_id;

-- m)

SELECT "type" FROM titles
	GROUP BY "type"
	HAVING MAX(advance) > 1.5 * AVG(Price);

-- n)

SELECT title, au_fname, au_lname, (price * ytd_sales) AS revenue
	FROM authors AS a
	JOIN titleauthor AS tau ON tau.au_id = a.au_id
	JOIN titles AS t ON t.title_id = tau.title_id
	WHERE price IS NOT NULL AND ytd_sales IS NOT NULL

-- o)

SELECT title, ytd_sales, 
		(price * ytd_sales) AS faturacao,
		(price * ytd_sales / (SELECT COUNT(*) FROM titleauthor AS ta WHERE ta.title_id = t.title_id)) AS author_revenue,
		(price * ytd_sales / (SELECT COUNT(*) FROM publishers AS pub WHERE pub.pub_id = t.pub_id)) AS publisher_revenue
	FROM titles AS t
	WHERE ytd_sales IS NOT NULL AND title IS NOT NULL;

-- p)

SELECT DISTINCT title, ytd_sales, au_fname,
		(t.price * ytd_sales) / (SELECT COUNT(*) FROM titleauthor ta WHERE ta.title_id = t.title_id) AS author_revenue,
		(t.price * ytd_sales) / (SELECT COUNT(*) FROM titles WHERE pub_id = t.pub_id) AS publisher_revenue
	FROM titles AS t
	JOIN titleauthor AS ta ON t.title_id = ta.title_id
	JOIN authors AS a ON ta.au_id = a.au_id
	JOIN publishers AS p ON p.pub_id = t.pub_id
	WHERE t.price IS NOT NULL AND ytd_sales IS NOT NULL;

-- q)

SELECT stor_name FROM stores AS store
	JOIN sales AS sale ON sale.stor_id = store.stor_id
	JOIN titles AS t ON t.title_id = sale.title_id
	GROUP BY stor_name
	HAVING COUNT(DISTINCT sale.title_id) >= COUNT(t.title_id);

-- r)

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

