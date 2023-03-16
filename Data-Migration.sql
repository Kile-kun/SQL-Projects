/*CREATE DATABASE USING INLINE METHOD BECAUSE OF IT'S DATA UPLOAD AUTOMATION ADVANTAGE*/
DROP DATABASE IF EXISTS dm_db;
CREATE DATABASE dm_db;
USE dm_db;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
			RowNumber		INT,
			CustomerId		INT,
			Surname			VARCHAR(256),
			CreditScore		INT,
			Geography		VARCHAR(256),
			Gender			ENUM ('Male', 'Female'),
			Age				INT,
			Tenure			INT,
			Balance			DECIMAL(10,2),
			NumOfProducts	INT,
			HasCrCard		ENUM ('1', '0'),
			IsActiveMember	ENUM ('1', '0'),
			EstimatedSalary	DECIMAL(10,2),
	PRIMARY KEY (customerId)
);
USE dm_db;
SET GLOBAL LOCAL_INFILE=true;
LOAD DATA LOCAL INFILE 'C:/Users/babat/OneDrive/Documents/Tech1M DA Bootcamp/Project/Data Migration Project/DM_Dataset_CSV.csv'
INTO TABLE customer
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES
TERMINATED BY '\n'
IGNORE 1 ROWS;

/* CHECK DATA FOR CONFIRMATION*/
USE dm_db;
SELECT * FROM customer;

/*EXPLORATORY DATA ANALYSIS*/

/*Data Distribution*/

/*Geography Distribution of Customers*/
USE dm_db;
SELECT Geography, COUNT(Geography) AS NoOfCustomers
FROM customer
GROUP BY Geography
ORDER BY NoOfCustomers;

/*Gender Distribution of Customers*/
USE dm_db;
SELECT Gender, COUNT(Gender) AS NoOfCustomers
FROM customer
GROUP BY Gender
ORDER BY NoOfCustomers;

/*Age Distribution of Customers*/
USE dm_db;
SELECT Age, COUNT(Age) AS NoOfCustomers
FROM customer
GROUP BY Age
ORDER BY Age;

/*Group Age of Customers Into Clusters
USE dm_db;
SELECT Age, COUNT(Age) AS NoOfCustomers
FROM customer
GROUP BY Age
ORDER BY Age;*/

/*Customers Year of Patronage Distribution*/
USE dm_db;
SELECT Tenure, COUNT(Tenure) AS NoOfCustomers
FROM customer
GROUP BY Tenure
ORDER BY Tenure;

/*Product Purchase Distribution*/
USE dm_db;
SELECT NumOfProducts, COUNT(NumOfProducts) AS NoOfCustomers
FROM customer
GROUP BY NumOfProducts
ORDER BY NoOfCustomers;

/*Customers Credit Card Ownership Distribution*/
SELECT CASE HasCrCard 
           WHEN '1' THEN 'Yes' 
           ELSE 'No' 
       END AS HasCrCard,
		COUNT(HasCrCard) AS NoOfCustomers
FROM customer
GROUP BY HasCrCard;

/*Customers Patronage Activeness Distribution*/
SELECT CASE IsActiveMember
           WHEN '1' THEN 'Active' 
           ELSE 'Inactive' 
       END AS IsActiveMember,
		COUNT(IsActiveMember) AS NoOfCustomers
FROM customer
GROUP BY IsActiveMember;
