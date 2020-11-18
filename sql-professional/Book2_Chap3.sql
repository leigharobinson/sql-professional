--Book 2 Chap 3

SELECT
    first_name,
    last_name,
    email
FROM
    customers
INNER JOIN sales
    ON customers.customer_id = sales.customer_id;
	
SELECT
	first_name,
    last_name,
   	sale_id,
	sales_type_id
FROM
    customers
Left JOIN sales
    ON customers.customer_id = sales.customer_id;
	
	SELECT
	first_name,
    last_name,
   	sale_id,
	sales_type_id
FROM
    customers
Right JOIN sales
    ON customers.customer_id = sales.customer_id;
	
--Get a list of the sales that were made for each sales type.

SELECT 
	name,
	sales.sales_type_id,
	salesTypes.sales_type_id,
	payment_method,
	sale_id
FROM sales
Left Join salestypes
	ON sales.sales_type_id = salestypes.sales_type_id
	
SELECT 
	st.name AS sales_type,  s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned
FROM sales s
Left Join salestypes st
	ON s.sales_type_id = st.sales_type_id
	
SELECT 
	st.name AS sales_type, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned
FROM sales s
Left Join salestypes st
	ON s.sales_type_id = st.sales_type_id
	WHERE st.sales_type_id = 1;
	
-- Get a list of sales with the VIN of the vehicle,
--the first name and last name of the customer, 
--first name and last name of the employee who made the sale 
--and the name, city and state of the dealership.


SELECT s.sale_id, v.vin AS vinnumber, c.first_name, c.last_name,
e.first_name, e.last_name, d.business_name, d.city, d.state
FROM sales s
Left Join vehicles v
	ON s.vehicle_id = v.vehicle_id
Left Join customers c
	ON s.customer_id = c.customer_id
Left Join employees e
	ON s.employee_id = e.employee_id
Left JOIN dealerships d
	ON s.dealership_id = d.dealership_id;
	
--Get a list of all the dealerships and the employees, if any, working at each one.

SELECT d.business_name, e.first_name, e.last_name
FROM dealershipemployees de
Left Join dealerships d
	ON de.dealership_id = d.dealership_id
Left Join employees e
	ON de.employee_id = e.employee_id;
--WHERE d.dealership_id = 1;


--Get a list of vehicles with the names of the 
--body type, make, model and color.

SELECT v.vehicle_id, vt.vehicle_type_id, vbt.name AS bodytype, vmk.name AS make, vmod.name AS model
FROM vehicletypes vt
Left join vehicles v
	ON vt.vehicle_type_id = v.vehicle_type_id
Left join vehiclebodytype vbt
	ON vt.vehicle_body_type_id = vbt.vehicle_body_type_id
Left Join vehiclemake vmk
	ON vt.vehicle_make_id = vmk.vehicle_make_id
Left Join vehiclemodel vmod
	ON vt.vehicle_model_id = vmod.vehicle_model_id
WHERE vt.vehicle_type_id = 1;