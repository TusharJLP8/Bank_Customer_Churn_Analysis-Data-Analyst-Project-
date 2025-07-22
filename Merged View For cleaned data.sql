#DATABASE Created for Project#

CREATE DATABASE bank_churn_analysis;
USE bank_churn_analysis;

#CREATING TABLE STRUCTURE

CREATE TABLE customer_master (
  CustomerId INT PRIMARY KEY,
  Surname VARCHAR(50),
  CreditScore INT,
  Geography VARCHAR(30),
  Gender VARCHAR(10),
  Age INT,
  Tenure INT,
  Balance DECIMAL(12,2),
  NumOfProducts INT,
  HasCrCard TINYINT(1),
  IsActiveMember TINYINT(1),
  EstimatedSalary DECIMAL(12,2),
  Exited TINYINT(1)
);

#CREATED SECOND TABLE
CREATE TABLE customer_snapshot (
  CustomerId INT PRIMARY KEY,
  Balance DECIMAL(12,2),
  NumOfProducts INT,
  HasCrCard TINYINT(1),
  Tenure INT,
  IsActiveMember TINYINT(1),
  Exited TINYINT(1)
);


SELECT *
FROM customer_snapshot;

SELECT *
FROM customer_master;



SELECT COUNT(*) FROM customer_master;
SELECT COUNT(*) FROM customer_snapshot;


CREATE OR REPLACE VIEW customer_merged AS
SELECT
  m.CustomerId,
  m.Surname,
  m.CreditScore,
  m.Geography,
  m.Gender,
  m.Age,
  COALESCE(s.Tenure, m.Tenure) AS Tenure,
  COALESCE(s.Balance, m.Balance) AS Balance,
  COALESCE(s.NumOfProducts, m.NumOfProducts) AS NumOfProducts,
  COALESCE(s.HasCrCard, m.HasCrCard) AS HasCrCard,
  COALESCE(s.IsActiveMember, m.IsActiveMember) AS IsActiveMember,
  m.EstimatedSalary,
  COALESCE(s.Exited, m.Exited) AS Exited
FROM customer_master m
LEFT JOIN customer_snapshot s ON m.CustomerId = s.CustomerId;




SELECT 
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned_Customers,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customer_merged;


SELECT 
  Geography,
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY Geography
ORDER BY Churn_Rate DESC;



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


SELECT 
  IsActiveMember,
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY IsActiveMember;



SELECT 
  NumOfProducts,
  COUNT(*) AS Total_Customers,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_merged
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


SELECT
  CustomerId,
  Geography,
  Gender,
  Age,
  CreditScore,
  NumOfProducts,
  IsActiveMember,
  EstimatedSalary,
  Balance,
  Exited
FROM customer_merged;



CREATE VIEW customer_behavior_shift AS
SELECT
    cm.CustomerId,
    cm.Surname,
    cm.Geography,
    cm.Gender,
    cm.Age,
    cm.CreditScore,

    -- Balance tracking
    cm.Balance AS initial_balance,
    cs.Balance AS latest_balance,
    (cs.Balance - cm.Balance) AS balance_change,

    -- Product count tracking
    cm.NumOfProducts AS initial_products,
    cs.NumOfProducts AS latest_products,
    (cs.NumOfProducts - cm.NumOfProducts) AS product_count_change,

    -- Credit card and activity status
    cm.HasCrCard AS had_credit_card,
    cs.HasCrCard AS current_credit_card,
    
    cm.IsActiveMember AS initially_active,
    cs.IsActiveMember AS currently_active,

    -- Tenure comparison
    cm.Tenure AS original_tenure,
    cs.Tenure AS updated_tenure,

    -- Static data
    cm.EstimatedSalary,

    -- Final churn status
    cs.Exited,

    -- Churn risk label
    CASE 
        WHEN cs.Exited = 1 THEN 'Churned'
        WHEN cs.IsActiveMember = 0 AND cs.Balance < cm.Balance THEN 'High Risk'
        WHEN cs.NumOfProducts < cm.NumOfProducts THEN 'Potential Risk'
        ELSE 'Retained'
    END AS churn_risk_label

FROM customer_master cm
JOIN customer_snapshot cs
  ON cm.CustomerId = cs.CustomerId;


SELECT * FROM customer_behavior_shift LIMIT 100;
