USE bank_churn_analysis;
SELECT *
FROM customer_snapshot;

SELECT *
FROM customer_master;


SELECT 
  CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30-50'
    ELSE 'Over 50'
  END AS Age_Group,
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY Age_Group
ORDER BY Churn_Rate DESC;
