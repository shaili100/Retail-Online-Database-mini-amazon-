create database retail_store_db;
use retail_store_db;
create table Users(
User_id int primary key,
Name varchar(10),
Email varchar(50)
);
Insert into Users
(user_id, Name, Email)
values
(1, 'Riya', 'riya@gmail.com'),
(2, 'Aman', 'aman@gmail.com'),
(3, 'Neha', 'neha@gmail.com'),
(4, 'Ravi', 'ravi@gmail.com'),
(5, 'Pooja', 'pooja@gmail.com'),
(6, 'Trisha', 'trisha@gmail.com'),
(7, 'Rishika', 'rishika@gmail.com'),
(8, 'Tabassum', 'tabassum@gmail.com'),
(9, 'Hina', 'hina@gamil.com'),
(10, 'Vanshika', 'vanshika@gmail.com');
select * from Users;
create table Products(
Product_id int primary key,
Product_name varchar(50),
Price int,
Stock int
);
ALTER TABLE Products
ADD category_id INT;
UPDATE Products
SET category_id = 1
WHERE product_id > 0;
ALTER TABLE Products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id)
REFERENCES Categories(category_id);
insert into Products
(product_id, product_name, Price, stock)
values
(1, 'Laptop', 55000, 10),
(2, 'Mobile', 20000, 25),
(3, 'Headset', 1500, 50),
(4, 'Keyboard', 800, 40),
(5, 'Mouse', 500, 60),
(6, 'Hob', 1000, 55),
(7, 'Speaker', 4000, 70),
(8, 'Hair Dryer', 500, 60),
(9, 'Microwaves', 2000, 50),
(10, 'Smartwatches', 1500, 80);
select * from Products;
create table Categories(
category_id int primary key,
category_name varchar(50)
);
insert into Categories
(category_id, category_name)
values
(1, 'Electronics');
SELECT * FROM Products;
SELECT * FROM Categories;
create table Orders (
Orders_id int primary key,
user_id int,
Order_date Date,
foreign key (user_id) references Users(user_id)
);
insert into Orders
(Orders_id, User_id, Order_date)
values
(1, 2, '2026-03-03'),
(2, 1, '2026-03-04'),
(3, 2, '2026-03-05'),
(4, 3, '2026-03-06'),
(5, 2, '2026-03-07'),
(6, 2, '2026-03-08'),
(7, 4, '2026-03-09'),
(8, 1, '2026-03-10'),
(9, 2, '2026-03-11'),
(10, 4, '2026-03-12');
select * from orders;
create table Order_items(
orders_id int,
product_id int,
quantity int not null,
primary key (orders_id, product_id),
foreign key (orders_id) references Orders(orders_id),
foreign key (product_id) references Products(product_id)
);
insert into Order_items
(orders_id, product_id, quantity)
values
(1, 2, 2),
(2, 3, 4),
(2, 1, 3),
(3, 9, 2),
(4, 10, 5),
(5, 5, 2),
(6, 4, 6),
(7, 6, 3),
(8, 7, 7),
(9, 8, 1);
select * from Order_items;
create table Payments(
payment_id int primary key,
orders_id int,
payment_date Date,
Amount Decimal (10,2),
payment_method varchar(50),
payment_status varchar(20),
foreign key (orders_id) references Orders(orders_id)
);
insert into Payments
(payment_id, orders_id, payment_date, amount, payment_method, payment_status)
values
(1, 2, '2026-03-03', 58000.00, 'UPI', 'Completed'),
(2, 1, '2026-03-04', 20000.00, 'Cash on delivery', 'Completed'),
(3, 6, '2026-03-05', 58000.00, 'Cash on delivery', 'Pending'),
(4, 9, '2026-03-06', 1500.00, 'Creidit card', 'Completed'),
(5, 8, '2026-03-07', 2000.00, 'UPI', 'Completed'),
(6, 5, '2026-03-08', 500.00, 'Credit card', 'Pending'),
(7, 3, '2026-03-09', 55000.00, 'UPI', 'Completed'),
(8, 4, '2026-03-01', 100000.00, 'Cash on delivery', 'Pendig'),
(9, 7, '2026-03-02', 3000.00, 'UPI', 'Completed'),
(10, 10, '2026-03-03', 200000.00, 'cash on delivery', 'Completed');
select * from Payments;
select *
from Users as u
join orders as o
on u.user_id = o.user_id;
select * 
from users as u
left join orders as o
on u.user_id = o.user_id
union
select * from users as u 
right join orders as o
on u.user_id = o.user_id;

SELECT
    u.user_id,
    u.name AS user_name,
    o.orders_id AS orders_id,
    p.product_name,
    c.category_name,
    i.quantity,
    pay.payment_method,
    pay.payment_status
FROM users AS u
JOIN orders AS o
    ON u.user_id = o.user_id
JOIN order_items AS i
    ON o.orders_id = i.orders_id
JOIN products AS p
    ON i.product_id = p.product_id
JOIN categories AS c
    ON p.category_id = c.category_id
JOIN payments AS pay
    ON o.orders_id = pay.orders_id;
    
