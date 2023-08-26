CREATE DATABASE xyz;
USE xyz;
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);

INSERT INTO employee (id, name, salary)
VALUES (1, "Abhishek", 50000),
	   (2, "Bobby", 500000),
       (3, "Abhishek Kumara", 8000000);
       

SELECT * FROM employee WHERE salary > 50000;

CREATE TABLE s(
	id INT UNIQUE PRIMARY KEY,
    name VARCHAR(100),
    roll_number INT UNIQUE
);

INSERT INTO s(id, name, roll_number) 
VALUES (1, "Abhishek", 1);

SELECT * FROM s;

CREATE TABLE temp(
	id INT,
    name VARCHAR(100),
    address VARCHAR(100),
    PRIMARY KEY(id, name)
);

INSERT INTO temp(id, name, address) VALUES (1, "Bobby", "Mysore");

SELECT * FROM temp;

CREATE TABLE temp1(
	id INT,
    FOREIGN KEY (id) REFERENCES employee(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
    -- to update in both the tables 
);

INSERT INTO temp1(id) VALUES (1);

SELECT * FROM temp1;

-- use check for if else statement, while inserting into table
-- CONSTRAINT age CHECK (age => 18)


SELECT distinct city from college; -- distinct -> unique

SELECT * FROM employee WHERE salary = 5000000; -- -> WHERE CLAUSE
SELECT * FROM employee ORDER BY id ASC; -- -> DESC

-- Aggregate function

SELECT MAX(marks) from student; -- Collects all the marks and displays the max one
-- MIN()
-- AVG()
-- COUNT()


-- GROUP BY
-- GENERALLY we use aggregation and group by togather

SELECT id, COUNT(name) from employee GROUP BY id;
-- or 
SELECT city, count(name) from student GROUP BY student;

select city, COUNT(roll_number)
from student
group by city;

-- write a query to find avg marks in each city in ascending order

SELECT city, AVG(marks)
FROM student
GROUP BY city 
ORDER BY city ASC;

-- Find total payment according to each payment method

SELECT mode, count(customer)
from payment
group by mode;

-- HAVING CLAUSE conditionals for group by 

SELECT city, count(roll_number)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

-- UPDATE , also turn off safe mode
SET SQL_SAFE_UPDATES = 0;  -- 0 = off, 1 = on
UPDATE temp1
SET grade = "O"
WHERE grade = "A";
-- use SET AND WHERE CLAUSE togather while updating 

-- DELETE
DELETE FROM student
where marks > 33; 

-- Alter is used to add delete and rename the coloumn

ALTER table temp1
add column age INT;

ALTER table temp1
DROP column age;


-- use truncate to delete all the data from a table

TRUNCATE table temp;

--  To combine multiple tables or two tables we use joins
-- INNER JOIN -> Returns records that have matching values in both tables

SELECT *
FROM tableA
INNER JOIN tableB
ON tableA.col_name = tableB.col_name;

-- LEFT JOIN - Returns all records from the left table, and the matched records from the right table 

SELECT *
FROM tableA AS A
LEFT JOIN tableB AS B
ON A.id = B.id;

-- RIGHT JOIN -> Returns all records from the right table, and the matched records from the left table 

SELECT *
FROM Student_table as s
RIGHT JOIN Course_table as c
ON s.id = c.id;

-- FULL JOIN -> Returns all records when there is a match in either left or right table
-- IN other dbs like oracle and PSQL we can directly use FULL JOIN or FULL OUTER JOIN command but in MySQL 
-- we have to use UNION command  
SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL
UNION
SELECT *
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;

-- SELF join -> It is a regular join but the table is joined with itself

SELECT * 
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;

-- and

SELECT a.name AS manager_id, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id; 


-- UNION

-- It is used to combine the result-set of two or more SELECT statements.
-- Gives UNIQUE records.
-- every SELECT should have same no. of columns
-- columns must have similar data types
-- columns in every SELECT should be in same order
-- Syntax
SELECT * FROM tableA
UNION
SELECT * FROM tableB

-- sub queries combination of 2 queries

SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);
