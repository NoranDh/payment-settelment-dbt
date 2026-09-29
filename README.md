# Payment Settlement Data Pipeline

A production-ready dbt medallion architecture for payment settlement reconciliation and fraud detection.

## Architecture

- **Bronze**: Raw payment transactions (6.4M rows from PaySim dataset)
- **Silver**: Deduplicated, standardized transactions with validation (2.7M rows)
- **Gold**: Settlement metrics and fraud analytics

## Key Features

-  Medallion architecture (bronze → silver → gold)
-  Automated data quality tests (8 tests, all passing)
-  dbt for version control and lineage tracking
-  Cost-optimized BigQuery queries
-  Column renaming for business clarity

## Tech Stack

- **dbt** 1.12.5
- **BigQuery** (Sandbox)
- **Python** (for data chunking)

## Running the Pipeline

```bash
dbt run
dbt test
```

