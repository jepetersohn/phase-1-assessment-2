Paste your queries and results in this file
================================================================================
sqlite> select * from authors
   ...> ;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David Black
14          Rod Stephen
15          Thomas Corm
sqlite> select * from books;
id          title                       author_id   publisher_id
----------  --------------------------  ----------  ------------
1           Rails 4 Test Prescriptions  1           1
2           Metaprogramming Ruby 2      2           1
3           Programming Ruby 1.9 & 2.0  3           1
4           Pragmatic Programmer        3           2
5           Practical Object Oriented   4           2
6           The Rails 4 Way             5           2
7           Objective-C Programming     6           3
8           iOS Programming             6           3
9           JavaScript: The Good Parts  7           4
10          JavaScript: The Definitive  8           4
11          Functional JavaScript       9           4
12          Build iOS Games with Sprit  10          1
13          Test iOS Apps with UI Auto  10          1
14          Design Patterns in Ruby     11          2
15          Eloquent Ruby               11          2
16          Web Design with HTML & CSS  12          5
17          JavaScript and jQuery       12          5
18          Well-Grounded Rubyist       13          6
19          Essential Algorithms        14          5
20          Introduction to Algorithms  15          7
sqlite> select * from publishers
   ...> ;
id          name
----------  ---------------------
1           Pragmatic Programmers
2           Addison-Wesley
3           Big Nerd Ranch
4           O'Reilly
5           Wiley
6           Manning Publications
7           MIT Press
sqlite>


### Release 1: `WHERE`
In your terminal, create and execute the following queries:

- show all the books containing "Ruby" in the title
sqlite> select title from books where title like '%Ruby%';
title
----------------------
Metaprogramming Ruby 2
Programming Ruby 1.9 &
Practical Object Orien
Design Patterns in Rub
Eloquent Ruby
Well-Grounded Rubyist
sqlite>

- show the authors with a name starting with "Dav"
sqlite> select name from authors where name like 'Dav%';
name
-----------
Dave Thomas
David Flana
David Black
sqlite>


### Release 2: `JOIN`
In your terminal, create and execute the following queries:
- show all the books published by "Addison-Wesley"
sqlite> select title from books join publishers on books.publisher_id = publishers.id where publishers.name = 'Addison-Wesley';
title
--------------------
Pragmatic Programmer
Practical Object Ori
The Rails 4 Way
Design Patterns in R
Eloquent Ruby
sqlite>

- show all the books authored by "Jonathan Penn"
sqlite> select title from books join authors on books.author_id = authors.id where authors.name = 'Jonathan Penn';
title
------------------------------
Build iOS Games with SpriteKit
Test iOS Apps with UI Automati
sqlite>

- show all the publishers where the book title contains "iOS"
sqlite> select name from publishers join books on publishers.id = books.publisher_id where books.title like '%IOS%';
name
--------------
Big Nerd Ranch
Pragmatic Prog
Pragmatic Prog
sqlite>

- show all the publishers for the author "Sandi Metz"

sqlite> select publishers.name from publishers
   ...> join books on publishers.id = books.publisher_id
   ...> join authors on books.author_id = authors.id
   ...> where authors.name = 'Sandi Metz';
name
--------------
Addison-Wesley
sqlite>

In your terminal, create and execute the following queries:
- add a new author to the authors table
sqlite> insert into authors (name) values ('Lisa Swanson');
sqlite> select * from authors;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David Black
14          Rod Stephen
15          Thomas Corm
16          Lisa Swanso
sqlite>

- add a new publisher to the publishers table
sqlite> insert into publishers (name) values ('Lisa Swanson');
sqlite> select * from publishers;
id          name
----------  ---------------------
1           Pragmatic Programmers
2           Addison-Wesley
3           Big Nerd Ranch
4           O'Reilly
5           Wiley
6           Manning Publications
7           MIT Press
8           Lisa Swanson
sqlite>
- add a new book to the books table with the new author and publisher
sqlite> insert into books (title, author_id, publisher_id) values ('The Joy of OO Programming', (Select id from authors where name = 'Sandi Metz'), (select id from publishers where name = 'Addison-Wesley'));
sqlite> select * from books
   ...> ;
id          title                       author_id   publisher_id
----------  --------------------------  ----------  ------------
1           Rails 4 Test Prescriptions  1           1
2           Metaprogramming Ruby 2      2           1
3           Programming Ruby 1.9 & 2.0  3           1
4           Pragmatic Programmer        3           2
5           Practical Object Oriented   4           2
6           The Rails 4 Way             5           2
7           Objective-C Programming     6           3
8           iOS Programming             6           3
9           JavaScript: The Good Parts  7           4
10          JavaScript: The Definitive  8           4
11          Functional JavaScript       9           4
12          Build iOS Games with Sprit  10          1
13          Test iOS Apps with UI Auto  10          1
14          Design Patterns in Ruby     11          2
15          Eloquent Ruby               11          2
16          Web Design with HTML & CSS  12          5
17          JavaScript and jQuery       12          5
18          Well-Grounded Rubyist       13          6
19          Essential Algorithms        14          5
20          Introduction to Algorithms  15          7
21          The Joy of OO Programming   4           2
sqlite>

### Release 4: `UPDATE`
In your terminal, create and execute the following queries:
- update the author named "David Black" to "David A. Black"

sqlite> update authors set name = 'David A. Black' where name = 'David Black';
sqlite> select * from authors;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David A. Bl
14          Rod Stephen
15          Thomas Corm
16          Lisa Swanso
sqlite>

In your terminal, create and execute the following queries:
- Delete the book created in Release 3
- Delete the author created in Release 3
- Delete the publisher created in Release 3

delete from books where title = 'The Joy of OO Programing';
delete from authors where name = 'Lisa Swanson';
delete from publishers where name = 'Lisa Swanson';

sqlite> select books.title, authors.name, publishers.name
   ...> from books join authors on books.author_id = authors.id
   ...> join publishers on books.publisher_id = publishers.id;
title                       name         name
--------------------------  -----------  ---------------------
Rails 4 Test Prescriptions  Noel Rappin  Pragmatic Programmers
Metaprogramming Ruby 2      Paolo Perro  Pragmatic Programmers
Programming Ruby 1.9 & 2.0  Dave Thomas  Pragmatic Programmers
Pragmatic Programmer        Dave Thomas  Addison-Wesley
Practical Object Oriented   Sandi Metz   Addison-Wesley
The Rails 4 Way             Obie Fernan  Addison-Wesley
Objective-C Programming     Aaron Hille  Big Nerd Ranch
iOS Programming             Aaron Hille  Big Nerd Ranch
JavaScript: The Good Parts  Douglas Cro  O'Reilly
JavaScript: The Definitive  David Flana  O'Reilly
Functional JavaScript       Michael Fog  O'Reilly
Build iOS Games with Sprit  Jonathan Pe  Pragmatic Programmers
Test iOS Apps with UI Auto  Jonathan Pe  Pragmatic Programmers
Design Patterns in Ruby     Russ Olsen   Addison-Wesley
Eloquent Ruby               Russ Olsen   Addison-Wesley
Web Design with HTML & CSS  Jon Duckett  Wiley
JavaScript and jQuery       Jon Duckett  Wiley
Well-Grounded Rubyist       David A. Bl  Manning Publications
Essential Algorithms        Rod Stephen  Wiley
Introduction to Algorithms  Thomas Corm  MIT Press
The Joy of OO Programming   Sandi Metz   Addison-Wesley
sqlite>




