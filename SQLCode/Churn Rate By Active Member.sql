USE bank_churn_analysis;
SELECT *
FROM customer_snapshot;

SELECT *
FROM customer_master;


SELECT 
  IsActiveMember,
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY IsActiveMember;
