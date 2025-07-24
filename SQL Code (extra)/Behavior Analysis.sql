USE bank_churn_analysis


CREATE OR REPLACE VIEW customer_behavior_shift AS
SELECT
    cm.CustomerId,
    cm.Surname,
    cm.Geography,
    cm.Gender,
    cm.Age,
    cm.CreditScore,

    -- Compare Balance
    cm.Balance AS initial_balance,
    cs.Balance AS latest_balance,
    ROUND(cs.Balance - cm.Balance, 2) AS balance_change,

    -- Compare Number of Products
    cm.NumOfProducts AS initial_products,
    cs.NumOfProducts AS latest_products,
    cs.NumOfProducts - cm.NumOfProducts AS product_count_change,

    -- Credit Card and Activity Status
    cm.HasCrCard AS had_credit_card,
    cs.HasCrCard AS current_credit_card,

    cm.IsActiveMember AS initially_active,
    cs.IsActiveMember AS currently_active,

    -- Tenure tracking
    cm.Tenure AS original_tenure,
    cs.Tenure AS updated_tenure,

    -- Salary (unchanged)
    cm.EstimatedSalary,

    -- Final status
    cs.Exited,

    -- Churn Risk Logic
    CASE 
        WHEN cs.Exited = 1 THEN 'Churned'
        WHEN cs.IsActiveMember = 0 AND cs.Balance < cm.Balance THEN 'High Risk'
        WHEN cs.NumOfProducts < cm.NumOfProducts THEN 'Potential Risk'
        ELSE 'Retained'
    END AS churn_risk_label

FROM customer_master cm
JOIN customer_snapshot cs
    ON cm.CustomerId = cs.CustomerId;


SELECT * FROM customer_behavior_shift;
