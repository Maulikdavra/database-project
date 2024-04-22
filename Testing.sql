INSERT INTO Department (department_id, department_name) VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Finance'),
(5, 'IT');

INSERT INTO People (personal_id, lname, fname, phone_number, zipcode, state, city, address_line_1, age, gender) VALUES
(1, 'Smith', 'John', '1234567890', '10001', 'NY', 'New York', '123 Main St', 30, 'M'),
(2, 'Johnson', 'Jane', '0987654321', '10002', 'NY', 'New York', '234 Elm St', 32, 'F'),
(3, 'Williams', 'Jim', '1122334455', '10003', 'NY', 'New York', '345 Oak St', 28, 'M'),
(4, 'Jones', 'June', '2233445566', '10004', 'NY', 'New York', '456 Pine St', 26, 'F'),
(5, 'Cole', 'Hellen', '3344556677', '10005', 'NY', 'New York', '567 Maple St', 29, 'F'),
(6, 'Alex', 'Albon', '1234567901', '10006', 'TX', 'Texas', '123 South St', 03, 'M'),
(7, 'Lewis', 'Hamilton', '9127654321', '10007', 'TX', 'Texas', '234 North St', 39, 'F'),
(8, 'Williams', 'Jim', '1122334455', '10003', 'NY', 'New York', '345 Oak St', 28, 'M'),
(9, 'Williams', 'Jim', '1122334455', '10003', 'NY', 'New York', '345 Oak St', 28, 'M'),
(10, 'Williams', 'Jim', '1122334455', '10003', 'NY', 'New York', '345 Oak St', 28, 'M'),
(11, 'Williams', 'Jim', '1122334455', '10003', 'NY', 'New York', '345 Oak St', 28, 'M'),
(12, 'Rock', 'David', '1234347890', '10012', 'CA', 'California', '123 apple St', 27, 'F'),
(13, 'Monti', 'Jackson', '1230967890', '10013', 'TN', 'tennessee', '101 court ln', 70, 'M'),
(14, 'Rahul', 'Patel', '0134567890', '10014', 'NY', 'New York', '23 oult St', 40, 'F');

INSERT INTO potential_employee (personal_id, job_id) VALUES
(12, 11111),
(13, 22222),
(14, 33333);

INSERT INTO Job_positions (job_id, posted_date, description, department_id) VALUES
(11111, '2023-01-01', 'Sales Manager', 2),
(12345, '2011-01-15', 'Marketing Coordinator', 1),
(22222, '2023-02-01', 'Marketing Analyst', 1),
(33333, '2013-03-01', 'HR Officer', 3),
(44444, '2023-04-01', 'Finance Officer', 4),
(55555, '2023-05-01', 'IT Support', 5),
(77777, '2011-01-30', 'Marketing Specialist', 1);

INSERT INTO Salary (salary_id, transaction_number, pay_date, amount) VALUES
(1, 101, '2023-06-01', 5000.00),
(2, 102, '2023-06-01', 5500.00),
(3, 103, '2023-06-01', 6000.00),
(4, 104, '2023-06-01', 6500.00),
(5, 105, '2023-06-01', 7000.00);

INSERT INTO Employee (personal_id, lname, fname, job_id, supervisor_id, department_id, salary_id) VALUES
(1, 'Smith', 'John', 11111, NULL, 2, 1),
(2, 'Johnson', 'Jane', 22222, 1, 1, 2),
(3, 'Williams', 'Jim', 33333, 1, 3, 3),
(4, 'Jones', 'June', 44444, 1, 4, 4),
(5, 'Cole', 'Hellen', 55555, 1, 5, 5),
(8, 'Williams', 'Jim', 11111, NULL, 2, 3),
(9, 'Williams', 'Jim', 12345, 1, 1, 3),
(10, 'Williams', 'Jim', 44444, 1, 4, 3),
(11, 'Williams', 'Jim', 55555, 1, 5, 3);

INSERT INTO Interview (interview_id, interviewees_id, interviewees_name, interviewees_email_address, interviewees_phone_number, interview_time, job_id, interviewers_id, interviewers_name) VALUES
(1, 5, 'Hellen Cole', 'hellen.cole@example.com', '3344556677', '2023-07-01 10:00:00', 11111, 1, 'John Smith'),
(2, 4, 'June Jones', 'june.jones@example.com', '2233445566', '2023-07-02 10:00:00', 22222, 2, 'Jane Johnson'),
(3, 3, 'Jim Williams', 'jim.williams@example.com', '1122334455', '2023-07-03 10:00:00', 33333, 3, 'Jim Williams'),
(4, 2, 'Jane Johnson', 'jane.johnson@example.com', '0987654321', '2023-07-04 10:00:00', 44444, 4, 'June Jones'),
(5, 1, 'John Smith', 'john.smith@example.com', '1234567890', '2023-07-05 10:00:00', 55555, 5, 'Hellen Cole'),
(6, 5, 'Hellen Cole', 'hellen.cole@example.com', '3344556677', '2023-08-01 10:00:00', 12345, 1, 'John Smith', '2023-08-01'),
(7, 5, 'Hellen Cole', 'hellen.cole@example.com', '3344556677', '2023-09-01 10:00:00', 33333, 1, 'John Smith', '2023-09-01'),
(8, 5, 'Hellen Cole', 'hellen.cole@example.com', '3344556677', '2023-10-01 10:00:00', 44444, 1, 'John Smith', '2023-10-01'),
(9, 5, 'Hellen Cole', 'hellen.cole@example.com', '3344556677', '2023-11-01 10:00:00', 55555, 1, 'John Smith', '2023-11-01'),
(14, 3, 'Jim Williams', 'jim.williams@example.com', '1122334455', '2023-08-03 10:00:00', 11111, 1, 'John Smith', '2023-08-03'),
(15, 3, 'Jim Williams', 'jim.williams@example.com', '1122334455', '2023-09-03 10:00:00', 22222, 1, 'John Smith', '2023-09-03'),
(16, 3, 'Jim Williams', 'jim.williams@example.com', '1122334455', '2023-10-03 10:00:00', 44444, 1, 'John Smith', '2023-10-03'),
(17, 3, 'Jim Williams', 'jim.williams@example.com', '1122334455', '2023-11-03 10:00:00', 55555, 1, 'John Smith', '2023-11-03');

-- Add vendors
INSERT INTO vendor (vendor_id, vendor_name, address, account_number, credit_rating, purchasing_web_url) VALUES
(1, 'Vendor 1', '100 Main St', '123456789', 5, 'www.vendor1.com'),
(2, 'Vendor 2', '200 Main St', '234567890', 4, 'www.vendor2.com'),
(3, 'Vendor 3', '103 South Ln', '1234567232', 9, 'www.vendor3.com'),
(4, 'Vendor 4', '99 Disney St', '2345670121', 8, 'www.vendor4.com');
-- Add parts

INSERT INTO parts (part_id, part_type, price, vendor_id) VALUES
(1, 'Part Type 1', 100.00, 1),
(2, 'Part Type 2', 200.00, 2),
(3, 'Part Type 3', 400.00, 3),
(4, 'Part Type 4', 900.00, 4);
-- Add products

INSERT INTO products (product_id, style, weight, price, size, product_type, product_status, product_cost, part_id) VALUES
(1, 'Style 1', 1.00, 100.00, 1, 'cup', 'SOLD', 50.00, 1),
(2, 'Style 2', 2.00, 200.00, 2, 'cup', ' ', 100.00, 2),
(3, 'Style 3', 4.00, 400.00, 3, 'Product Type 3', 'SOLD', 100.00, 3),
(4, 'Style 4', 6.00, 900.00, 4, 'Product Type 4', ' ', 400.00, 4),
(5, 'Style 1', 9.00, 1000.00, 1, 'Product Type 5', 'SOLD', 500.00, 1),
(6, 'Style 6', 5.00, 899.00, 1, 'Product Type 6', 'SOLD', 300.00, 1);

-- Add marketing sites
INSERT INTO marketing_site (site_id, site_name, site_location, personal_id) VALUES
(1, 'Site 1', 'Location 1', 1),
(2, 'Site 2', 'Location 2', 2);

-- Add customers
INSERT INTO customers (personal_id, preferred_salesman) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- Add sale history
INSERT INTO sale_history (sale_id, sale_time, sale_record, salesman, product_id, site_id, personal_id) VALUES
(1, '2011-02-15', NULL, 'John Smith', 1, 1, 1),
(2, '2011-04-15', NULL, 'Jane Johnson', 2, 2, 2),
(3, '2011-03-15', 'Sale Record 3', 'Jim Williams', 1, 1, 1),
(4, '2011-03-30', 'Sale Record 4', 'June Jones', 2, 2, 2),
(5, '2011-02-15', 'sale record 5', 'John Smith', 1, 1, 1),
(6, '2011-02-15', 'sale record 6', 'John Smith', 1, 1, 1);

INSERT INTO interview_round (round_id, round_number, grade, selected_status, result, interview_id) VALUES 
(1, 1, 85, 'YES', 'ACCEPTED', 1), 
(2, 1, 65, 'NO', 'NOT ACCEPTED', 2), 
(3, 1, 75, 'YES', 'ACCEPTED', 3), 
(4, 1, 90, 'YES', 'ACCEPTED', 4), 
(5, 1, 55, 'NO', 'NOT ACCEPTED', 5),
(6, 1, 85, 'YES', 'ACCEPTED', 6), 
(7, 1, 85, 'YES', 'ACCEPTED', 7),
(8, 1, 85, 'YES', 'ACCEPTED', 8),
(9, 1, 85, 'YES', 'ACCEPTED', 9),
(14, 1, 75, 'YES', 'ACCEPTED', 14), 
(15, 1, 75, 'YES', 'ACCEPTED', 15),
(16, 1, 75, 'YES', 'ACCEPTED', 16),
(17, 1, 75, 'YES', 'ACCEPTED', 17);

INSERT INTO Sales (sales_id, employee_id, product_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 6),
(7, 3, 1),
(8, 3, 2),
(9, 3, 3),
(10, 3, 4),
(11, 3, 5),
(12, 4, 6),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 4, 4),
(17, 4, 5),
(18, 4, 6);

INSERT INTO job_applications (personal_id, job_id) VALUES
(1, 12345),
(2, 12345),
(3, 12345);

INSERT INTO Employee_Department_History (personal_id, department_id, job_start_date) VALUES
(3, 2, '2013-05-01'),
(3, 1, '2014-06-01'),
(3, 4, '2016-07-01'),
(3, 5, '2019-08-01'),
(3, 3, '2022-09-01');



