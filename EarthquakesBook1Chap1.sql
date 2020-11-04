create table Earthquake ( 
	earthquake_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
	occurred_on TIMESTAMP,
	latitude VARCHAR(50),
	longitude VARCHAR(50),
	depth VARCHAR(50),
	magnitude VARCHAR(50),
	calculaiton_method VARCHAR(50),
	network_id VARCHAR(50),
	place VARCHAR(150),
	cause VARCHAR(50)
);

SELECT * FROM earthquake;
