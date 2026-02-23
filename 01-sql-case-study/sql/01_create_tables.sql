-- BigQuery dataset: create a dataset named `portfolio_sql`
-- Then create tables with explicit schema.

CREATE OR REPLACE TABLE `portfolio_sql.customers` (
  customer_id STRING,
  signup_date DATE,
  country STRING,
  channel STRING
);

CREATE OR REPLACE TABLE `portfolio_sql.campaign_contacts` (
  campaign_id STRING,
  customer_id STRING,
  contact_date DATE,
  group_name STRING,  -- test / control
  channel STRING
);

CREATE OR REPLACE TABLE `portfolio_sql.orders` (
  order_id STRING,
  customer_id STRING,
  order_date DATE,
  amount NUMERIC,
  product_category STRING
);

CREATE OR REPLACE TABLE `portfolio_sql.events` (
  event_id STRING,
  customer_id STRING,
  event_date DATE,
  event_type STRING,
  source STRING
);