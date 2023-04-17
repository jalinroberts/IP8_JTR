-- 1. Print all rows and columns of the dataset
SELECT * FROM customer;
SELECT * FROM order_line;
SELECT * FROM orders;
SELECT * FROM part;
SELECT * FROM sales_rep;

-- 2. All rows, last name , first name, sales rep number, city from sales rep table 
SELECT last_name, first_name, sales_rep_num, city FROM sales_rep;

-- 3. Select order and customer number from orders
SELECT order_num, customer_num FROM orders;

-- 4. Select only two rows from order line
SELECT * FROM order_line LIMIT 2; 

-- 5. Select all of the entries from customer where sales rep num=20
SELECT * FROM customer 
WHERE sales_rep_num = 20;

-- 6. Select only customer name, balance, credit limit from customer where sales rep num=20
SELECT customer_name, balance, credit_limit FROM customer 
WHERE sales_rep_num = 20;

-- 7. Select part num, num ordered, quoted price and total price where total price is (num_ordered * quoted_price) where only 1 num ordered and the order number is 21617
SELECT part_num, num_ordered, quoted_price, (num_ordered * quoted_price) AS total_price
FROM order_line
WHERE num_ordered = 1 AND order_num = 21617;

-- 8. Show all the orders from order date between '2010-10-20’ and '2010-10-22'
SELECT * FROM orders
WHERE order_date BETWEEN '2010-10-20' AND '2010-10-22';

-- 9. List all of parts where the part description starts with ‘D’ and end with  ‘er’
SELECT * FROM part
WHERE part_description LIKE 'D%er';

-- 10. Show total balance from customer
SELECT SUM(balance) AS total_balance FROM customer;

-- 11. Show minimum balance from customer
SELECT MIN(balance) AS minimum_balance FROM customer;

-- 12. Count number of customers in customer table
SELECT COUNT(*) AS customer_count FROM customer;

-- 13. Select order number where the quote price is more than 500 but less than 1000
SELECT order_num FROM order_line
WHERE quoted_price > 500 AND quoted_price < 1000;

-- 14. Create a new table of customer name, last name, and first name from customer and sales rep table by matching up their primary key
CREATE TABLE customer_sales_rep_match (
    customer_name TEXT,
    last_name TEXT,
    first_name TEXT
);
INSERT INTO customer_sales_rep_match (customer_name, last_namecustomer_sales_rep_match, first_name)
SELECT c.customer_name, s.last_name, s.first_name
FROM customer AS c
INNER JOIN sales_rep AS s ON c.sales_rep_num = s.sales_rep_num;