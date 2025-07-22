
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


SELECT *
 FROM customer_behavior_shift LIMIT 100;
