SELECT * FROM bank_loan_db.bank_loan_data;
USE bank_loan_db
DESCRIBE bank_loan_data

ALTER TABLE bank_loan_data                                                                 --data--clean--
CHANGE COLUMN ï»¿id id INT;

UPDATE bank_loan_data
SET issue_date = STR_TO_DATE(REPLACE(issue_date, '/', '-'), '%d-%m-%Y');

ALTER TABLE bank_loan_data
MODIFY COLUMN issue_date DATE;

UPDATE bank_loan_data
SET term=TRIM(term);

UPDATE bank_loan_data
SET last_credit_pull_date=STR_TO_DATE(REPLACE(last_credit_pull_date,'/','-'),'%d-%m-%Y'),
	last_payment_date=STR_TO_DATE(REPLACE(last_payment_date,'/','-'),'%d-%m-%Y'),
    next_payment_date=STR_TO_DATE(REPLACE(next_payment_date,'/','-'),'%d-%m-%Y');
  
ALTER TABLE bank_loan_data
MODIFY COLUMN last_credit_pull_date DATE,
MODIFY COLUMN last_payment_date DATE,
MODIFY COLUMN next_payment_date DATE;
 
UPDATE bank_loan_data
SET emp_title = 'Unknown'
WHERE TRIM(emp_title) = '';                                                                   --- cleaned---

SELECT COUNT(id) as Total_loan_application from bank_loan_data;

SELECT COUNT(id) as MTD_Total_loan_application 
From bank_loan_data
WHERE MONTH(issue_date)=12 
AND YEAR(issue_date)=2021;

SELECT COUNT(id) as PMTD_Total_loan_application 
From bank_loan_data
WHERE MONTH(issue_date)=11
AND YEAR(issue_date)=2021;

SELECT SUM(loan_amount) as Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date)=12
AND YEAR(issue_date)=2021;

SELECT SUM(loan_amount) as PMTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date)=11
AND YEAR(issue_date)=2021;

SELECT SUM(total_payment) as Total_Amount_received FROM bank_loan_data

SELECT SUM(total_payment) as MTD_Total_Amount_received
FROM bank_loan_data
WHERE MONTH(issue_date)=12
AND YEAR(issue_date)=2021;

SELECT SUM(total_payment) as PMTD_Total_Amount_received
FROM bank_loan_data
WHERE MONTH(issue_date)=11
AND YEAR(issue_date)=2021;

SELECT ROUND(AVG(int_rate)* 100,2) AS Avg_Interest_rate from bank_loan_data;

SELECT ROUND(AVG(int_rate)* 100,2) AS MTD_Avg_Interest_rate from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

SELECT ROUND(AVG(int_rate)*100,2) as PMTD_Avg_Interest_rate from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

SELECT ROUND(Avg(dti)*100,2) AS Avg_DTI from bank_loan_data;

SELECT ROUND(Avg(dti)*100,2) AS MTD_Avg_Interest_rate from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

SELECT ROUND(Avg(dti)*100,2) AS PMTD_Avg_Interest_rate from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

SELECT ROUND(                                                                              
    (COUNT(CASE                                                           
        WHEN loan_status = 'Fully Paid'
        OR loan_status = 'Current'
        THEN id
    END) * 100) / COUNT(id)
)AS Good_Loan_percentage
FROM bank_loan_data;      
     
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status='Fully paid' OR loan_status='Current';

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status='Fully paid' OR loan_status='Current';

SELECT SUM(total_payment ) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status='Fully paid' OR loan_status='Current';

SELECT 
     ROUND(COUNT(CASE                                                           
        WHEN loan_status = 'Charged Off'                                                          
        THEN id
    END) * 100 / COUNT(id)
)AS Bad_Loan_percentage
FROM bank_loan_data;      

SELECT COUNT(id) as Bad_Loan_Applications from bank_loan_data
WHERE loan_status='Charged Off';

SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
WHERE loan_status='Charged Off';

SELECT SUM(total_payment) as Bad_Loan_Received_Amount from bank_loan_data
WHERE loan_status='Charged Off';

SELECT 
     loan_status,
     COUNT(id) as Total_loan_Applications,
     SUM(loan_amount) as Total_Amount_Funded,
     SUM(total_payment) as Total_Amount_Received,
     AVG(int_rate*100) as Interest_Rate,
     AVG(dti*100) as DTI
FROM 
bank_loan_data
GROUP BY
loan_status;
          
SELECT 
     loan_status,
     SUM(loan_amount) as MTD_Total_Amount_Funded,
     SUM(total_payment) as MTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date)=12 
GROUP BY loan_status;

SELECT 
     MONTH(issue_date) as Month_Number,
     MONTHNAME(issue_date) as Month_Name,
	 COUNT(id) as Total_Loan_Applications,
	 SUM(loan_amount) as Total_Funded_Amount,
	 SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date),MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

SELECT
      address_state,
      COUNT(id) as Total_Loan_Appplications,
      SUM(loan_amount) as Total_Funded_Amount,
      SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC;

SELECT
      term as Term,
      COUNT(id) as Total_Loan_Appplications,
      SUM(loan_amount) as Total_Funded_Amount,
      SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY COUNT(id) DESC;

SELECT
      emp_length,
      COUNT(id) as Total_Loan_Appplications,
      SUM(loan_amount) as Total_Funded_Amount,
      SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC;

SELECT
      purpose,
      COUNT(id) as Total_Loan_Appplications,
      SUM(loan_amount) as Total_Funded_Amount,
      SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC;

SELECT
      home_ownership,
      COUNT(id) as Total_Loan_Appplications,
      SUM(loan_amount) as Total_Funded_Amount,
      SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
WHERE grade='A' AND address_state='CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;














   







