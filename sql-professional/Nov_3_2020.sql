-- Chap 8

INSERT INTO 
public.customers(first_name, last_name, email, phone, street, city, state, zipcode, company_name)
VALUES 
('Sarah', 'Robbins', 'SarahRob@gmail.com', '615-111-1111', '3 Chapel Hill', 'Brentwood', 'TN', '37027', 'Government'),
('Billy', 'Robbins', 'BillyRob@gmail.com', '615-222-2222', '3 Chapel Hill', 'Brentwood', 'TN', '37027', 'Baby-sitter Club’);



INSERT INTO 
public.vehicletypes(body_type, make, model)
VALUES 
('car', 'Honda', 'Accord'),
('SUV', 'Nissan', 'Rogue’);

SELECT * FROM employees;

INSERT INTO
public.employees(first_name, last_name, email_address, phone, employee_type_id)
VALUES
('Kennie', 'Maharg', 'kmaharge@com.com', '598-678-4885', 4);

INSERT INTO
public.dealershipemployees(dealership_id, employee_id)
VALUES
(1, 1001),
(2, 1001),
(3, 1001);

--Create Tables
CREATE TABLE VehicleBodyType (
    vehicle_body_type_id INT,
    name VARCHAR(50)
);

CREATE TABLE VehicleModel (
    vehicle_model_id INT,
    name VARCHAR(50)
);
CREATE TABLE VehicleMake (
    vehicle_make_id INT,
    name VARCHAR(50)
);

SELECT * FROM vehiclebodytype;

UPDATE vehicleTypes 
SET body_type =  CASE  
                    WHEN body_type = 'Car' THEN '1' 
                    WHEN body_type = 'Truck' THEN '2'
                    WHEN body_type = 'Van' THEN '3'
                    WHEN body_type = 'SUV' THEN '4'
                    ELSE null
                 END ;
                 
UPDATE vehicleTypes                  
SET      make = CASE  
                    WHEN make = 'Chevrolet' THEN '1' 
                    WHEN make = 'Mazda' THEN '2'
                    WHEN make = 'Nissan' THEN '3'
                    WHEN make = 'Ford' THEN '4'
                    WHEN make = 'Volkswagen' THEN '5'
                    WHEN make = 'Honda' THEN '6'
                    ELSE null
                  END ;
                  
UPDATE vehicleTypes 
SET     model =  CASE  
                    WHEN model = 'Corvette' THEN '1' 
                    WHEN model = 'Blazer' THEN '2'
                    WHEN model = 'Silverado' THEN '3'
                    WHEN model = 'MX-5 Miata' THEN '4'
                    WHEN model = 'CX-5' THEN '5'
                    WHEN model = 'CX-9' THEN '6' 
                    WHEN model = 'Maxima' THEN '7'
                    WHEN model = 'Altima' THEN '8'
                    WHEN model = 'Titan' THEN '9'
                    WHEN model = 'Fusion' THEN '10'
                    WHEN model = 'EcoSport' THEN '11'
                    WHEN model = 'F-250' THEN '12'
                    WHEN model = 'Beetle' THEN '13'
                    WHEN model = 'Passat' THEN '14'
                    WHEN model = 'Atlas' THEN '15'
                    WHEN model = 'Transit-150 Cargo' THEN '16'
                    ELSE null
                 END ;

SELECT * FROM vehicletypes;



create table VehicleTypes (
  vehicle_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  body_type VARCHAR(5),
  make VARCHAR(50),
  model VARCHAR(50)
);

 ALTER TABLE VehicleTypes
 ALTER Column body_type TYPE INT 
 USING body_type::integer;
 
 SELECT * FROM VehicleTypes;
 
 ALTER TABLE VehicleTypes
 ALTER Column make TYPE INT 
 USING make::integer;
 
 ALTER TABLE VehicleTypes
 ALTER Column model TYPE INT 
 USING model::integer;

  SELECT * FROM sales s
  WHERE s.sales_type_id = 2;
  --Doesn't work
  SELECT * FROM sales s
  WHERE purchase_date > current_date - 2;
  
  SELECT *
  FROM sales
  WHERE deposit >= 5000
  AND payment_method = 'americanexpress';
  
  --Question for 4
  SELECT e.first_name
  FROM employees e WHERE first_name LIKE 'M%' OR first_name LIKE '%e';
  
  --Question 5 
  SELECT
   e.phone
   FROM employees e
   WHERE phone LIKE '600%’;


ALTER TABLE vehicleTypes
   ADD CONSTRAINT FK_vehicleTypes_vehicleBodyType FOREIGN KEY (vehicle_body_type_id)
      REFERENCES vehicleBodyType (vehicle_body_type_id),
   ADD CONSTRAINT FK_vehicleTypes_vehicleModel FOREIGN KEY (vehicle_model_id)
      REFERENCES vehicleModel (vehicle_model_id),
   ADD CONSTRAINT FK_vehicleTypes_vehicleMake FOREIGN KEY (vehicle_make_id)
      REFERENCES vehicleMake (vehicle_make_id);