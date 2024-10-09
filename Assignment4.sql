#inner join
SELECT c.name, o.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
#Left Join
SELECT c.name, o.product_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.name;
#Right join
SELECT p.product_name, o.suppier_name
FROM products p
RIGHT JOIN products_suppliers ps ON p.product_id = ps.product_id
RIGHT JOIN suppliers s ON ps.supplier_id = s.supplier_id;
#FULL OUTER JOIN
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
UNION
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
#SELF JOIN
SELECT 
    e1.employee_id AS employee_id,
    e1.employee_name AS employee_name,
    e2.employee_name AS manager_name,
FROM 
      employees e1
LEFT JOIN
    employees e2
ON e1.manager_id = e2.employee_id;
#CROSS JOIN
SELECT p.product_name, c.customer_name
FROM products p
CROSS JOIN customers c;
#NATURAL JOIN
SELECT customer_name, order_id, order_date
FROM customers
NATURAL JOIN orders;
#Join with Aggregation
SELECT c.customer_name, COUNT(o.product_id) AS total_products_ordered
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
#Multiple joins
SELECT c.customer_name,p.product_name,o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
#Foreignkey
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(50),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
#Cascading deletes
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);
#Violating Foreign key constraint
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
#Unique consraint
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name INT,
    email VARCHAR(100) UNIQUE
);
# check constraint
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOTNULL,
    price DECIMAL(10,2) CHECK (price > 0)
);
# foreign key and consistency:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);
CREATE TABLE courses (
    course_id INT,
    course_name INT VAECHAR(100) NOT NULL
);
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
#Composite ket constraint:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);
CREATE TABLE courses (
    course_id INT,
    course_name INT VAECHAR(100) NOT NULL
);
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);










