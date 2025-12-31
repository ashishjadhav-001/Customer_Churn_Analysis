use customer_churn;
select * from cleaned_customer_churn_dataset;

-- 1.Find total number of churned customers 
SELECT COUNT(*) AS churned_customers
FROM cleaned_customer_churn_dataset
WHERE churn = 'Yes';

-- 2. Average Monthly Charges 
SELECT 
    AVG(monthly_charges) AS avg_monthly_charges
FROM cleaned_customer_churn_dataset;

-- 3. Churn by Contract Type
SELECT 
    contract_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS churn_rate
FROM cleaned_customer_churn_dataset
GROUP BY contract_type;

-- 4. Churn by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS churn_rate
FROM cleaned_customer_churn_dataset
GROUP BY payment_method;

-- 5. Top 5 High-Churn Segments
SELECT 
    customer_id,
    monthly_charges,
    tenure_months,
    contract_type,
    internet_service
FROM cleaned_customer_churn_dataset
WHERE churn = 'Yes'
ORDER BY monthly_charges DESC, tenure_months ASC
LIMIT 5;

-- 6. Which gender churns more?
SELECT gender,
       COUNT(*) AS churn_count
FROM cleaned_customer_churn_dataset
WHERE churn = 'Yes'
GROUP BY gender;

-- 7. Customers with high monthly charges (>1200).
SELECT *
FROM cleaned_customer_churn_dataset
WHERE monthly_charges > 1200;

-- 8. Average tenure of churned vs active customers.
SELECT churn, AVG(tenure_months) AS avg_tenure
FROM cleaned_customer_churn_dataset
GROUP BY churn;







