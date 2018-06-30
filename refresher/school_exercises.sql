USE schoolDB;

-- EXERCISES

 SELECT s.first_name,
		p.title,
		p.grade
   FROM students AS s
		RIGHT JOIN papers AS p
		ON s.student_id = p.student_id
		ORDER BY p.grade DESC;


 SELECT s.first_name,
		p.title,
		p.grade
   FROM students AS s
		LEFT JOIN papers AS p
		ON s.student_id = p.student_id;

 SELECT s.first_name,
		IFNULL(p.title, 'MISSING') AS title,
		IFNULL(p.grade, 0) AS grade
   FROM students AS s
		LEFT JOIN papers AS p
		ON s.student_id = p.student_id;

 SELECT s.first_name,
		IFNULL(avg(p.grade), 0) AS average
   FROM students AS s
		LEFT JOIN papers AS p
		ON s.student_id = p.student_id
		GROUP BY s.student_id
		ORDER BY average DESC;


 SELECT s.first_name,
		IFNULL(avg(p.grade), 0) AS average,
		CASE
			WHEN avg(p.grade) >= 75 THEN 'PASSING'
			WHEN avg(p.grade) IS NULL THEN 'INCOMPLETE'
			ELSE 'FAILING'
		END AS passing_status		
   FROM students AS s
		LEFT JOIN papers AS p
		ON s.student_id = p.student_id
		GROUP BY s.student_id
		ORDER BY average DESC;
