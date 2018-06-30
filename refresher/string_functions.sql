

-- CONCAT

SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books;

SELECT author_fname AS first, author_lname AS last,
	CONCAT(author_fname, ' ', author_lname) AS full
	FROM books;

'''

+---------+----------------+----------------------+
| first   | last           | full                 |
+---------+----------------+----------------------+
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Neil    | Gaiman         | Neil Gaiman          |
| Neil    | Gaiman         | Neil Gaiman          |
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Dave    | Eggers         | Dave Eggers          |
| Dave    | Eggers         | Dave Eggers          |
| Michael | Chabon         | Michael Chabon       |
| Patti   | Smith          | Patti Smith          |
| Dave    | Eggers         | Dave Eggers          |
| Neil    | Gaiman         | Neil Gaiman          |
| Raymond | Carver         | Raymond Carver       |
| Raymond | Carver         | Raymond Carver       |
| Don     | DeLillo        | Don DeLillo          |
| John    | Steinbeck      | John Steinbeck       |
| David   | Foster Wallace | David Foster Wallace |
| David   | Foster Wallace | David Foster Wallace |
+---------+----------------+----------------------+
'''

SELECT
	CONCAT_WS(' - ', title, author_fname, author_lname)
	FROM books;

'''
+------------------------------------------------------------------------+
| concat_ws(' - ', title, author_fname, author_lname)                    |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
| Interpreter of Maladies - Jhumpa - Lahiri                              |
| A Hologram for the King: A Novel - Dave - Eggers                       |
| The Circle - Dave - Eggers                                             |
| The Amazing Adventures of Kavalier & Clay - Michael - Chabon           |
| Just Kids - Patti - Smith                                              |
| A Heartbreaking Work of Staggering Genius - Dave - Eggers              |
| Coraline - Neil - Gaiman                                               |
| What We Talk About When We Talk About Love: Stories - Raymond - Carver |
| Where I\'m Calling From: Selected Stories - Raymond - Carver            |
| White Noise - Don - DeLillo                                            |
| Cannery Row - John - Steinbeck                                         |
| Oblivion: Stories - David - Foster Wallace                             |
| Consider the Lobster - David - Foster Wallace                          |
+------------------------------------------------------------------------+

'''

SELECT
	SUBSTRING('Hello World', 1, 4);

'''
mysql> select substring('hello world', 1, 4);
+--------------------------------+
| substring('hello world', 1, 4) |
+--------------------------------+
| hell                           |
+--------------------------------+
1 row in set (0.00 sec)

mysql> select substring('hello world', 3);
+-----------------------------+
| substring('hello world', 3) |
+-----------------------------+
| llo world                   |
+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTR('hello world', -3);
+------------------------------+
| substring('hello world', -3) |
+------------------------------+
| rld                          |
+------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTR(title, 1, 10) FROM books;
+-------------------------+
| substring(title, 1, 10) |
+-------------------------+
| The Namesa              |
| Norse Myth              |
| American G              |
| Interprete              |
| A Hologram              |
| The Circle              |
| The Amazin              |
| Just Kids               |
| A Heartbre              |
| Coraline                |
| What We Ta              |
| Where I\'m               |
| White Nois              |
| Cannery Ro              |
| Oblivion:               |
| Consider t              |
+-------------------------+
16 rows in set (0.00 sec)

mysql> SELECT CONCAT(SUBSTR(title, 1, 10), '...') FROM books;
+-------------------------------------+
| CONCAT(SUBSTR(title, 1, 10), '...') |
+-------------------------------------+
| The Namesa...                       |
| Norse Myth...                       |
| American G...                       |
| Interprete...                       |
| A Hologram...                       |
| The Circle...                       |
| The Amazin...                       |
| Just Kids...                        |
| A Heartbre...                       |
| Coraline...                         |
| What We Ta...                       |
| Where I\'m ...                       |
| White Nois...                       |
| Cannery Ro...                       |
| Oblivion: ...                       |
| Consider t...                       |
+-------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title' FROM books;
+---------------+
| short title   |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I\'m ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
16 rows in set (0.01 sec)

mysql> SELECT REPLACE('Hello World', 'Hell', '@#$%') AS 'censored!';
+-------------+
| censored!   |
+-------------+
| @#$%o World |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT REPLACE(title, 'e', '3') FROM books;
+-----------------------------------------------------+
| REPLACE(title, 'e', '3')                            |
+-----------------------------------------------------+
| Th3 Nam3sak3                                        |
| Nors3 Mythology                                     |
| Am3rican Gods                                       |
| Int3rpr3t3r of Maladi3s                             |
| A Hologram for th3 King: A Nov3l                    |
| Th3 Circl3                                          |
| Th3 Amazing Adv3ntur3s of Kavali3r & Clay           |
| Just Kids                                           |
| A H3artbr3aking Work of Stagg3ring G3nius           |
| Coralin3                                            |
| What W3 Talk About Wh3n W3 Talk About Lov3: Stori3s |
| Wh3r3 I\'m Calling From: S3l3ct3d Stori3s            |
| Whit3 Nois3                                         |
| Cann3ry Row                                         |
| Oblivion: Stori3s                                   |
| Consid3r th3 Lobst3r                                |
+-----------------------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT SUBSTR(REPLACE(title, 'e', '3'), 1, 10) FROM books;
+-----------------------------------------+
| SUBSTR(REPLACE(title, 'e', '3'), 1, 10) |
+-----------------------------------------+
| Th3 Nam3sa                              |
| Nors3 Myth                              |
| Am3rican G                              |
| Int3rpr3t3                              |
| A Hologram                              |
| Th3 Circl3                              |
| Th3 Amazin                              |
| Just Kids                               |
| A H3artbr3                              |
| Coralin3                                |
| What W3 Ta                              |
| Wh3r3 I\'m                               |
| Whit3 Nois                              |
| Cann3ry Ro                              |
| Oblivion:                               |
| Consid3r t                              |
+-----------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT CHAR_LENGTH(title) FROM books;
+--------------------+
| CHAR_LENGTH(title) |
+--------------------+
|                 12 |
|                 15 |
|                 13 |
|                 23 |
|                 32 |
|                 10 |
|                 41 |
|                  9 |
|                 41 |
|                  8 |
|                 51 |
|                 40 |
|                 11 |
|                 11 |
|                 17 |
|                 20 |
+--------------------+
16 rows in set (0.00 sec)


==================================
========= EXERCISES ==============
==================================

mysql> SELECT REPLACE(title, ' ', '->') from books;
+--------------------------------------------------------------+
| REPLACE(title, ' ', '->')                                    |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
| Where->I\'m->Calling->From:->Selected->Stories                |
| White->Noise                                                 |
| Cannery->Row                                                 |
| Oblivion:->Stories                                           |
| Consider->the->Lobster                                       |
+--------------------------------------------------------------+
16 rows in set (0.01 sec)

mysql> select forwards(author_fname) as 'forwards', reverse(author_fname) as 'backwards' from books;
ERROR 1305 (42000): FUNCTION books_db.forwards does not exist
mysql> select (author_fname) as 'forwards', reverse(author_fname) as 'backwards' from books;
+----------+-----------+
| forwards | backwards |
+----------+-----------+
| Jhumpa   | apmuhJ    |
| Neil     | lieN      |
| Neil     | lieN      |
| Jhumpa   | apmuhJ    |
| Dave     | evaD      |
| Dave     | evaD      |
| Michael  | leahciM   |
| Patti    | ittaP     |
| Dave     | evaD      |
| Neil     | lieN      |
| Raymond  | dnomyaR   |
| Raymond  | dnomyaR   |
| Don      | noD       |
| John     | nhoJ      |
| David    | divaD     |
| David    | divaD     |
+----------+-----------+
16 rows in set (0.00 sec)

mysql> select concat_WS(' ', upper(author_fname), upper(author_lname)) as 'full name in caps' from books;
+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+
16 rows in set (0.00 sec)

mysql> select concat(title, ' was released in ', released_year) as blurb from books;
+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius was released in 2001           |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |
| Where I\'m Calling From: Selected Stories was released in 1989            |
| White Noise was released in 1985                                         |
| Cannery Row was released in 1945                                         |
| Oblivion: Stories was released in 2004                                   |
| Consider the Lobster was released in 2005                                |
+--------------------------------------------------------------------------+
16 rows in set (0.00 sec)

mysql> select title, char_length(title) as 'character count' from books;
+-----------------------------------------------------+-----------------+
| title                                               | character count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
| Norse Mythology                                     |              15 |
| American Gods                                       |              13 |
| Interpreter of Maladies                             |              23 |
| A Hologram for the King: A Novel                    |              32 |
| The Circle                                          |              10 |
| The Amazing Adventures of Kavalier & Clay           |              41 |
| Just Kids                                           |               9 |
| A Heartbreaking Work of Staggering Genius           |              41 |
| Coraline                                            |               8 |
| What We Talk About When We Talk About Love: Stories |              51 |
| Where I\'m Calling From: Selected Stories            |              40 |
| White Noise                                         |              11 |
| Cannery Row                                         |              11 |
| Oblivion: Stories                                   |              17 |
| Consider the Lobster                                |              20 |
+-----------------------------------------------------+-----------------+
16 rows in set (0.00 sec)

mysql> select concat(substr(title, 1, 10), '...'), concat(author_lname, ',', author_fname) as author, concat(stock_quantity, ' in stock') as quantity from books;
+-------------------------------------+----------------------+--------------+
| concat(substr(title, 1, 10), '...') | author               | quantity     |
+-------------------------------------+----------------------+--------------+
| The Namesa...                       | Lahiri,Jhumpa        | 32 in stock  |
| Norse Myth...                       | Gaiman,Neil          | 43 in stock  |
| American G...                       | Gaiman,Neil          | 12 in stock  |
| Interprete...                       | Lahiri,Jhumpa        | 97 in stock  |
| A Hologram...                       | Eggers,Dave          | 154 in stock |
| The Circle...                       | Eggers,Dave          | 26 in stock  |
| The Amazin...                       | Chabon,Michael       | 68 in stock  |
| Just Kids...                        | Smith,Patti          | 55 in stock  |
| A Heartbre...                       | Eggers,Dave          | 104 in stock |
| Coraline...                         | Gaiman,Neil          | 100 in stock |
| What We Ta...                       | Carver,Raymond       | 23 in stock  |
| Where I\'m ...                       | Carver,Raymond       | 12 in stock  |
| White Nois...                       | DeLillo,Don          | 49 in stock  |
| Cannery Ro...                       | Steinbeck,John       | 95 in stock  |
| Oblivion: ...                       | Foster Wallace,David | 172 in stock |
| Consider t...                       | Foster Wallace,David | 92 in stock  |
+-------------------------------------+----------------------+--------------+
16 rows in set (0.00 sec)

mysql> select concat(substr(title, 1, 10), '...') as 'short title', concat(author_lname, ',', author_fname) as author, concat(stock_quantity, ' in stock') as quantity from books;
+---------------+----------------------+--------------+
| short title   | author               | quantity     |
+---------------+----------------------+--------------+
| The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
| Norse Myth... | Gaiman,Neil          | 43 in stock  |
| American G... | Gaiman,Neil          | 12 in stock  |
| Interprete... | Lahiri,Jhumpa        | 97 in stock  |
| A Hologram... | Eggers,Dave          | 154 in stock |
| The Circle... | Eggers,Dave          | 26 in stock  |
| The Amazin... | Chabon,Michael       | 68 in stock  |
| Just Kids...  | Smith,Patti          | 55 in stock  |
| A Heartbre... | Eggers,Dave          | 104 in stock |
| Coraline...   | Gaiman,Neil          | 100 in stock |
| What We Ta... | Carver,Raymond       | 23 in stock  |
| Where I\'m ... | Carver,Raymond       | 12 in stock  |
| White Nois... | DeLillo,Don          | 49 in stock  |
| Cannery Ro... | Steinbeck,John       | 95 in stock  |
| Oblivion: ... | Foster Wallace,David | 172 in stock |
| Consider t... | Foster Wallace,David | 92 in stock  |
+---------------+----------------------+--------------+
16 rows in set (0.01 sec)


'''

INSERT INTO books
	(title, author_fname, author_lname, released_year, stock_quantity, pages)
	VALUES
		('10% Happer', 'Dan', 'Harris', 2014, 29, 256),
		('fake_book', 'Frieda', 'Harris', 2001, 287, 428),
		('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);




-- 
