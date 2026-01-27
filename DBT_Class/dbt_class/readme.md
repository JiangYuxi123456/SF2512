# dbt Core Demo

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

- Incremental models are implemented on event-level data using dbt incremental materializations.
- New records are selected using `is_incremental()` by comparing event timestamps against the latest processed timestamp.
- A merge-based upsert strategy is applied with a defined `unique_key` to handle duplicated or late-arriving events.
- Window functions (`row_number()`) are used to retain the most recent record per entity during incremental loads.



## Testing & Data Quality

- Column-level schema tests (`not_null`, `unique`) are defined for core models in `schema.yml`.
- Custom SQL tests are used to validate dataset completeness and basic data assumptions.
- Row-count checks are applied to detect incomplete loads or unexpected upstream data issues.
- These tests help ensure data reliability before downstream analytical use.



## Seed Data & A/B Testing

- Seed data is used to simulate controlled experiment datasets.
- A/B testing data is loaded via dbt seeds and integrated into transformation models.
- Experiment datasets are validated through custom SQL tests before downstream use.




