USE bank_churn_analysis;
SELECT *
FROM customer_snapshot;

SELECT *
FROM customer_master;


SELECT 
  CASE
    WHEN CreditScore < 600 THEN 'Low'
    WHEN CreditScore BETWEEN 600 AND 750 THEN 'Medium'
    ELSE 'High'
  END AS CreditScore_Bucket,
  COUNT(*) AS Total,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY CreditScore_Bucket
ORDER BY Churn_Rate DESC;
