
-- 1. Pull total number of orders that were completed on 18th March 2023
SELECT COUNT(*) FROM sales WHERE date = '03-18-2023';

-- 2. Pull total number of orders that were completed on 18th March 2023 with the first name ‘John’ and last name ‘Doe’
SELECT COUNT(*) 
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
WHERE date = '03-18-2023'
AND c.first_name = 'John'
AND c.last_name = 'Doe';

-- 3. Pull total number of customers that purchased in January 2023 and the average amount spend per customer
SELECT COUNT(DISTINCT customer_id), 
AVG(revenue) 
FROM sales
WHERE date BETWEEN 
'01-01-2023' AND '01-31-2023';

-- 4. Pull the departments that generated less than $600 in 2022
SELECT i.department_name, SUM(s.revenue)
FROM sales s
JOIN items i
ON s.item_id = i.item_id
WHERE date BETWEEN '01-01-2022' AND '12-31-2022'
GROUP BY i.department_name
HAVING SUM(s.revenue) < 600;

-- 5. What is the most and least revenue we have generated by an order
SELECT MAX(revenue), MIN(revenue)
FROM sales;

-- 6. What were the orders that were purchased in our most lucrative order
SELECT *
FROM sales
WHERE revenue = (SELECT MAX(revenue) FROM sales);
