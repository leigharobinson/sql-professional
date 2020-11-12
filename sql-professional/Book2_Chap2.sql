SELECT
	last_name, first_name, city, state
FROM
	customers
WHERE
	state = 'TX';
	
SELECT
	last_name, first_name, city, state
FROM
	customers
WHERE
	city = 'Houston' AND state = 'TX';
	
SELECT
	last_name, first_name, city, state
FROM
	customers
WHERE
	state = 'TX' OR state = 'TN';

SELECT
	last_name, first_name, city, state
FROM
	customers
WHERE
	state IN ('TX', 'TN', 'CA');
	
SELECT
	last_name, first_name, city, state
FROM
	customers
WHERE
	state LIKE 'C%';
	
SELECT
	last_name, first_name
FROM
	customers
WHERE
	LENGTH(last_name) > 5 AND LENGTH(first_name) <= 7;
	
SELECT
	last_name, first_name, company_name
FROM
	customers
WHERE
	company_name IS NULL;
	
-- Book 2 Chap 2 Questions
-- 1. Get a list of sales records where the sale was a lease.

SELECT *
FROM sales
WHERE sales_type_id = 3;


-- 2. Get a list of sales where the purchase date is within the last two years.

SELECT *
FROM sales
WHERE 
purchase_date between '2017/01/01' AND '2020/01/01';

-- 3. Get a list of sales where the deposit was above 
--5000 or the customer payed with American Express.

SELECT *
FROM sales
WHERE payment_method Like 'americane%' AND deposit >= 5000;

-- 4. Get a list of employees whose first names start with "M" or ends with "E".

SELECT *
FROM employees
Where first_name like 'M%' AND last_name like lower('%E');

-- 5. Get a list of employees whose phone numbers have the 600 area code.
-- the answer is going to be none 

SELECT *
FROM employees
Where phone like '600%';

