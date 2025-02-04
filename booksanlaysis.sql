

SELECT * FROM customers
SELECT * FROM books
SELECT * FROM orders

--1) Retreive all books in fiction

SELECT * FROM books
WHERE genre = 'Fiction';

--2 Find books published after the year 1950

SELECT * FROM books
WHERE published_year>1950

--3)List all the customers from Canada

SELECT * FROM customers
WHERE country = 'Canada'

-- 4) Show orders placed in November 2023:

SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books available:

SELECT
SUM(stock) as total_stock
FROM books

-- 6) Find the details of the most expensive book:

SELECT * FROM books
ORDER BY price DESC
LIMIT 1

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM orders
WHERE quantity>1

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM orders
WHERE total_amount>20

-- 9) List all genres available in the Books table:

SELECT DISTINCT genre FROM books


-- 10) Find the book with the lowest stock:

SELECT * FROM books
ORDER BY stock

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) as revenue
FROM orders


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:


SELECT * FROM ORDERS;

SELECT books.genre, SUM(orders.Quantity) AS Total_Books_sold
FROM Orders 
JOIN Books ON orders.book_id = books.book_id
GROUP BY books.genre;


-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(price) as avg_price
FROM books
WHERE genre = 'Fantasy'

-- 3) List customers who have placed at least 2 orders:
SELECT orders.customer_id, customers.name, COUNT(orders.order_id) as order_count
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY orders.customer_id, customers.name
ORDER BY COUNT(orders.order_id)>=2

-- 4) Find the most frequently ordered book:
SELECT o.book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3


-- 6) Retrieve the total quantity of books sold by each author:
SELECT books.author,SUM(orders.quantity) as total_books_sold
FROM orders
JOIN books ON orders.book_id = books.book_id
GROUP BY books.author


-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;


-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;


--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;




