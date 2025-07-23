# 🏦 Bank Customer Churn Analysis — SQL Case Study

## 📘 Overview

In this project, I explored customer churn behavior in a bank using **SQL-based exploratory data analysis (EDA)**. The dataset is sourced from **Maven Analytics**, and the main goal was to dig into the demographic and behavioral factors that contribute to customer churn. This helped me uncover patterns, potential pain points, and areas the bank can focus on to retain customers better.

---

## 🎯 Objectives

- Understand what drives customer churn through SQL-driven analysis  
- Explore relationships between churn and customer attributes like age, geography, credit score, and more  
- Translate raw data into insights that can support business decisions and retention strategies  

---

## 🗂️ About the Dataset

- **Source**: [Maven Analytics](https://www.mavenanalytics.io/)  
- **Dataset**: Bank Customer Churn  
- **Tables Used**:
  - `customer_master`: Contains the main customer profile information  
  - `customer_snapshot`: Provides updated churn-related and transactional data

---

## 🧰 Tools & Techniques

- **MySQL** for writing and executing all the queries  
- SQL features used:
  - Window functions  
  - Aggregations  
  - Conditional logic using `CASE`  
  - Joins (with `COALESCE()` to handle missing data)  
  - Views and filtering techniques  

📁 *Screenshots and SQL outputs are stored in the `/images/` folder.*

---

## 📌 Key Analysis Highlights

### ✅ Merged Data

Created a unified view by joining the two main tables to bring together demographic and behavioral data.

### ✅ Churn Overview

Calculated churn percentage across the entire customer base.

### ✅ Geography-Wise Comparison

Compared churn rates by country to identify regional differences.

### ✅ Age-Based Bucketing

Grouped customers into age brackets (Under 30, 30–50, Over 50) to examine churn behavior by life stage.

### ✅ Credit Score Segmentation

Analyzed churn trends across credit score levels — Low, Medium, and High.

### ✅ Behavioral Metrics

Explored features such as `IsActiveMember`, `HasCrCard`, and number of products to understand their influence on churn.

---

## 📊 Insights & Findings

### 🔹 Overall Churn Rate

- **Total Customers**: 10,002  
- **Churned Customers**: 2,038  
- **Churn Rate**: **20.38%**

---

### 🔹 Churn by Geography

| Country  | Churn Rate (%) |
|----------|----------------|
| 🇩🇪 Germany | **32.44** 🔺 |
| 🇫🇷 France  | 16.17         |
| 🇪🇸 Spain   | 16.67         |

> Germany shows significantly higher churn — could be tied to customer dissatisfaction, service gaps, or competition.

---

### 🔹 Churn by Credit Score

| Credit Score Group | Churn Rate (%) |
|--------------------|----------------|
| Low (<= 580)       | 21.75          |
| Medium (581–720)   | 19.84          |
| High (> 720)       | 19.57          |

> Surprisingly, even high credit score customers are churning — they might be expecting better perks or finding better options elsewhere.

---

### 🔹 Churn by Age Group

| Age Group   | Churn Rate (%) |
|-------------|----------------|
| Under 30    | 7.55           |
| 30–50       | 19.03          |
| Over 50     | **44.65** 🔺    |

> Churn is highest among customers over 50 — possibly due to difficulty with digital banking platforms or feeling under-engaged.

---

### 🔹 Age Group & Geography Combo

| Country  | Age Group | Churn Rate (%) |
|----------|-----------|----------------|
| France   | Under 30  | 5.19           |
| France   | 30–50     | 14.84          |
| France   | Over 50   | 39.97          |
| Germany  | Under 30  | 12.63          |
| Germany  | 30–50     | 31.11          |
| Germany  | Over 50   | **59.83** 🔺    |
| Spain    | Under 30  | 7.94           |
| Spain    | 30–50     | 15.28          |
| Spain    | Over 50   | 36.16          |

> The **over-50 segment in Germany** has the highest churn rate — nearly 60%! This is a serious red flag and may require immediate customer experience intervention.

---

## 💡 Recommendations

- **Germany**: Conduct customer satisfaction surveys and address region-specific issues. Localized support and tailored communication might help.  
- **Older Customers (50+)**: Consider simplifying mobile/web platforms and offering tutorials or guided banking sessions.  
- **High Credit Score Clients**: Launch reward or loyalty programs to keep this high-value segment engaged.  
- **What’s Next**: These insights can serve as a foundation for a churn prediction model using machine learning to take proactive retention actions.

---

## 🙌 Acknowledgements

Thanks to **Maven Analytics** for providing the dataset.

This project was carried out using **MySQL**, with a focus on drawing meaningful patterns from raw data to support real-world business decisions.

---
