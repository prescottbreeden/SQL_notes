

-- Hermoine and Ron Wands:

 SELECT w.id, 
        p.age, 
        w.coins_needed, 
        w.power 
   FROM Wands AS w 
        JOIN Wands_Property AS p 
        ON (w.code = p.code) 
        WHERE p.is_evil = 0 
        AND w.coins_needed = (
			 SELECT MIN(coins_needed) 
               FROM Wands AS w1 
                    JOIN Wands_Property AS p1 
                    ON (w1.code = p1.code) 
                    WHERE w1.power = w.power 
                    AND p1.age = p.age) 
        ORDER BY w.power DESC, p.age DESC;

-- Hacker Rank Challenges

/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

 SELECT c.hacker_id, 
        h.name,
        count(c.hacker_id) AS c_count
   FROM Hackers as h
        INNER JOIN Challenges AS c 
        ON c.hacker_id = h.hacker_id
        GROUP BY 1, 2
        HAVING c_count = (
             SELECT MAX(temp1.cnt)
               FROM (
                     SELECT COUNT(hacker_id) AS cnt
                       FROM Challenges
                            GROUP BY hacker_id
                            ORDER BY hacker_id) temp1)
        OR c_count 
        IN (
             SELECT t.cnt
               FROM (
                     SELECT count(*) AS cnt 
                       FROM challenges
                            GROUP BY hacker_id) t
            GROUP BY t.cnt
            HAVING count(t.cnt) = 1)
        ORDER BY c_count DESC, c.hacker_id;

