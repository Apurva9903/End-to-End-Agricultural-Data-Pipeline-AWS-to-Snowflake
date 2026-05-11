# End-to-End-Agricultural-Data-Pipeline-AWS-to-Snowflake
## AWS S3 | Snowflake | Power BI

## 📖 Project Overview
This project demonstrates a complete cloud data pipeline designed to analyze the relationship between environmental factors—Rainfall, Temperature, and Humidity—and agricultural Yields.

The unique value of this analysis lies in its chronological consistency. The dashboard uses a standardized Year-over-Year (YoY) baseline across all pages. This allows for a direct comparison of how shifting climate variables impact crop output over a 15-year period.

## 🏗️ Data Architecture
Data Lake: Raw CSV agriculture data stored in Amazon S3.

Data Warehouse: Snowflake serves as the processing engine for ETL and feature engineering.

Storage Integration: Secure link established between AWS and Snowflake via IAM roles.

Data Transformation: SQL-based cleaning and logical grouping of temporal data.

Business Intelligence: Power BI connected to Snowflake to visualize multi-factor correlations.

## 📁 Repository Files (Direct Uploads)
agriculture_raw_data.csv: The initial dataset containing location, soil, and climate metrics.

snowflake_agriculture_etl.sql: The full script containing the storage integration, data loading logic, and feature engineering.

Agriculture_Analysis.pbix: The final Power BI report file.

## 🛠️ Data Engineering (Snowflake)
Before visualization, I used Snowflake SQL to perform critical data preparation:

Feature Engineering: Created a YEAR_GROUP dimension to categorize 15 years of data into three logical comparison phases (Y1, Y2, Y3).

Climatic Bucketing: Developed logic to classify Rainfall into LOW, MEDIUM, and HIGH groups to better isolate the environmental impact on specific crops like Paddy and Coconut.

Data Normalization: Applied coefficient logic to RAINFALL and AREA columns to ensure data consistency for year-over-year modeling.

## 📊 Analytics & Insights
The dashboard is structured into multiple reporting layers, all anchored by a fixed Year axis for easy comparison:

Yield vs. Rainfall: Analysis of how "High" rainfall buckets correlate with yield spikes or drops.

Temperature & Humidity Trends: Tracking the "sweet spot" for crop health across different soil types (Alluvial vs. Black Soil).

Comparative Evolution: By keeping the Year constant across all bar charts, users can see the exact moment a temperature shift influenced the final yield output.

## 🚀 Execution Steps
Ingestion: Raw data was uploaded to an S3 bucket (s3://powerbi6.project).

Processing: Snowflake scripts were executed to create the AGRICULTURE table and apply logical groupings.

Visualization: Power BI connected to the Snowflake warehouse to generate the final analytical views.

## Dashboard_Screenshot.png:
<img width="2088" height="1176" alt="image" src="https://github.com/user-attachments/assets/66f343e6-d9e7-4b49-bb56-35a87d4f3c92" />
