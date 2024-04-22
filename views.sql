# View1: This view returns the average salary each employee has earned from the company monthly after she/he becomes an employee in the company. - done
CREATE VIEW View1 AS
SELECT e.personal_id, ROUND(AVG(s.amount)/12, 2) AS average_monthly_salary
FROM Employee e
JOIN Salary s ON e.salary_id = s.salary_id
GROUP BY e.personal_id;


# View2: This view returns the number of interviews rounds each interviewee pass for each job position.
CREATE VIEW View2 AS
SELECT i.interviewees_id, i.interviewees_name, jp.job_id, COUNT(ir.round_id) AS passed_rounds
FROM Interview i
LEFT JOIN Interview_round ir ON i.interview_id = ir.interview_id
LEFT JOIN Job_positions jp ON i.job_id = jp.job_id
WHERE ir.selected_status = 'YES'
GROUP BY i.interviewees_id, i.interviewees_name, jp.job_id;


# View3: This view returns the number of items of each product type sold. - done
CREATE VIEW View3 AS
SELECT p.product_type, COUNT(sh.sale_id) AS items_sold
FROM Products p
JOIN Sale_history sh ON p.product_id = sh.product_id
WHERE p.product_status = 'Sold'
GROUP BY p.product_type;

# View4: This view returns the part purchase cost for each product. - done
CREATE VIEW View4 AS
SELECT p.product_id, SUM(pt.price) AS part_cost
FROM Products p
JOIN Parts pt ON p.part_id = pt.part_id
GROUP BY p.product_id;
