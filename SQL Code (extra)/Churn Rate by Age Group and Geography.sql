USE bank_churn_analysis;

SELECT 
    Geography,
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM 
    customer_merged
GROUP BY 
    Geography,
    Age_Group
ORDER BY 
    Geography,
    Age_Group;
