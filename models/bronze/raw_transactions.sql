{{ config(materialized='table') }}

SELECT * FROM payment_bronze.chunk0
UNION ALL
SELECT * FROM payment_bronze.chunk1
UNION ALL
SELECT * FROM payment_bronze.chunk2
UNION ALL
SELECT * FROM payment_bronze.chunk3
UNION ALL
SELECT * FROM payment_bronze.chunk4
UNION ALL
SELECT * FROM payment_bronze.chunk5
UNION ALL
SELECT * FROM payment_bronze.chunk6
UNION ALL
SELECT * FROM payment_bronze.chunk7
UNION ALL
SELECT * FROM payment_bronze.chunk8
UNION ALL
SELECT * FROM payment_bronze.chunk9
UNION ALL
SELECT * FROM payment_bronze.chunk10
UNION ALL
SELECT * FROM payment_bronze.chunk11
UNION ALL
SELECT * FROM payment_bronze.chunk12
