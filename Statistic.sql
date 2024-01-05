SELECT * FROM comapany_division
LIMIT 5;

SELECT * FROM company_region
LIMIT 5;

SELECT * FROM staff
LIMIT 5;

/* How many total employees in this company */
SELECT COUNT(*) FROM staff;

/* Groupby gender */
SELECT gender, COUNT(*) AS total_employees
FROM staff
GROUP BY gender;

/* Number of employees in each department */
SELECT department,COUNT(*) AS total_employees FROM staff
GROUP BY department
ORDER BY department;

SELECT DISTINCT(department) FROM staff
ORDER BY department;

/* highest and lowest salary */
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM staff;

/* what about salary distribution by gender group? */
/* Data Interpretation: It seems like the average between male and female group is pretty close, with slighly higher average salary for Female group*/
SELECT gender, MIN(salary) As Min_Salary, MAX(salary) AS Max_Salary, AVG(salary) AS Average_Salary
FROM staff
GROUP BY gender;

/* How much total salary company is spending each year? */
SELECT SUM(salary)
FROM staff;

/* want to know distribution of min, max average salary by department */
/* Data Interpretation: It seems like Outdoors deparment has the highest average salary paid  and Jewelery department with lowest */
SELECT
	department, 
	MIN(salary) As Min_Salary, 
	MAX(salary) AS Max_Salary, 
	AVG(salary) AS Average_Salary, 
	COUNT(*) AS total_employees
FROM staff
GROUP BY department
ORDER BY 4 DESC;

/* Let's see Health department salary */
SELECT department, salary
FROM staff
WHERE department LIKE 'Health'
ORDER BY 2 ASC;

/* we will make 3 buckets to see the salary earning status for Health Department */
CREATE VIEW health_dept_earning_status
AS 
	SELECT 
		CASE
			WHEN salary >= 100000 THEN 'high earner'
			WHEN salary >= 50000 AND salary < 100000 THEN 'middle earner'
			ELSE 'low earner'
		END AS earning_status
	FROM staff
	WHERE department LIKE 'Health';


/* we can see that there are 24 high earners, 14 middle earners and 8 low earners */
SELECT earning_status, COUNT(*)
FROM health_dept_earning_status
GROUP BY 1;


/* Let's find out about Outdoors department salary */
SELECT department, salary
FROM staff
WHERE department LIKE 'Outdoors'
ORDER BY 2 ASC;


CREATE VIEW outdoors_dept_earning_status
AS 
	SELECT 
		CASE
			WHEN salary >= 100000 THEN 'high earner'
			WHEN salary >= 50000 AND salary < 100000 THEN 'middle earner'
			ELSE 'low earner'
		END AS earning_status
	FROM staff
	WHERE department LIKE 'Outdoors';
	
/* we can see that there are 34 high earners, 12 middle earners and 2 low earners */
SELECT earning_status, COUNT(*)
FROM outdoors_dept_earning_status
GROUP BY 1;

-- drop the unused views
DROP VIEW health_dept_earning_status;
DROP VIEW outdoors_dept_earning_status;

/* What are the deparment start with B */
SELECT
	DISTINCT(department)
FROM staff
WHERE department LIKE 'B%';