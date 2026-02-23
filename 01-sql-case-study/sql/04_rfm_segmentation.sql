-- RFM segmentation (simple, recruiter-friendly)
-- Recency: days since last order (from a reference date)
-- Frequency: number of orders
-- Monetary: total amount

DECLARE ref_date DATE DEFAULT DATE '2025-04-30';

WITH rfm AS (
  SELECT
    c.customer_id,
    DATE_DIFF(ref_date, MAX(o.order_date), DAY) AS recency_days,
    COUNT(o.order_id) AS frequency,
    SUM(o.amount) AS monetary
  FROM `portfolio_sql.customers` c
  LEFT JOIN `portfolio_sql.orders` o USING(customer_id)
  GROUP BY c.customer_id
),

scored AS (
  SELECT
    *,
    NTILE(4) OVER(ORDER BY recency_days ASC) AS r_score,       -- lower recency is better
    NTILE(4) OVER(ORDER BY frequency DESC) AS f_score,
    NTILE(4) OVER(ORDER BY monetary DESC) AS m_score
  FROM rfm
)

SELECT
  customer_id,
  recency_days, frequency, monetary,
  r_score, f_score, m_score,
  CONCAT(CAST(r_score AS STRING), CAST(f_score AS STRING), CAST(m_score AS STRING)) AS rfm_score,
  CASE
    WHEN r_score=4 AND f_score=4 AND m_score=4 THEN "Champions"
    WHEN r_score>=3 AND f_score>=3 THEN "Loyal"
    WHEN r_score=4 AND f_score<=2 THEN "New Customers"
    WHEN r_score<=2 AND f_score>=3 THEN "At Risk"
    ELSE "Others"
  END AS segment
FROM scored
ORDER BY monetary DESC;