SELECT * FROM sql_project_2.`sql - retail sales analysis_utf`
limit 10; 
select count(*)
FROM sql_project_2.`sql - retail sales analysis_utf`;
select * FROM sql_project_2.`sql - retail sales analysis_utf`
where transactions_id is null;
select * FROM sql_project_2.`sql - retail sales analysis_utf`
where sale_date is null;
select * FROM sql_project_2.`sql - retail sales analysis_utf`
where ï»¿transactions_id is null;

ALTER TABLE `sql_project_2`.`sql - retail sales analysis_utf`
RENAME COLUMN `ï»¿transactions_id` TO `transaction_id`;
SELECT * FROM `sql_project_2`.`sql - retail sales analysis_utf`
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    select count(*) as total_sales 
    FROM sql_project_2.`sql - retail sales analysis_utf`;
    select category,gender,sum(total_sale) as total_sale ,count(*) as total_order
     FROM sql_project_2.`sql - retail sales analysis_utf`
     group by 1,2
     order by total_sale desc;
     -- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and
	 -- the quantity sold is more than 4 in the month of Nov-2022
     select*from sql_project_2.`sql - retail sales analysis_utf`
     where category = 'Clothing'
     and
     sale_date >= '2022-11-01'
     and
     sale_date < '2022-12-01';
     
     select category, sum(total_sale) as total_sale, count(*) as total_orders
     from sql_project_2.`sql - retail sales analysis_utf`
      where category = 'Clothing'
     and
     sale_date >= '2022-11-01'
     and
     sale_date < '2022-12-01'
     group by category;
  -- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
  select category, round(avg(age),2) as avg_age
  from sql_project_2.`sql - retail sales analysis_utf`
  where category= 'Beauty'
  group by 1;
  -- Write a SQL query to find all transactions where the total_sale is greater than 1000.
  select *  from sql_project_2.`sql - retail sales analysis_utf`
  where total_sale>1000; 
  -- Write a SQL query to find the total number of transactions (transaction_id) 
  -- made by each gender in each category.
  select gender,category,count(*) as total_orders
  from sql_project_2.`sql - retail sales analysis_utf`
   group by 1,2
   order by 1;
   -- Write a SQL query to calculate the average sale for each month.
   -- Find out best selling month in each year
  WITH monthly_avg AS (
    SELECT
        YEAR(sale_date) AS sales_year,
        MONTH(sale_date) AS sales_month,
        ROUND(AVG(total_sale), 2) AS avg_sale
    FROM `sql_project_2`.`sql - retail sales analysis_utf`
    GROUP BY YEAR(sale_date), MONTH(sale_date)
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (
               PARTITION BY sales_year
               ORDER BY avg_sale DESC
           ) AS rnk
    FROM monthly_avg
) t
WHERE rnk = 1;
-- another method
  SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rnk
FROM `sql_project_2`.`sql - retail sales analysis_utf`
GROUP BY 1, 2
) as t1
WHERE rnk = 1;
-- Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,sum(total_sale) as total_sale
FROM `sql_project_2`.`sql - retail sales analysis_utf`
group by customer_id
order by total_sale desc
limit 5;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select count( distinct customer_id) as unique_customer ,category
FROM `sql_project_2`.`sql - retail sales analysis_utf`
group by category;

 -- Write a SQL query to create each shift and number of orders (Example Morning <12, 
 -- Afternoon Between 12 & 17, Evening >17)
 
 select
 CASE 
 WHEN HOUR (sale_time)<12 then 'morning'
 when hour (sale_time) between 12 and 7 then 'noon'
 else 'night'
 END AS shift,
 count(*) as total_orders
 FROM `sql_project_2`.`sql - retail sales analysis_utf`
 group by shift
 order by total_orders desc;
 
 
 
  
  
     
          
     
    
    

