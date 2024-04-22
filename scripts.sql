#1
# Return the ID and Name of interviewers who participate in interviews where the interviewee’s name is “Hellen Cole” arranged for job “11111”.
SELECT interview.interviewers_id AS interviewer_id, interview.interviewers_name AS interviewer_name
FROM interview
WHERE interview.interviewees_name = 'Hellen Cole' AND interview.job_id = 11111;

# 2
# Return the ID of all jobs which are posted by department “Marketing” in January 2011.
SELECT job_id
FROM Job_positions
WHERE department_id IN (SELECT department_id FROM Department WHERE department_name = 'Marketing')
AND MONTH(posted_date) = 1 AND YEAR(posted_date) = 2011;

#3 Return the ID and Name of the employees having no supervisor.
SELECT Employee.personal_id, employee.fname, employee.lname
FROM Employee
JOIN People ON Employee.personal_id = People.personal_id
WHERE Employee.supervisor_id IS NULL;

#4
# Return the Id and Location of the marketing sites which have no sale records during March, 2011.
SELECT marketing_site.site_id, marketing_site.site_location
FROM marketing_site
WHERE marketing_site.site_id NOT IN (
  SELECT DISTINCT site_id 
  FROM sale_history
  WHERE (sale_record IS NULL) AND (MONTH(sale_time) = 3) AND (YEAR(sale_time) = 2011)
);

# 5
# Return the job’s id and description which does not hire a suitable person one month after it is posted.
SELECT job_positions.job_id, job_positions.description
FROM job_positions
INNER JOIN interview ON job_positions.job_id = interview.job_id
INNER JOIN (
  SELECT interview_id, COUNT(*) as no_count
  FROM interview_round
  WHERE selected_status = 'NO'
  GROUP BY interview_id
) no_rounds ON interview.interview_id = no_rounds.interview_id
INNER JOIN (
  SELECT interview_id, MAX(round_number) as max_round
  FROM interview_round
  GROUP BY interview_id
) max_rounds ON interview.interview_id = max_rounds.interview_id
WHERE DATEDIFF(interview.result_date, job_positions.posted_date) > 30 AND no_rounds.no_count = max_rounds.max_round;

#6
# Return the ID and Name of the salesmen who have sold all product type whose price is above $200
SELECT 
    E.personal_id AS Salesman_ID, 
    CONCAT(E.fname, ' ', E.lname) AS Salesman_Name
FROM 
    employee E
JOIN 
    sales S ON E.personal_id = S.employee_id
JOIN
    products P ON S.product_id = P.product_id
WHERE 
    P.price > 200 AND P.product_status = 'SOLD'
GROUP BY 
    E.personal_id, E.fname, E.lname
HAVING 
    COUNT(DISTINCT P.product_type) = (
        SELECT 
            COUNT(DISTINCT product_type) 
        FROM 
            products 
        WHERE 
            price > 200 AND product_status = 'SOLD'
    );

#7) 
# Return the department’s id and name which has no job post during 1/1/2011 and 2/1/2011.
SELECT department_id, department_name
FROM Department
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM job_positions
    WHERE posted_date BETWEEN '2011-01-01' AND '2011-02-01'
);


#8) 
# Return the ID, Name, and Department ID of the existing employees who apply job “12345”.
SELECT employee.personal_id, employee.fname, employee.lname, employee.department_id
FROM employee
JOIN job_applications ON employee.personal_id = job_applications.personal_id
WHERE job_applications.job_id = 12345;

# 9) 
# Return the best seller’s type in the company (sold the most items).
SELECT 
    sale_history.salesman, 
    COUNT(*) as items_sold
FROM 
    sale_history
JOIN 
    products 
ON 
    sale_history.product_id = products.product_id
WHERE 
    products.product_status = 'SOLD'
GROUP BY 
    sale_history.salesman
ORDER BY 
    items_sold DESC
LIMIT 1;

# 10) 
# Return the product type whose net profit is highest in the company (money earned minus the part cost).
SELECT 
    product_id,
    product_type,
    (price - product_cost) AS net_profit
FROM 
    products
WHERE 
    product_status = 'SOLD'
ORDER BY 
    net_profit DESC
LIMIT 1;

# 11) 
# Return the employee name who has worked in all departments after hired by the company.
SELECT 
    E.fname AS Employee_Name, 
    COUNT(DISTINCT EDH.department_id) AS Number_Of_Departments_Worked
FROM 
    Employee E
JOIN 
    Employee_Department_History EDH ON E.personal_id = EDH.personal_id
JOIN
    Interview I ON E.personal_id = I.interviewees_id
WHERE 
    E.fname IN (
        SELECT 
            E.fname
        FROM 
            Employee E
        JOIN 
            Employee_Department_History EDH ON E.personal_id = EDH.personal_id
        GROUP BY 
            E.fname
        HAVING 
            COUNT(DISTINCT EDH.department_id) = (SELECT COUNT(*) FROM Department)
    )
GROUP BY
    E.fname;

# 12
# Return the name and email address of the interviewee who is selected.
SELECT 
    DISTINCT I.interviewees_name, 
    I.interviewees_email_address,
    IR.selected_status
FROM 
    interview I
JOIN 
    interview_round IR 
ON 
    I.interview_id = IR.interview_id
WHERE 
    IR.result = 'ACCEPTED';

# 13
# Retrieve the name, phone number, email address of the interviewees selected for all the jobs they apply.
SELECT 
    I.interviewees_name, 
    I.interviewees_phone_number,
    I.interviewees_email_address,
    COUNT(DISTINCT I.job_id) AS Number_of_Departments_Applied,
    COUNT(DISTINCT CASE WHEN IR.result = 'ACCEPTED' THEN I.job_id END) AS Number_of_Departments_Selected
FROM 
    interview I
INNER JOIN 
    interview_round IR 
ON 
    I.interview_id = IR.interview_id
GROUP BY
    I.interviewees_id,
    I.interviewees_name, 
    I.interviewees_phone_number,
    I.interviewees_email_address
HAVING 
    Number_of_Departments_Selected = 5;

#14) 
# Return the employee’s name and id whose average monthly salary is highest in the company.
SELECT 
    E.fname AS Employee_Name, 
    (S.amount/12) AS Average_Monthly_Salary
FROM 
    Employee E
JOIN 
    Salary S ON E.salary_id = S.salary_id
ORDER BY 
    Average_Monthly_Salary DESC
LIMIT 1;

# 15) 
# Return the ID and Name of the vendor who supply part whose name is “Cup” and weight is smaller than 4 pound 
# and the price is lowest among all vendors.
SELECT 
    V.vendor_id AS Vendor_ID,
    V.vendor_name AS Vendor_Name,
    PR.product_type AS Product_Type,
    MIN(PT.price) AS Lowest_Price
FROM 
    vendor V
JOIN 
    parts PT ON V.vendor_id = PT.vendor_id
JOIN 
    products PR ON PT.part_id = PR.part_id
WHERE 
    PR.product_type = 'Cup' AND PR.size < 4
GROUP BY 
    V.vendor_id, V.vendor_name, PR.product_type
ORDER BY 
    Lowest_Price ASC
LIMIT 1;


