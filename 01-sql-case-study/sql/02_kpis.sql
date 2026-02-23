-- KPI: conversion and uplift (test vs control)
-- Conversion defined as having at least 1 order within 7 days after contact_date

WITH base AS (
  SELECT
    c.campaign_id,
    c.group_name,
    c.customer_id,
    c.contact_date,
    EXISTS (
      SELECT 1
      FROM `portfolio_sql.orders` o
      WHERE o.customer_id = c.customer_id
        AND o.order_date BETWEEN c.contact_date AND DATE_ADD(c.contact_date, INTERVAL 7 DAY)
    ) AS converted_7d
  FROM `portfolio_sql.campaign_contacts` c
),

kpi AS (
  SELECT
    campaign_id,
    group_name,
    COUNT(*) AS contacted,
    SUM(CAST(converted_7d AS INT64)) AS converters_7d,
    SAFE_DIVIDE(SUM(CAST(converted_7d AS INT64)), COUNT(*)) AS conversion_rate_7d
  FROM base
  GROUP BY 1,2
),

pivot AS (
  SELECT
    campaign_id,
    MAX(IF(group_name="test", conversion_rate_7d, NULL)) AS conv_test,
    MAX(IF(group_name="control", conversion_rate_7d, NULL)) AS conv_control
  FROM kpi
  GROUP BY 1
)

SELECT
  k.*,
  p.conv_test,
  p.conv_control,
  (p.conv_test - p.conv_control) AS uplift_absolute,
  SAFE_DIVIDE((p.conv_test - p.conv_control), p.conv_control) AS uplift_relative
FROM kpi k
JOIN pivot p USING (campaign_id)
ORDER BY campaign_id, group_name;