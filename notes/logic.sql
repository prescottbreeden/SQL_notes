

SELECT title, author_lname
	FROM books
		WHERE author_lname in ('carver', 'lahiri', 'smith');


SELECT title, released_year
	FROM books
		WHERE released_year not in 
		(
			2000,
			2002,
			2004,
			2006,
			2008,
			2010
		)

SELECT title, released_year 
FROM books
	WHERE released_year % 2 != 0
	AND released_year >= 2000
		ORDER BY released_year;


SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 THEN 'Modern Lit'
		ELSE '20th Century Lit'
	END AS Genre
FROM books
	ORDER BY 3,2,1;


SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 49 THEN '*'
		WHEN stock_quantity BETWEEN 50 and 99 THEN '**'
		WHEN stock_quantity BETWEEN 100 AND 999 THEN '***'
		ELSE '****'
	END AS Stock
FROM books
	ORDER BY 3,2,1;




