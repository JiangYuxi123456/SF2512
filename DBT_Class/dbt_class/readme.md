# dbt Core Analytics Engineering Demo

---

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Repository Structure](#repository-structure)
- [Data Modeling](#data-modeling)
- [Incremental Processing](#incremental-processing)
- [Testing & Data Quality](#testing--data-quality)
- [Seed Data & A/B Testing](#seed-data--ab-testing)
- [Key Takeaways](#key-takeaways)

---

## Project Overview

This project focuses on data modeling, incremental data processing, and data quality validation using a relational data warehouse. 

---

## Tech Stack

- dbt Core  
- SQL  
- Git / GitHub  
- Relational data warehouse  

---

## Repository Structure

```text
dbt_class_1/
├── models/
│   ├── example/              # Introductory dbt models
│   └── petstore/             # Core analytics models
│       ├── tests/            # Custom SQL data tests
│       ├── *.sql             # Transformation and incremental models
│       ├── schema.yml        # Model-level tests
│       └── source.yml        # Source definitions and freshness checks
├── seeds/
│   └── abtesting/            # Seed data for A/B testing demo
├── macros/
├── analyses/
└── dbt_project.yml

```

## Data Modeling

- Raw data is defined using **dbt sources**, with freshness checks to monitor upstream data availability.
- Source models standardize and type raw fields before downstream transformations.
- Core transformation models reshape raw data into analytics-ready tables and views.
- Model dependencies are managed using `ref()` to ensure correct build order and lineage tracking.
- **Ephemeral models** are used to simplify transformations without materializing intermediate tables.


  ## Incremental Processing

- Incremental models are used to efficiently process growing datasets without full refreshes.
- Append-style logic is implemented using `is_incremental()` conditions.
- Merge-based upsert strategies are applied to deduplicate records during incremental loads.
- Window functions are used to retain the latest records based on event timestamps.



## Testing & Data Quality

- Schema tests such as `not_null` and `unique` are defined to enforce basic data integrity.
- **Custom SQL tests** are implemented to validate business assumptions.
- A/B testing datasets are checked for minimum row counts and structural completeness.
- Tests are executed as part of the dbt workflow to catch issues early.



## Seed Data & A/B Testing

- Seed data is used to simulate controlled experiment datasets.
- A/B testing data is loaded via dbt seeds and integrated into transformation models.
- Experiment datasets are validated through custom SQL tests before downstream use.



## Key Takeaways

- Hands-on experience with **dbt Core** analytics engineering workflows.
- Practical implementation of incremental loading and upsert strategies.
- Strong emphasis on data quality through schema and custom SQL tests.
- Structured approach to modeling analytics-ready datasets.


