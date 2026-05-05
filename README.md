🛒 Zepto / Instamart SQL Data Analysis Project

This project demonstrates end-to-end data analysis on a quick-commerce dataset using SQL. It simulates real-world data analyst tasks such as data cleaning, exploration, and extracting business insights from raw data.

📌 Project Overview

The dataset contains product-level details including category, pricing, discounts, stock availability, and quantity. The goal is to analyze this data to generate insights that can support business decisions in areas like pricing, inventory management, and product performance.

⚙️ Tech Stack
PostgreSQL
SQL
pgAdmin 4
🧹 Data Cleaning
Removed records with invalid pricing (mrp = 0)
Converted prices from paise to rupees
Removed entries with weightInGms = 0 to avoid calculation errors
Checked for NULL values across key columns
🔍 Data Exploration
Counted total number of records
Identified unique product categories
Analyzed stock availability (in-stock vs out-of-stock)
Detected duplicate product entries
📊 Data Analysis & Insights
💰 Revenue Analysis
Identified top revenue-generating products
Calculated category-wise revenue contribution
🏷️ Discount Analysis
Found products with highest discounts
Computed average discount by category
Analyzed discount trends across price ranges
📦 Inventory Analysis
Counted out-of-stock products
Identified low-stock items for restocking
⚖️ Value for Money
Calculated price per gram to find best-value products
📈 Key Insights
A small number of products contribute significantly to total revenue
Some categories consistently offer higher discounts
Stock shortages may lead to potential revenue loss
Price-per-unit analysis highlights cost-effective products for customers
📁 Project Structure
├── zepto.sql        # SQL script (table creation + analysis queries)
├── zepto_v2.csv     # Dataset
└── README.md        # Project documentation
🚀 Learning Outcomes
Writing real-world SQL queries for business problems
Performing data cleaning using SQL
Extracting actionable insights from structured data
Handling edge cases like NULL values and division by zero
Building a portfolio-ready data analytics project
🎯 Use Case

This project simulates the role of a data analyst in a quick-commerce company like Zepto/Instamart, helping stakeholders make data-driven decisions regarding:

Pricing strategy
Inventory management
Product performance
🔮 Future Improvements
Build interactive dashboards using Power BI or Tableau
Apply advanced SQL (CTEs, Window Functions)
Add time-based analysis if date data is available
⭐ If you found this project useful, consider giving it a star!
