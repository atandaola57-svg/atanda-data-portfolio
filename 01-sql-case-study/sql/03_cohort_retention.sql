-- Cohort retention by signup month:
-- Retention = customer has an order in month N after signup month

WITH cohorts AS (
  SELECT
    customer_id,
    DATE_TRUNC(signup_date, MONTH) AS cohort_month
  FROM `portfolio_sql.customers`
),

activity AS (
  SELECT
    o.customer_id,
    DATE_TRUNC(o.order_date, MONTH) AS activity_month
  FROM `portfolio_sql.orders` o
),

joined AS (
  SELECT
    c.cohort_month,
    a.activity_month,
    DATE_DIFF(a.activity_month, c.cohort_month, MONTH) AS month_number,
    c.customer_id
  FROM cohorts c
  JOIN activity a USING(customer_id)
),

retention AS (
  SELECT
    cohort_month,
    month_number,
    COUNT(DISTINCT customer_id) AS active_customers
  FROM joined
  GROUP BY 1,2
),

cohort_size AS (
  SELECT
    cohort_month,
    COUNT(DISTINCT customer_id) AS cohort_customers
  FROM cohorts
  GROUP BY 1
)

SELECT
  r.cohort_month,
  r.month_number,
  r.active_customers,
  cs.cohort_customers,
  SAFE_DIVIDE(r.active_customers, cs.cohort_customers) AS retention_rate
FROM retention r
JOIN cohort_size cs USING(cohort_month)
ORDER BY cohort_month, month_number;