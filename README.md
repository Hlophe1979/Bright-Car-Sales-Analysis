# Bright Motors Car Sales Analysis

## Overview

This project analyzes historical vehicle sales data for **Bright Motors** to uncover sales trends, customer preferences, and revenue drivers. The analysis was conducted using SQL for data transformation and Data Studio (Google Looker Studio) for visualization, with the goal of providing actionable recommendations to support business growth and operational efficiency.

---

## Business Problem

Bright Motors recently appointed a new Head of Sales to improve dealership performance, optimize inventory management, and expand market opportunities.

This project seeks to answer the following questions:

- Which vehicle makes and models generate the most revenue?
- What customer purchasing patterns can be identified?
- Which vehicle characteristics contribute most to sales performance?
- How do mileage, condition, and manufacturing year affect revenue?
- What business strategies can improve future performance?

---

## Dataset

The dataset contains vehicle sales transactions and vehicle characteristics, including:

| Column | Description |
|----------|-------------|
| year | Vehicle manufacturing year |
| make | Vehicle manufacturer |
| model | Vehicle model |
| trim | Vehicle trim level |
| body | Vehicle body type |
| transmission | Transmission type |
| vin | Vehicle Identification Number |
| state | Vehicle location |
| condition | Vehicle condition rating |
| odometer | Vehicle mileage |
| color | Exterior color |
| interior | Interior color |
| seller | Seller information |
| mmr | Market benchmark value |
| sellingprice | Vehicle selling price |
| saledate | Date of sale |
| unitssold | Number of units sold |

---

## Tools Used

### Data Processing
- Databricks SQL

### Data Visualization
- Data Studio (Google Looker Studio)

### Presentation
- Canva

### Version Control
- GitHub

---

## Data Preparation

The following data cleaning and transformation steps were performed:

### Data Cleaning

- Converted price columns to numeric format
- Standardized date formats
- Removed inconsistencies and invalid values
- Verified data types

### Feature Engineering

#### Total Revenue

```sql
total_revenue = sellingprice * unitssold
```

#### Mileage Category

Vehicles were grouped into:

- Very Low Mileage
- Low Mileage
- Medium Mileage
- High Mileage
- Very High Mileage

#### Pricing Strategy

Vehicles were categorized as:

- Premium Price
- Discounted Price
- Market Price

based on comparison with MMR values.

---

## Key Insights

### Revenue Performance

- BMW generated the highest overall revenue.
- Automatic transmission vehicles generated the highest revenue.
- Vehicles manufactured in 2013 generated the highest revenue.

### Vehicle Characteristics

- Vehicles in good condition generated the most revenue.
- Very high mileage vehicles contributed significantly to revenue.

### Pricing Analysis

- Revenue was generated through both premium-priced and discounted vehicles.
- MMR was treated as a market benchmark rather than a cost metric.

---

## Business Recommendations

### Inventory Management

- Increase inventory allocation for BMW vehicles.
- Prioritize sourcing automatic transmission vehicles.
- Focus on vehicle age segments with proven demand.

### Vehicle Quality

- Continue acquiring vehicles in good condition.
- Maintain strong vehicle inspection and reconditioning processes.

### Pricing Strategy

- Apply premium pricing to high-demand vehicles.
- Use strategic discounts for aging inventory.
- Implement data-driven pricing decisions using market benchmarks.

---

## Dashboard Features

The Data Studio (Google Looker Studio) dashboard includes:

- Revenue by Vehicle Make
- Revenue by Manufacturing Year
- Revenue by Transmission Type
- Revenue by Vehicle Condition
- Revenue by Mileage Category
- Pricing Strategy Analysis
- Interactive Filters and Slicers

---

## Results

The analysis identified the key drivers of revenue and highlighted customer preferences across vehicle types, transmission types, mileage categories, and manufacturing years.

The insights generated can help Bright Motors improve inventory planning, optimize pricing strategies, and make data-driven business decisions.

---

## Author

**[Tshepiso Hlophe]**

Data Analytics Case Study – Bright Motors
