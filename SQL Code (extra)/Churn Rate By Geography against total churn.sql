-- Churn Rate By Geography with Percentage Compared to Total Churn

WITH TotalChurn AS (
    SELECT SUM(Exited) AS Total_Churned
    FROM customer_master
)

SELECT 
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage,
    ROUND(SUM(Exited) * 100.0 / (SELECT Total_Churned FROM TotalChurn), 2) AS Churn_Percentage_Against_All
FROM 
    customer_master
GROUP BY 
    Geography
ORDER BY 
    Churn_Rate_Percentage DESC;
