# 🏦 Bank Customer Churn Analysis — SQL Project

## 📘 Overview

This project focuses on understanding customer churn behavior in a banking environment using **SQL-based Exploratory Data Analysis (EDA)**. The dataset is provided by **Maven Analytics**, and the goal is to identify patterns and possible reasons behind customer churn by analyzing demographic and behavioral attributes.

---

## 🎯 Project Objectives

- 🧪 Perform data exploration (EDA) using SQL to assess churn characteristics.
- 🔍 Identify the key demographic and behavioral factors that influence customer churn.
- 📈 Derive actionable insights to inform retention strategies and model development.

---

## 🗂️ Dataset Information

- **Source**: [Maven Analytics](https://www.mavenanalytics.io/)
- **Dataset**: Bank Customer Churn
- **Tables Used**:
  - `customer_master`: Contains base-level information about customers.
  - `customer_snapshot`: Contains updates about their recent activity and churn status.

---

## 🧰 Tools & Technologies

- 💾 **MySQL**
- 🔧 **SQL Techniques Used**:
  - Windows Functions
  - Views
  - Aggregation functions
  - `CASE` statements
  - Filtering and grouping
  - Joins with `COALESCE`
- 📸 Snippets & output screenshots are included in the `/images/` folder.

---

## 📌 SQL Query Highlights

Below are brief descriptions of some key queries written for the analysis:

- **View Creation**: Combined both tables (`customer_master` and `customer_snapshot`) using a `LEFT JOIN` and `COALESCE()` to handle missing values.
- **Churn Overview**: Calculated total customers, churned customers, and the overall churn rate.
- **Churn by Geography**: Grouped data by `Geography` to compare churn across countries.
- **Churn by Age Group**: Used `CASE` to classify ages into buckets (`Under 30`, `30–50`, `Over 50`) and analyzed churn rate in each group.
- **Churn by Credit Score**: Categorized credit scores into `Low`, `Medium`, `High` and measured churn patterns.
- **Churn by Gender, Products, Activity**: Extended EDA to behavioral features like `IsActiveMember`, `HasCrCard`, and number of products held.

---

## 📊 Final Insights & Conclusion

### 🔹 Overall Churn Rate

- **Churned Customers**: 2,038 out of 10,002
- **Overall Churn Rate**: **20.38%**

---

### 🔹 Churn by Geography

| Country  | Churn Rate (%) |
|----------|----------------|
| 🇩🇪 Germany | **32.44** 🔺 |
| 🇫🇷 France  | 16.17         |
| 🇪🇸 Spain   | 16.67         |

➡️ **Germany has the highest churn rate**, indicating potential service or satisfaction issues.

---

### 🔹 Churn by Credit Score Bucket

| Credit Score Group | Churn Rate (%) |
|--------------------|----------------|
| Low (<= 580)       | 21.75          |
| Medium (581–720)   | 19.84          |
| High (> 720)       | 19.57          |

➡️ Even high credit score customers are churning, suggesting **competition or unmet expectations**.

---

### 🔹 Churn by Age Group

| Age Group   | Churn Rate (%) |
|-------------|----------------|
| Under 30    | 7.55           |
| 30–50       | 19.03          |
| Over 50     | **44.65** 🔺    |

➡️ Churn is **highest among customers over 50**, possibly due to **digital inaccessibility or lack of engagement**.

---

### 🔹 Churn by Age & Geography

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

➡️ **Germany’s over-50 segment** is the **most vulnerable**, with a churn rate approaching **60%**.

---

## 📌 Recommendations

- 🇩🇪 **Germany**: Focusing on satisfaction surveys, personalized support, and local engagement campaigns.
- 👵 **Age > 50**: Improving user experience for elderly customers; provide tutorials or simplified digital platforms.
- 💳 **High Credit Score Customers**: Implementing loyalty or cashback programs to retain this valuable segment.
- 🔮 **Next Steps**: Integrating EDA with machine learning models to **predict future churners** and implementing early retention strategies.

---

## 🙌 **Acknowledgements**

**Thanks to Maven Analytics for the dataset.**

**Project authored using MySQL with a focus on building analytical depth for churn prediction.**
