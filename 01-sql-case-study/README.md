# 01 — SQL Case Study: Retail Marketing Campaign Analysis (Advanced SQL)

## Context
This project simulates a retail direct marketing environment.
The goal is to analyze campaign performance, customer behavior, and retention using **advanced SQL**.

## Objectives
- Build reliable KPIs for marketing campaigns (conversion, uplift, ROI proxy)
- Identify top segments (RFM) and key value drivers
- Measure retention with cohort analysis
- Validate data quality (duplicates, nulls, anomalies)

## Dataset (simulated)
- `customers`: customer master data
- `orders`: transactions
- `campaign_contacts`: campaign exposure (test vs control)
- `events`: digital interactions (optional)

## Tech & SQL Concepts
- CTEs, window functions (LAG, ROW_NUMBER, SUM OVER)
- Joins, aggregations, CASE WHEN
- Cohort retention
- RFM segmentation
- Data quality checks

## Project structure

## Results (KPIs produced)
- Campaign conversion rate (test vs control)
- Uplift (%)
- Revenue per contacted customer
- Cohort retention (weekly/monthly)
- RFM segments (Champions, Loyal, At Risk, etc.)

## How to run
1) Create tables (01_create_tables.sql)
2) Load CSVs into tables
3) Run KPI queries (02_kpis.sql)
4) Run cohort & RFM queries

## Next improvements
- Add A/B test statistical significance (Python notebook)
- Add incremental model and performance optimization
