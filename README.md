# 🏢 Building a Modern SQL Data Warehouse from Scratch (PostgreSQL)

A hands-on Data Engineering project developing an enterprise-grade **PostgreSQL Data Warehouse** to consolidate ERP and CRM sales data, enable analytical reporting, and drive data-informed decision-making.

---

## 🎯 Project Objective

The goal of this project is to build an end-to-end modern data warehouse that integrates sales data from two distinct source systems (ERP and CRM). The pipeline cleanses raw data, resolves data quality anomalies, and models the integrated data into a user-friendly Star Schema for business intelligence and analytics.

---

## 📋 Project Specifications & Requirements

- **Data Sources:** Import and integrate sales data from two source systems (**ERP** and **CRM**) provided as CSV datasets.
- **Data Quality & Cleansing:** Identify, handle, and resolve data quality issues (e.g., duplicate entries, invalid formats, missing values, string whitespace) prior to analysis.
- **Data Integration:** Combine disparate datasets into a unified, business-friendly data model optimized for analytical queries.
- **Scope & Historization:** Process and load the **latest state of data** (historization / Slowing Changing Dimensions are out of scope as per business requirements).
- **Documentation:** Provide thorough documentation of the architecture, data pipeline, and data model to support both business stakeholders and technical analytics teams.
- **Platform & Stack:** PostgreSQL, pgAdmin / psql, and PL/pgSQL.

---

## 🏗️ Data Architecture (Medallion Pattern)

The project implements a multi-layered **Medallion Architecture** using PostgreSQL schemas to enforce strict separation of concerns across data stages:

### 1. 🥉 Bronze Layer (`bronze` schema)
- **Role:** Raw Data Ingestion
- **Description:** Acts as the landing zone for source CSV files from ERP and CRM systems. Data is ingested as-is without any structural or content modifications using native PostgreSQL `COPY` commands.

### 2. 🥈 Silver Layer (`silver` schema)
- **Role:** Data Cleansing & Normalization
- **Description:** Cleanses, standardizes, and validates data. Resolves missing values, trims whitespace, standardizes date formats, and aligns data types before joining datasets.

### 3. 🥇 Gold Layer (`gold` schema)
- **Role:** Business Dimensional Modeling
- **Description:** Houses business-ready data structured into a **Star Schema** (Dimension and Fact tables). Optimized for high-performance analytical queries, reporting, and BI dashboard consumption.

---

## 🛠️ Tech Stack & Methodology

- **Database Management System:** PostgreSQL
- **Database Tools:** pgAdmin / psql CLI
- **Language:** SQL / PL/pgSQL (DDL, DML, Functions, Views)
- **Modeling Framework:** Kimball Dimensional Modeling Methodology (Star Schema)
- **Version Control & Docs:** Git, GitHub, Markdown

---

## 📂 Repository Structure

```text
├── datasets/                 # Raw ERP & CRM source CSV files
│   ├── erp/                  # ERP source files
│   └── crm/                  # CRM source files
├── docs/                     # Technical and business documentation
│   ├── architecture.md       # Data architecture blueprints
│   ├── data-flow.md          # ETL data flow specifications
│   ├── data-dictionary.md    # Data definitions and business glossary
│   └── data-model.md         # Star Schema ERD and table mappings
├── scripts/                  # SQL Scripts by architecture layer
│   ├── bronze/               # DDL creation & COPY command bulk loading scripts
│   ├── silver/               # Cleansing & transformation procedures/functions
│   ├── gold/                 # Star schema DDL & population scripts
│   └── tests/                # Automated quality gates and assertion checks
└── README.md
