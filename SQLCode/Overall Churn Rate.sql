USE bank_churn_analysis;
SELECT *
FROM customer_snapshot;

SELECT *
FROM customer_master;


SELECT 
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned_Customers,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customer_merged;
