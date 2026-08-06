/*
===========================================================
Customer Intelligence & Financial Analytics Dashboard
Business Analytics SQL Queries
===========================================================

Technology Stack:
- MySQL
- Python
- Power BI

Dataset:
customer_intelligence_dataset

===========================================================
*/

-- Query 1: Total Customers
-- Business Question:
-- How many customers are present in the dataset?

SELECT COUNT(*) AS Total_Customers
FROM customer_intelligence;

-- Query 2: Total Revenue
-- Business Question:
-- What is the total revenue generated from all customer purchases?

SELECT ROUND(SUM(purchase_amount), 2) AS Total_Revenue
FROM customer_intelligence;

-- Query 3: Average Purchase Amount
-- Business Question:
-- What is the average purchase amount per customer?

SELECT ROUND(AVG(purchase_amount), 2) AS Average_Purchase
FROM customer_intelligence;

-- Query 4: Highest Purchase Amount
-- Business Question:
-- What is the highest purchase amount recorded?

SELECT MAX(purchase_amount) AS Highest_Purchase
FROM customer_intelligence;

-- Query 5: Lowest Purchase Amount
-- Business Question:
-- What is the lowest purchase amount recorded?

SELECT MIN(purchase_amount) AS Lowest_Purchase
FROM customer_intelligence;

-- Query 6: Revenue by Category
-- Business Question:
-- Which product categories generate the highest revenue?

SELECT
    category,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY category
ORDER BY Revenue DESC;

-- Query 7: Customer Count by Category
-- Business Question:
-- Which product categories are purchased by the most customers?

SELECT
    category,
    COUNT(*) AS Total_Customers
FROM customer_intelligence
GROUP BY category
ORDER BY Total_Customers DESC;

-- Query 8: Revenue by Season
-- Business Question:
-- Which season generates the highest revenue?

SELECT
    season,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY season
ORDER BY Revenue DESC;

-- Query 9: Average CLV by Customer Value Tier
-- Business Question:
-- What is the average Customer Lifetime Value for each customer value tier?

SELECT
    customer_value_tier,
    ROUND(AVG(estimated_clv),2) AS Average_CLV
FROM customer_intelligence
GROUP BY customer_value_tier
ORDER BY Average_CLV DESC;

-- Query 10: Average Customer Health Score by Customer Value Tier
-- Business Question:
-- Which customer value tier has the highest average health score?

SELECT
    customer_value_tier,
    ROUND(AVG(customer_health_score),2) AS Average_Health_Score
FROM customer_intelligence
GROUP BY customer_value_tier
ORDER BY Average_Health_Score DESC;

-- Query 11: Revenue by Customer Segment
-- Business Question:
-- Which customer segment contributes the highest revenue?

SELECT
    customer_segment,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY customer_segment
ORDER BY Revenue DESC;

-- Query 12: Customer Count by Segment
-- Business Question:
-- How many customers belong to each customer segment?

SELECT
    customer_segment,
    COUNT(*) AS Total_Customers
FROM customer_intelligence
GROUP BY customer_segment
ORDER BY Total_Customers DESC;

-- Query 13: Top 10 Customers by Customer Lifetime Value
-- Business Question:
-- Which customers have the highest estimated Customer Lifetime Value?

SELECT
    customer_id,
    estimated_clv
FROM customer_intelligence
ORDER BY estimated_clv DESC
LIMIT 10;

-- Query 14: Revenue by Payment Method
-- Business Question:
-- Which payment methods generate the highest revenue?

SELECT
    payment_method,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY payment_method
ORDER BY Revenue DESC;

-- Query 15: Revenue by Subscription Status
-- Business Question:
-- Do subscribed customers generate more revenue than non-subscribed customers?

SELECT
    subscription_status,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY subscription_status;

-- Query 16: Average Purchase Amount by Gender
-- Business Question:
-- Is there a difference in average purchase amount between genders?

SELECT
    gender,
    ROUND(AVG(purchase_amount),2) AS Average_Purchase
FROM customer_intelligence
GROUP BY gender;

-- Query 17: Top 10 Locations by Revenue
-- Business Question:
-- Which locations contribute the highest revenue?

SELECT
    location,
    ROUND(SUM(purchase_amount),2) AS Revenue
FROM customer_intelligence
GROUP BY location
ORDER BY Revenue DESC
LIMIT 10;

-- Query 18: Executive KPI Summary
-- Business Question:
-- What are the overall business performance indicators?

SELECT
	COUNT(*) AS Total_Customers,
	ROUND(SUM(purchase_amount),2) AS Total_Revenue,
	ROUND(AVG(purchase_amount),2) AS Average_Purchase,
	ROUND(AVG(estimated_clv),2) AS Average_CLV,
	ROUND(AVG(customer_health_score),2) AS Average_Health_Score,
	ROUND(SUM(revenue_at_risk),2) AS Total_Revenue_At_Risk
FROM customer_intelligence;

-- Query 19: Revenue at Risk by Customer Segment

SELECT
    customer_segment,
    ROUND(SUM(revenue_at_risk), 2) AS total_revenue_at_risk
FROM customer_intelligence
GROUP BY customer_segment
ORDER BY total_revenue_at_risk DESC;

-- Query 20: Average Purchase Frequency Score by Customer Segment

SELECT
    customer_segment,
    ROUND(AVG(purchase_frequency_score), 2) AS avg_purchase_frequency_score
FROM customer_intelligence
GROUP BY customer_segment
ORDER BY avg_purchase_frequency_score DESC;

-- Query 21: Top Customers with Highest Revenue at Risk

SELECT
    customer_id,
    customer_segment,
    customer_value_tier,
    estimated_clv,
    customer_health_score,
    revenue_at_risk
FROM customer_intelligence
WHERE revenue_at_risk > 0
ORDER BY revenue_at_risk DESC
LIMIT 10;

-- Query 22: Revenue at Risk by Customer Value Tier

SELECT
    customer_value_tier,
    ROUND(SUM(revenue_at_risk), 2) AS total_revenue_at_risk
FROM customer_intelligence
GROUP BY customer_value_tier
ORDER BY total_revenue_at_risk DESC;

-- Query 23: Average Customer Health Score by Segment

SELECT
    customer_segment,
    ROUND(AVG(customer_health_score), 2) AS avg_health_score
FROM customer_intelligence
GROUP BY customer_segment
ORDER BY avg_health_score DESC;

-- Query 24: Top Customers by Purchase Frequency Score
-- Business Question:
-- Which customers purchase most frequently?

SELECT
    customer_id,
    purchase_frequency_score,
    customer_segment
FROM customer_intelligence
ORDER BY purchase_frequency_score DESC
LIMIT 10;

-- Query 25: Customer Health Status Distribution
-- Business Question:
-- How are customers distributed across different health status categories?

SELECT
    health_status,
    COUNT(*) AS Total_Customers
FROM customer_intelligence
GROUP BY health_status
ORDER BY Total_Customers DESC;