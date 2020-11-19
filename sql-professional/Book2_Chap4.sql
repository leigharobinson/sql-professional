-- Find employees who haven't made any sales and the name of the dealership they work at.
SELECT
	e.first_name,
    e.last_name,
    d.business_name,
	s.price
FROM employees e
INNER JOIN dealershipemployees de ON e.employee_id = de.employee_id
INNER JOIN dealerships d ON d.dealership_id = de.dealership_id
LEFT JOIN sales s ON s.employee_id = e.employee_id
WHERE s.price IS NULL;

-- Get all the departments in the database,
-- all the employees in the database and the floor price of any vehicle they have sold.
SELECT
	d.business_name,
	e.first_name,
    e.last_name,
	v.floor_price
FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
INNER JOIN employees e ON e.employee_id = de.employee_id
INNER JOIN sales s ON s.employee_id = e.employee_id
INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id;

-- Use a self join to list all sales that will be picked up on the same day,
-- including the full name of customer picking up the vehicle. .
SELECT
	CONCAT  (c.first_name, ' ', c.last_name) AS last_name,
    s1.invoice_number,
    s1.pickup_date,
	s2.sale_id,
	s1.sale_id
FROM
    sales s1
INNER JOIN sales s2
    ON s1.sale_id <> s2.sale_id AND
       s1.pickup_date = s2.pickup_date
INNER JOIN customers c
	ON c.customer_id = s1.customer_id;
--Order by s1.sale_id;

-- Get employees and customers who have interacted through a sale.
-- Include employees who may not have made a sale yet.
-- Include customers who may not have completed a purchase.

SELECT
	e.first_name AS employee_first_name,
	e.last_name AS employee_last_name,
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name
FROM
	employees e
FULL OUTER JOIN sales s
        ON e.employee_id = s.employee_id
FULL OUTER JOIN customers c
        ON s.customer_id = c.customer_id;
		
-- Get a list of all dealerships and which roles each of the employees hold.
SELECT
	d.business_name,
	et.name
FROM dealerships d
LEFT JOIN dealershipemployees de
	ON d.dealership_id = de.dealership_id
INNER JOIN employees e
	ON de.employee_id = e.employee_id
RIGHT JOIN employeetypes et
	ON e.employee_type_id = et.employee_type_id;
	
	
--Produce a report that lists every dealership, 
--the number of purchases done by each, and the number of leases done by each.

SELECT 
	d.business_name,
	SUM (CASE WHEN s.sales_type_id = 1 then 1 else 0 end) AS number_of_purchases,
	SUM (CASE WHEN s.sales_type_id = (SELECT st.sales_type_id
				    FROM salestypes st
				    WHERE st.name = 'Lease') then 1 else 0 end) AS number_of_leases
		FROM sales s
		LEFT JOIN dealerships d ON s.dealership_id = d.dealership_id
		LEFT JOIN salestypes st ON s.sales_type_id = st.sales_type_id
		GROUP BY d.dealership_id;
				   
				   
-- Produce a report that determines the most popular vehicle model that is leased.

SELECT vmd.name, COUNT(vmd.name) AS number_of_leases
	FROM sales s
	Left join vehicles v ON s.vehicle_id = v.vehicle_id
	Left join vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	Left join vehiclemodel vmd ON vt.vehicle_model_id = vmd.vehicle_model_id
	Where s.sales_type_id = (SELECT st.sales_type_id 
							 FROM salestypes st
							 WHERE st.name = 'Lease')
	GROUP BY vmd.name
	--HAVING COUNT(vmd.name) > 150
	ORDER BY number_of_leases DESC
	limit 1;


--What is the most popular vehicle make in terms of number of sales?
	
SELECT vmk.name As most_popular_make, COUNT(vmk.name) AS number_of_sales
	FROM sales s
	Left join vehicles v ON s.vehicle_id = v.vehicle_id
	Left join vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	Left join vehiclemake vmk ON vt.vehicle_make_id = vmk.vehicle_make_id
	where s.sales_type_id = 1
	group by vmk.name
	order by count(s.sale_id) desc
	limit 1; 

--Which employee sold the most of that make??????
SELECT e.first_name, COUNT(s.employee_id) AS employee_sold_count
FROM sales s
	Left join employees e ON s.employee_id = e.employee_id
	Left join vehicles v ON s.vehicle_id = v.vehicle_id
	Left join vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	Left join vehiclemake vmk ON vt.vehicle_make_id = vmk.vehicle_make_id
	where s.sales_type_id = 1 AND vmk.name = 'Nissan'
	group by e.first_name
	order by employee_sold_count desc;

--Which employee type sold the most of that make?
SELECT
	et.name AS department, count(vmk.vehicle_make_id) AS nissan_sales
FROM sales s
INNER JOIN vehicles v
ON v.vehicle_id = s.vehicle_id
INNER JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
INNER JOIN vehiclemake vmk
ON vmk.vehicle_make_id = vt.vehicle_make_id
INNER JOIN employees e
ON e.employee_id = s.employee_id
INNER JOIN employeetypes et
ON et.employee_type_id = e.employee_type_id
WHERE vt.vehicle_make_id = (SELECT vehicle_make_id
						    FROM vehiclemake
						    WHERE name = 'Nissan')
GROUP BY et.name
ORDER BY Nissan_sales DESC

