{{ config(materialized='table') }}

WITH deduplicated AS (
  SELECT * EXCEPT(rn)
  FROM (
    SELECT 
      *,
      ROW_NUMBER() OVER (PARTITION BY step, nameOrig, nameDest, CAST(amount AS INT64), type ORDER BY step) AS rn
    FROM {{ ref('raw_transactions') }}
  )
  WHERE rn = 1
)
SELECT
  step AS transaction_sequence,
  type AS transaction_type,
  amount AS transaction_amount,
  nameOrig AS sender_name,
  nameDest AS receiver_name,
  oldbalanceOrg AS sender_balance_before,
  newbalanceOrig AS sender_balance_after,
  oldbalanceDest AS receiver_balance_before,
  newbalanceDest AS receiver_balance_after,
  isFraud AS is_fraud,
  isFlaggedFraud AS is_flagged_fraud,
  CURRENT_TIMESTAMP() AS load_timestamp,
  CASE WHEN (oldbalanceOrg - amount) = newbalanceOrig THEN 'valid' ELSE 'invalid' END AS balance_validation
FROM deduplicated
WHERE type IN ('PAYMENT', 'TRANSFER')