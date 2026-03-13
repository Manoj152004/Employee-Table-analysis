--Retrive the whole table?
SELECT * FROM employee;

-- Retrive the avg salary?
SELECT AVG(Salary) AS avg_salary
FROM employee;

--Retrive the min salary?
SELECT MIN(salary) AS MIN_SALARY
FROM employee;

--Retrive the maximum salary?
SELECT MAX(salary) AS max_salary
FROM employee;

--Retrive employe who have avg salary?
SELECT name,salary,age,sex,in_company_years,department FROM employee
WHERE salary >(SELECT AVG(Salary) AS avg_salary FROM employee) limit 5;

--Retrive minimum salary wise pepole?
SELECT name,salary,age,sex,in_company_years,department FROM employee
WHERE salary >(SELECT MIN(Salary) AS MIN_salary FROM employee) limit 5;

-- Retrive employe who salary greter tha 45thousand?
SELECT name,age,sex,insurance,marital_status,department,position
FROM employee
WHERE salary > 45000 LIMIT 5;

--Department wise employee count?
SELECT COUNT(name)AS total_emp,department
FROM employee
GROUP BY department
ORDER BY total_emp DESC;

-- Retrive employe whose salary greter than avg salary?
WITH maxx AS(
		SELECT indax, name,AVG(salary) AS avvg
		FROM employee
		GROUP BY indax,name
)		
SELECT e.name,
		e.salary,
		e.age,
		e.department,
		m.avvg
	FROM employee e
	INNER JOIN 
	maxx m
	ON e.indax = m.indax
	WHERE e.salary <= m.avvg ;

-- Retrive the employe count department wise?
SELECT name,salary,age,department,
ROW_NUMBER() OVER(PARTITION BY department) FROM employee;

--Dense rank wise
SELECT name,salary,age,department,
DENSE_RANK()OVER(PARTITION BY department ) AS row_wise_num
FROM employee;

--Retrive  salary wise ? 
SELECT name,salary,
 	CASE
	 WHEN salary>=80000 THEN 'above_avg_salary'
	 WHEN salary>=60000 THEN 'average'
	WHEN salary >=40000 THEN 'adjustable'
	ELSE 'low_salary'
	END AS salary
	FROM employee ;