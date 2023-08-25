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

