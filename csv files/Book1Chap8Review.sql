SELECT * FROM employees;

SELECT * FROM customers;

INSERT INTO 
public.customers(first_name, last_name, email, phone, street, city, state, zipcode, company_name)
VALUES 
('Sarah', 'Robbins', 'SarahRob@gmail.com', '615-111-1111', '3 Chapel Hill', 'Brentwood', 'TN', '37027', 'Government'),
('Bobby', 'Bobbins', 'BobbyBob@gmail.com', '615-333-3333', '12 Chapel Hill', 'Brentwood', 'TN', '37027', 'The Club');

SELECT * FROM vehiclebodytype;
-- 1 = car   vehicle_body_type_id
-- 4 = SUV    ||
SELECT * FROM vehiclemodel;
-- insert Accord and Rogue
SELECT * FROM vehiclemake;
-- Nissan = 3 : Honda = 6


CREATE TABLE VehicleMake (
    vehicle_make_id INT,
    name VARCHAR(50)
);

INSERT INTO 
public.vehiclemake(vehicle_make_id, name)
VALUES 
(6, 'Honda');

INSERT INTO 
public.vehiclemodel(vehicle_model_id, name)
VALUES 
(17, 'Accord'),
(18, 'Rogue');

SELECT * FROM vehicletypes;

--Think of your dream car. In order to add this car to the Vehicles table,
--you might need to add data to the VehicleTypes table.
--Make sure the statements are ordered so that you can execute all your INSERT statements together.

INSERT INTO 
public.vehicletypes(vehicle_body_type_id, vehicle_make_id, vehicle_model_id)
VALUES 
(1, 6, 17),
(4, 3, 18);

SELECT * FROM employees
WHERE first_name = 'Kennie';

SELECT * FROM dealershipemployees
WHERE employee_id = 1001;
