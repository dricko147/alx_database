

Project badge
SQL - More queries
SQLMySQL

    Amateur
    By: Guillaume, CTO at Holberton School
    Weight: 1
    Your score will be updated once you launch the project review.
    Project will start Jan 6, 2024 12:00 AM, must end by Jan 11, 2024 11:59 PM

Resources

Read or watch:

    How To Create a New User and Grant Permissions in MySQL
    How To Use MySQL GRANT Statement To Grant Privileges To a User
    MySQL constraints
    SQL technique: subqueries
    Basic query operation: the join
    SQL technique: multiple joins and the distinct keyword
    SQL technique: join types
    SQL technique: union and minus
    MySQL Cheat Sheet
    The Seven Types of SQL Joins
    MySQL Tutorial
    SQL Style Guide
    MySQL 5.7 SQL Statement Syntax

Extra resources around relational database model design:

    Design
    Normalization
    ER Modeling

Learning Objectives

At the end of this project, you are expected to be able to explain to anyone, without the help of Google:
General

    How to create a new MySQL user
    How to manage privileges for a user to a database or table
    What’s a PRIMARY KEY
    What’s a FOREIGN KEY
    How to use NOT NULL and UNIQUE constraints
    How to retrieve datas from multiple tables in one request
    What are subqueries
    What are JOIN and UNION

Requirements
General

    Recommended editors: Visual studio code
    All your files will be executed on Ubuntu 20.04 LTS using MySQL 5.7 (version 5.7.8-rc)
    All your files should end with a new line
    All your SQL queries should have a comment just before (i.e. syntax above)
    All your files should start by a comment describing the task
    All SQL keywords should be in uppercase (SELECT, WHERE…)
    A README.md file, at the root of the folder of the project, is mandatory
    The length of your files will be tested using wc

More Info
Comments for your SQL file:

$ cat my_script.sql
-- 3 first students in the Batch ID=3
-- because Batch 3 is the best!
SELECT id, name FROM students WHERE batch_id = 3 ORDER BY created_at DESC LIMIT 3;
$

Install MySQL 5.7 on Ubuntu 20.04 LTS

$ echo 'deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7-dmr' | sudo tee -a /etc/apt/sources.list
$ sudo apt-get update
$ sudo apt-get install mysql-server-5.7
...
$ mysql --version
mysql  Ver 14.14 Distrib 5.7.8-rc, for Linux (x86_64) using  EditLine wrapper
$

Don’t forget your root password

If you had before MySQL 5.5 installed, please run these 2 commands after the installation of the version 5.7:

$ mysql_upgrade -u root -p
Password: 
$ sudo service mysql restart

If you have some issues to upgrade to 5.7, don’t hesitate to cleanup your server of any MySQL packages: sudo apt-get remove --purge mysql-server mysql-client mysql-common
Use “container-on-demand” to run MySQL

    Ask for container Ubuntu 20.04 - Python 3.4
    Connect via SSH
    Or via the WebTerminal
    In the container, you should start MySQL before playing with it:

$ service mysql start
 * MySQL Community Server 5.7.8-rc is started
$
$ cat 0-list_databases.sql | mysql -uroot -p my_database
Enter password: 
Database
information_schema
mysql
performance_schema
sys
$

In the container, credentials are root/root
How to import a SQL dump

$ echo "CREATE DATABASE hbtn_0d_tvshows;" | mysql -uroot -p
Enter password: 
$ curl "https://s3.amazonaws.com/intranet-projects-files/holbertonschool-higher-level_programming+/274/hbtn_0d_tvshows.sql" -s | mysql -uroot -p hbtn_0d_tvshows
Enter password: 
$ echo "SELECT * FROM tv_genres" | mysql -uroot -p hbtn_0d_tvshows
Enter password: 
id  name
1   Drama
2   Mystery
3   Adventure
4   Fantasy
5   Comedy
6   Crime
7   Suspense
8   Thriller
$

Live Learning Session for this project
Quiz questions
Great! You've completed the quiz successfully! Keep going! (Show quiz)
Tasks
0. My privileges!
mandatory

Write a script that lists all privileges of the MySQL users user_0d_1 and user_0d_2 on your server (in localhost).

guillaume@ubuntu:~/$ cat 0-privileges.sql | mysql -hlocalhost -uroot -p
Enter password: 
ERROR 1141 (42000) at line 4: There is no such grant defined for user 'user_0d_1' on host 'localhost'
guillaume@ubuntu:~/$ 
guillaume@ubuntu:~/$ echo "CREATE USER 'user_0d_1'@'localhost';" |  mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ echo "GRANT ALL PRIVILEGES ON *.* TO 'user_0d_1'@'localhost';" |  mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ cat 0-privileges.sql | mysql -hlocalhost -uroot -p
Enter password: 
Grants for user_0d_1@localhost
GRANT ALL PRIVILEGES ON *.* TO 'user_0d_1'@'localhost'
ERROR 1141 (42000) at line 4: There is no such grant defined for user 'user_0d_2' on host 'localhost'
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 0-privileges.sql

0/4 pts
1. Root user
mandatory

Write a script that creates the MySQL server user user_0d_1.

    user_0d_1 should have all privileges on your MySQL server
    The user_0d_1 password should be set to user_0d_1_pwd
    If the user user_0d_1 already exists, your script should not fail

guillaume@ubuntu:~/$ cat 1-create_user.sql | mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ cat 0-privileges.sql | mysql -hlocalhost -uroot -p
Enter password: 
Grants for user_0d_1@localhost
GRANT ALL PRIVILEGES ON *.* TO 'user_0d_1'@'localhost'
ERROR 1141 (42000) at line 4: There is no such grant defined for user 'user_0d_2' on host 'localhost'
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 1-create_user.sql

0/2 pts
2. Read user
mandatory

Write a script that creates the database hbtn_0d_2 and the user user_0d_2.

    user_0d_2 should have only SELECT privilege in the database hbtn_0d_2
    The user_0d_2 password should be set to user_0d_2_pwd
    If the database hbtn_0d_2 already exists, your script should not fail
    If the user user_0d_2 already exists, your script should not fail

guillaume@ubuntu:~/$ cat 2-create_read_user.sql | mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ cat 0-privileges.sql | mysql -hlocalhost -uroot -p
Enter password: 
Grants for user_0d_1@localhost
GRANT ALL PRIVILEGES ON *.* TO 'user_0d_1'@'localhost'
Grants for user_0d_2@localhost
GRANT USAGE ON *.* TO 'user_0d_2'@'localhost'
GRANT SELECT ON `hbtn_0d_2`.* TO 'user_0d_2'@'localhost'
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 2-create_read_user.sql

0/6 pts
3. Always a name
mandatory

Write a script that creates the table force_name on your MySQL server.

    force_name description:
        id INT
        name VARCHAR(256) can’t be null
    The database name will be passed as an argument of the mysql command
    If the table force_name already exists, your script should not fail

guillaume@ubuntu:~/$ cat 3-force_name.sql | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'INSERT INTO force_name (id, name) VALUES (89, "Holberton School");' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM force_name;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
guillaume@ubuntu:~/$ echo 'INSERT INTO force_name (id) VALUES (333);' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
ERROR 1364 (HY000) at line 1: Field 'name' doesn't have a default value
guillaume@ubuntu:~/$ echo 'SELECT * FROM force_name;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 3-force_name.sql

0/6 pts
4. ID can't be null
mandatory

Write a script that creates the table id_not_null on your MySQL server.

    id_not_null description:
        id INT with the default value 1
        name VARCHAR(256)
    The database name will be passed as an argument of the mysql command
    If the table id_not_null already exists, your script should not fail

guillaume@ubuntu:~/$ cat 4-never_empty.sql | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'INSERT INTO id_not_null (id, name) VALUES (89, "Holberton School");' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM id_not_null;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
guillaume@ubuntu:~/$ echo 'INSERT INTO id_not_null (name) VALUES ("Holberton");' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM id_not_null;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
1   Holberton
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 4-never_empty.sql

0/6 pts
5. Unique ID
mandatory

Write a script that creates the table unique_id on your MySQL server.

    unique_id description:
        id INT with the default value 1 and must be unique
        name VARCHAR(256)
    The database name will be passed as an argument of the mysql command
    If the table unique_id already exists, your script should not fail

guillaume@ubuntu:~/$ cat 5-unique_id.sql | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'INSERT INTO unique_id (id, name) VALUES (89, "Holberton School");' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM unique_id;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
guillaume@ubuntu:~/$ echo 'INSERT INTO unique_id (id, name) VALUES (89, "Holberton");' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
ERROR 1062 (23000) at line 1: Duplicate entry '89' for key 'id'
guillaume@ubuntu:~/$ echo 'SELECT * FROM unique_id;' | mysql -hlocalhost -uroot -p hbtn_0d_2
Enter password: 
id  name
89  Holberton School
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 5-unique_id.sql

0/6 pts
6. States table
mandatory

Write a script that creates the database hbtn_0d_usa and the table states (in the database hbtn_0d_usa) on your MySQL server.

    states description:
        id INT unique, auto generated, can’t be null and is a primary key
        name VARCHAR(256) can’t be null
    If the database hbtn_0d_usa already exists, your script should not fail
    If the table states already exists, your script should not fail

guillaume@ubuntu:~/$ cat 6-states.sql | mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ echo 'INSERT INTO states (name) VALUES ("California"), ("Arizona"), ("Texas");' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM states;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  name
1   California
2   Arizona
3   Texas
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 6-states.sql

0/6 pts
7. Cities table
mandatory

Write a script that creates the database hbtn_0d_usa and the table cities (in the database hbtn_0d_usa) on your MySQL server.

    cities description:
        id INT unique, auto generated, can’t be null and is a primary key
        state_id INT, can’t be null and must be a FOREIGN KEY that references to id of the states table
        name VARCHAR(256) can’t be null
    If the database hbtn_0d_usa already exists, your script should not fail
    If the table cities already exists, your script should not fail

guillaume@ubuntu:~/$ cat 7-cities.sql | mysql -hlocalhost -uroot -p
Enter password: 
guillaume@ubuntu:~/$ echo 'INSERT INTO cities (state_id, name) VALUES (1, "San Francisco");' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
guillaume@ubuntu:~/$ echo 'SELECT * FROM cities;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  state_id    name
1   1   San Francisco
guillaume@ubuntu:~/$ echo 'INSERT INTO cities (state_id, name) VALUES (10, "Paris");' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
ERROR 1452 (23000) at line 1: Cannot add or update a child row: a foreign key constraint fails (`hbtn_0d_usa`.`cities`, CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`))
guillaume@ubuntu:~/$ echo 'SELECT * FROM cities;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  state_id    name
1   1   San Francisco
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 7-cities.sql

0/6 pts
8. Cities of California
mandatory

Write a script that lists all the cities of California that can be found in the database hbtn_0d_usa.

    The states table contains only one record where name = California (but the id can be different, as per the example)
    Results must be sorted in ascending order by cities.id
    You are not allowed to use the JOIN keyword
    The database name will be passed as an argument of the mysql command

guillaume@ubuntu:~/$ echo 'SELECT * FROM states;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  name
1   California
2   Arizona
3   Texas
4   Utah
guillaume@ubuntu:~/$ echo 'SELECT * FROM cities;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  state_id    name
1   1   San Francisco
2   1   San Jose
4   2   Page
6   3   Paris
7   3   Houston
8   3   Dallas
guillaume@ubuntu:~/$ cat 8-cities_of_california_subquery.sql | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  name
1   San Francisco
2   San Jose
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 8-cities_of_california_subquery.sql

0/6 pts
9. Cities by States
mandatory

Write a script that lists all cities contained in the database hbtn_0d_usa.

    Each record should display: cities.id - cities.name - states.name
    Results must be sorted in ascending order by cities.id
    You can use only one SELECT statement
    The database name will be passed as an argument of the mysql command

guillaume@ubuntu:~/$ echo 'SELECT * FROM states;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  name
1   California
2   Arizona
3   Texas
4   Utah
guillaume@ubuntu:~/$ echo 'SELECT * FROM cities;' | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  state_id    name
1   1   San Francisco
2   1   San Jose
4   2   Page
6   3   Paris
7   3   Houston
8   3   Dallas
guillaume@ubuntu:~/$ cat 9-cities_by_state_join.sql | mysql -hlocalhost -uroot -p hbtn_0d_usa
Enter password: 
id  name    name
1   San Francisco   California
2   San Jose    California
4   Page    Arizona
6   Paris   Texas
7   Houston Texas
8   Dallas  Texas
guillaume@ubuntu:~/$ 

Repo:

    GitHub repository: alx_database
    Directory: SQL_more_queries
    File: 9-cities_by_state_join.sql

0/6 pts
Score
Project badge

Your score will be updated once you launch the project review.

Please review all the tasks before you start the peer review.
Previous project
Copyright © 2024 ALX, All rights reserved.
