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
		ORDER BY 1;
