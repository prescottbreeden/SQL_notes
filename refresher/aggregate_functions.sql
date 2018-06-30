 -- using books_db

SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';


SELECT
	author_lname,
	count(*)
	FROM books
		GROUP BY author_lname;

'''
mysql> select author_lname, count(*) from books group by author_lname;
+----------------+----------+
| author_lname   | count(*) |
+----------------+----------+
| Carver         |        2 |
| Chabon         |        1 |
| DeLillo        |        1 |
| Eggers         |        3 |
| Foster Wallace |        2 |
| Gaiman         |        3 |
| Harris         |        2 |
| Lahiri         |        2 |
| Saunders       |        1 |
| Smith          |        1 |
| Steinbeck      |        1 |
+----------------+----------+
11 rows in set (0.01 sec)

mysql> select concat('In ', released_year, ': ',  count(*), ' book(s) released') as year from books group by released_year;
+-----------------------------+
| year                        |
+-----------------------------+
| In 1945: 1 book(s) released |
| In 1981: 1 book(s) released |
| In 1985: 1 book(s) released |
| In 1989: 1 book(s) released |
| In 1996: 1 book(s) released |
| In 2000: 1 book(s) released |
| In 2001: 3 book(s) released |
| In 2003: 2 book(s) released |
| In 2004: 1 book(s) released |
| In 2005: 1 book(s) released |
| In 2010: 1 book(s) released |
| In 2012: 1 book(s) released |
| In 2013: 1 book(s) released |
| In 2014: 1 book(s) released |
| In 2016: 1 book(s) released |
| In 2017: 1 book(s) released |
+-----------------------------+
16 rows in set (0.00 sec)

mysql> select author_fname, author_lname, min(released_year) from books group by author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | min(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1981 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2001 |
| David        | Foster Wallace |               2004 |
| Neil         | Gaiman         |               2001 |
| Dan          | Harris         |               2014 |
| Frieda       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               1996 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+
12 rows in set (0.00 sec)


mysql> select author_fname, author_lname, max(pages) from books group by author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | max(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |        526 |
| Michael      | Chabon         |        634 |
| Don          | DeLillo        |        320 |
| Dave         | Eggers         |        504 |
| David        | Foster Wallace |        343 |
| Neil         | Gaiman         |        465 |
| Dan          | Harris         |        256 |
| Frieda       | Harris         |        428 |
| Jhumpa       | Lahiri         |        291 |
| George       | Saunders       |        367 |
| Patti        | Smith          |        304 |
| John         | Steinbeck      |        181 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

mysql> select author_fname, author_lname, sum(pages) from books group by author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | sum(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |        702 |
| Michael      | Chabon         |        634 |
| Don          | DeLillo        |        320 |
| Dave         | Eggers         |       1293 |
| David        | Foster Wallace |        672 |
| Neil         | Gaiman         |        977 |
| Dan          | Harris         |        256 |
| Frieda       | Harris         |        428 |
| Jhumpa       | Lahiri         |        489 |
| George       | Saunders       |        367 |
| Patti        | Smith          |        304 |
| John         | Steinbeck      |        181 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

mysql> select author_fname, author_lname, round(avg(pages), 2) from books group by author_lname, author_fname;
+--------------+----------------+----------------------+
| author_fname | author_lname   | round(avg(pages), 2) |
+--------------+----------------+----------------------+
| Raymond      | Carver         |               351.00 |
| Michael      | Chabon         |               634.00 |
| Don          | DeLillo        |               320.00 |
| Dave         | Eggers         |               431.00 |
| David        | Foster Wallace |               336.00 |
| Neil         | Gaiman         |               325.67 |
| Dan          | Harris         |               256.00 |
| Frieda       | Harris         |               428.00 |
| Jhumpa       | Lahiri         |               244.50 |
| George       | Saunders       |               367.00 |
| Patti        | Smith          |               304.00 |
| John         | Steinbeck      |               181.00 |
+--------------+----------------+----------------------+
12 rows in set (0.00 sec)

mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       19 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*), released_year from books group by released_year;
+----------+---------------+
| count(*) | released_year |
+----------+---------------+
|        1 |          1945 |
|        1 |          1981 |
|        1 |          1985 |
|        1 |          1989 |
|        1 |          1996 |
|        1 |          2000 |
|        3 |          2001 |
|        2 |          2003 |
|        1 |          2004 |
|        1 |          2005 |
|        1 |          2010 |
|        1 |          2012 |
|        1 |          2013 |
|        1 |          2014 |
|        1 |          2016 |
|        1 |          2017 |
+----------+---------------+
16 rows in set (0.00 sec)

mysql> select sum(stock_quantity) from books;
+---------------------+
| sum(stock_quantity) |
+---------------------+
|                2450 |
+---------------------+
1 row in set (0.00 sec)


mysql> select author_fname, author_lname, avg(released_year) from books group by author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | avg(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |          1985.0000 |
| Michael      | Chabon         |          2000.0000 |
| Don          | DeLillo        |          1985.0000 |
| Dave         | Eggers         |          2008.6667 |
| David        | Foster Wallace |          2004.5000 |
| Neil         | Gaiman         |          2006.6667 |
| Dan          | Harris         |          2014.0000 |
| Frieda       | Harris         |          2001.0000 |
| Jhumpa       | Lahiri         |          1999.5000 |
| George       | Saunders       |          2017.0000 |
| Patti        | Smith          |          2010.0000 |
| John         | Steinbeck      |          1945.0000 |
+--------------+----------------+--------------------+
12 rows in set (0.00 sec)


mysql> select concat(author_fname, ' ', author_lname) from books where pages = (select max(pages) from books);
+-----------------------------------------+
| concat(author_fname, ' ', author_lname) |
+-----------------------------------------+
| Michael Chabon                          |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql> select released_year as year, count(*) as '# books', avg(pages) as 'avg pages' from books group by 1;
+------+---------+-----------+
| year | # books | avg pages |
+------+---------+-----------+
| 1945 |       1 |  181.0000 |
| 1981 |       1 |  176.0000 |
| 1985 |       1 |  320.0000 |
| 1989 |       1 |  526.0000 |
| 1996 |       1 |  198.0000 |
| 2000 |       1 |  634.0000 |
| 2001 |       3 |  443.3333 |
| 2003 |       2 |  249.5000 |
| 2004 |       1 |  329.0000 |
| 2005 |       1 |  343.0000 |
| 2010 |       1 |  304.0000 |
| 2012 |       1 |  352.0000 |
| 2013 |       1 |  504.0000 |
| 2014 |       1 |  256.0000 |
| 2016 |       1 |  304.0000 |
| 2017 |       1 |  367.0000 |
+------+---------+-----------+
16 rows in set (0.00 sec)

'''




