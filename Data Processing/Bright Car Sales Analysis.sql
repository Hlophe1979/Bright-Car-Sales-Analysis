--        A) Exploratory Data Analysis

-------------------------------------------------------------------------------------------------------
-- 1) Viewing the first 100 rows
-------------------------------------------------------------------------------------------------------
select * from `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset` limit 100;

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
-- 2) Checking and handling the NULL values
-------------------------------------------------------------------------------------------------------
SELECT odometer,
        sellingprice,
        mmr
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
WHERE odometer IS NULL
OR sellingprice IS NULL
OR mmr IS NULL;

SELECT odometer,
        sellingprice,
        mmr,
        IFNULL(odometer, 0) AS replaced_odometer,
        IFNULL(sellingprice, 0) AS replaced_price,
        IFNULL(mmr, 0) AS replaced_mmr
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
-- 3) Analysis on the Categorical columns
-------------------------------------------------------------------------------------------------------

-- 3.1) Checking the different makes of our cars
SELECT DISTINCT make
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.2) Checking the different models of our cars
SELECT DISTINCT model
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.3) Checking the different trims of our cars
SELECT DISTINCT trim
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.4) Checking the different bodies of our cars
SELECT DISTINCT body
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.5) Checking the different transmissions of our cars
SELECT DISTINCT transmission
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.6) Checking the different states where we sell our cars
SELECT DISTINCT state
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.7) Checking the different colors of our cars
SELECT DISTINCT color
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.8) Checking the different interiors of our cars
SELECT DISTINCT interior
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 3.9) Checking the different sellers of our cars
SELECT DISTINCT seller
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
-- 4) Calculating the revenue and the selling/market price difference in Market price and Selling price
-------------------------------------------------------------------------------------------------------
SELECT  sellingprice,
        unitssold,
        (sellingprice * unitssold) AS revenue,
        (sellingprice - mmr) AS price_difference
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-- 4.1) Checking whether our cars are sold at Premium pricing, Discount pricing or Market price
SELECT sellingprice,
        mmr,
        CASE
                WHEN sellingprice > mmr THEN 'Premium Price'
                WHEN sellingprice < mmr THEN 'Discount Price'
                ELSE 'Market Price'
        END AS price_strategy
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
-- 5) Calculating the total selling price for different columns  
-------------------------------------------------------------------------------------------------------
-- Price per year
SELECT year,
        SUM(sellingprice) AS price_per_year
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY year;
-- 2013 cars have the highest selling price

-- Price per make
SELECT make,
        SUM(sellingprice) AS price_per_make
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY make;
-- Ford has the mmost highest selling price

-- Price per year
SELECT transmission,
        SUM(sellingprice) AS price_per_transmission
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY transmission;
-- The automatic transmission has the highest selling price

-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
-- 6) Calculating the revenue for various columns
-------------------------------------------------------------------------------------------------------
-- Revenue per car make
SELECT make,
        SUM(sellingprice * unitssold) AS revenue_per_make
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY make;
-- Ford generates the most revenue

-- Revenue per car model
SELECT model,
        SUM(sellingprice * unitssold) AS revenue_per_model
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY model;
-- F-150 generates the most revenue

-- Revenue for each car year
SELECT year,
        SUM(sellingprice * unitssold) AS revenue_per_year
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY year;
-- The cars from 2013 generated the most revenue

-- Revenue per transmission
SELECT transmission,
        SUM(sellingprice * unitssold) AS revenue_per_transmission
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY transmission;
-- Cars with the Automatic transmission generated the most revenue

-- Revenue per State
SELECT state,
        SUM(sellingprice * unitssold) AS revenue_per_state
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY state;
-- The state of Florida generated the most revenue in our car sales

-- Revenue per body type
SELECT body,
        SUM(sellingprice * unitssold) AS revenue_per_body
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY body;
-- The Sedan body type generates the most revenue, followed by the SUV

-- Revenue per Color
SELECT color,
        SUM(sellingprice * unitssold) AS revenue_per_color
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY color;
-- Black cars generate the most revenue, hence they are the most expensive

-- Revenue per car interior
SELECT interior,
        SUM(sellingprice * unitssold) AS revenue_per_interior
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY interior;
-- Cars with the black interior generate the most revenue

-- Revenue per Seller
SELECT seller,
        SUM(sellingprice * unitssold) AS revenue_per_seller
FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`
GROUP BY seller;
-- The financial services remarketing (lease) seller has generated us the most revenue

-------------------------------------------------------------------------------------------------------


--              B) Data Processing

SELECT year,
        make,
        model,
        body,
        transmission,
        state,
        color,
        interior,
        seller,
        unitssold,
        condition,
        
        -- Replacing NULL values with zero in 3 columns
        IFNULL(odometer, 0) AS clean_odometer,
        IFNULL(sellingprice, 0) AS clean_selling_price,
        IFNULL(mmr, 0) AS clean_mmr,

        --Calculating revenue and price difference
        (clean_selling_price * unitssold) AS revenue,
        (clean_selling_price - clean_mmr) AS price_difference,


        CASE
                WHEN clean_selling_price > clean_mmr THEN 'Premium Price'
                WHEN clean_selling_price < clean_mmr THEN 'Discount Price'
                ELSE 'Market Price'
        END AS price_strategy,

        CASE
                WHEN condition < 10 THEN 'Critical Condition'
                WHEN condition BETWEEN 10 AND 20 THEN 'Poor Condition'
                WHEN condition BETWEEN 21 AND 30 THEN 'Fair Condition'
                WHEN condition > 30 THEN 'Good Condition'
        END AS car_condition,

                CASE
                WHEN clean_selling_price < 30000 THEN 'Cheap'
                WHEN clean_selling_price BETWEEN 30000 AND 50000 THEN 'Affordable'
                WHEN clean_selling_price > 50000 THEN 'Expensive'
        END AS price_category,

        CASE
                WHEN clean_odometer < 500 THEN 'Very Low Milleage'
                WHEN clean_odometer BETWEEN 500 AND 1000 THEN 'Low Milleage'
                WHEN clean_odometer BETWEEN 1001 AND 5000 THEN 'Medium Milleage'
                WHEN clean_odometer BETWEEN 5001 AND 10000 THEN 'High Milleage'
                WHEN clean_odometer > 10000 THEN 'Very High Milleage'
        END AS milleage_classification  

FROM `bright_car_sales`.`car_sales_analysis`.`car_sales_dataset`;




