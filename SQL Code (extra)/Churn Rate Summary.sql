SELECT 
    churn_risk_label,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM customer_behavior_shift), 2) AS percentage_share
FROM customer_behavior_shift
GROUP BY churn_risk_label;
