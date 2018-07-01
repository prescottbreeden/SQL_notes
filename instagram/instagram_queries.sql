-- We want to reward our users who have been around the longest. Find the 5 oldest users.

 SELECT u.username,
		u.created_at
   FROM users AS u
		ORDER BY 2 
		LIMIT 5;

-- What day of the week do most users register on?  We need to figure out when to schedule an ad campaign.

 SELECT DAYNAME(created_at) AS day,
		COUNT(*) AS total
   FROM users
		GROUP BY day
		HAVING
			count(*) = (
					SELECT MAX(sub.num)
					FROM (SELECT COUNT(DAYNAME(created_at)) AS num FROM users
					GROUP BY DAYNAME(created_at)) AS sub);

 SELECT DAYNAME(created_at) AS day,
		COUNT(*) AS total
   FROM users
		GROUP BY day
		ORDER BY total DESC
		LIMIT 2;

-- We want to target our inactive users with an email campaign. Find the users who have never posted a photo.

 SELECT u.username AS 'Inactive Users'
   FROM users AS u
		LEFT JOIN photos AS p
		ON u.user_id = p.user_id
		WHERE p.photo_id IS NULL;	


-- Identify the most popular photo (and the user who created it)

 SELECT u.username,
		p.photo_id,
		p.image_url,
		COUNT(*) AS total
   FROM photos AS p
		JOIN likes AS l
		ON p.photo_id = l.photo_id
		JOIN users AS u
		ON p.user_id = u.user_id
		GROUP BY p.photo_id
		ORDER BY total DESC
		LIMIT 1;

-- How many times does the average user post?

SELECT (SELECT COUNT(*) FROM photos) / 
		(SELECT COUNT(*) FROM users) AS average_posts;

-- What are the top 5 most commonly used hashtags?















