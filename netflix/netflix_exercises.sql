USE netflixDB;

-- EXERCISES

 SELECT s.title,
		s.released_year,
		g.genre_type
   FROM series AS s
		JOIN genres as g
		ON s.genre_id = g.genre_id
		ORDER BY 2;

 SELECT s.title,
		r.rating
   FROM series AS s 
		JOIN ratings AS r
		ON s.series_id = r.series_id
		ORDER BY 1
		LIMIT 15;

 SELECT s.series_id, 
		s.title,
		IFNULL(ROUND(AVG(r.rating),2), '0') AS average
   FROM series AS s
		LEFT JOIN ratings AS r
		ON s.series_id = r.series_id
		GROUP BY s.series_id
		ORDER BY average DESC;

 SELECT CONCAT(u.last_name, ', ', SUBSTRING(u.first_name,1,1)) AS user_name,
		s.title,
		r.rating,
		g.genre_type
   FROM users AS u
		JOIN ratings AS r
		ON u.user_id = r.user_id
		JOIN series AS s
		ON s.series_id = r. series_id
		JOIN genres AS g
		ON g.genre_id = s.genre_id
		WHERE u.user_id = 5
		ORDER BY 1,3 DESC, 2;

 SELECT g.genre_type,
		IFNULL(ROUND(AVG(r.rating), 2), 'NOT RATED') AS 'user 5 averages'
   FROM ratings AS r
		JOIN series AS s
		ON s.series_id = r.series_id
		JOIN genres AS g
		ON g.genre_id = s.genre_id
		WHERE r.user_id = 5
		GROUP BY g.genre_id
		ORDER BY 2 DESC, 1;

 SELECT g.genre_type,
		IFNULL(ROUND(AVG(r.rating), 2), 'NOT RATED') AS 'all user averages'
   FROM ratings AS r
		JOIN series AS s
		ON s.series_id = r.series_id
		JOIN genres AS g
		ON g.genre_id = s.genre_id
		GROUP BY g.genre_id
		ORDER BY 2 DESC, 1;

 SELECT s.title
   FROM series AS s
		LEFT JOIN ratings AS r
		ON s.series_id = r.series_id
		WHERE rating IS NULL;


 SELECT u.first_name,
		u.last_name,
		COUNT(r.rating) AS 'COUNT',
		IFNULL(MIN(r.rating), 0) AS 'MIN',
		IFNULL(MAX(r.rating), 0) AS 'MAX',
		IFNULL(ROUND(AVG(r.rating), 2), 0) AS 'AVG',
		CASE
			WHEN COUNT(r.rating) > 0 THEN 'ACTIVE'
			ELSE 'INACTIVE'
		END AS 'STATUS'
   FROM users AS u
		LEFT JOIN ratings as r
		ON u.user_id = r.user_id
		GROUP BY u.user_id;

 SELECT s.title,
		r.rating,
		CONCAT(u.first_name, ' ', u.last_name) AS reviewer
   FROM series AS s
		JOIN ratings AS r
		ON s.series_id = r.series_id
		JOIN users AS u
		ON u.user_id = r.user_id
		ORDER BY 1, u.user_id;

