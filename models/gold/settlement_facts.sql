{{ config(materialized='table') }}

SELECT
  transaction_type,
  COUNT(*) AS transaction_count,
  SUM(transaction_amount) AS total_amount,
  COUNT(DISTINCT sender_name) AS unique_senders,
  COUNT(DISTINCT receiver_name) AS unique_receivers,
  ROUND(SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS fraud_rate_percent,
  ROUND(SUM(CASE WHEN balance_validation = 'invalid' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS invalid_balance_rate_percent,
  CURRENT_TIMESTAMP() AS fact_load_timestamp
FROM {{ ref('transactions_cleaned') }}
GROUP BY transaction_type

