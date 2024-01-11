-- create the database hbtn_0d_2
CREATE DATABASE IF NOT EXISTS hbtn_0d_2;

-- create the user user_0d_2
CREATE USER IF NOT EXISTS 'user_0d_2'@'localhost' IDENTIFIED BY 'user_0d_2_pwd';

-- set SELECT privilege in the database hbtn_0d_2 to user_0d_2
GRANT SELECT ON hbtn_0d_2.* TO user_0d_2@localhost;