# AgriData-Explorer
Exploratory Data Analysis, SQL queries, and Power BI dashboard for Indian Agriculture (1966–2017)
## 📌 Problem Statement
Agricultural data in India is complex and scattered, making it difficult for farmers, policymakers, and researchers to derive insights.  
This project integrates 50 years of agriculture data (1966–2017) to analyze **crop production, yield, and cultivated area**.

## ⚙️ Tools & Technologies
- Python (Pandas, Matplotlib, Seaborn) – EDA
- MySQL – Data storage & SQL analysis (10 queries)
- Power BI – Interactive dashboard

## 📊 Key Insights
- **Rice** production dominated by Punjab, West Bengal, and UP.
- **Wheat** yield improvements in specific districts over decades.
- **Cotton** concentrated in 5 states (Maharashtra, Gujarat leading).
- **Groundnut** – Gujarat leads in 2017.
- **Rice vs Wheat** comparison reveals crop shifts over time.

## 📂 Repository Structure
- `EDA.ipynb` → Python notebook for data cleaning & EDA
- `agriculture_queries.sql` → 10 SQL queries
- `agriculture_dashboard.pbix` → Power BI dashboard
- `dashboard_screenshots/` → PNG snapshots of visuals

## 🚀 How to Run
1. Clone this repo
2. Load `cleaned_agriculture_data.csv` into MySQL (`agriculture_db`)
3. Run queries from `agriculture_queries.sql`
4. Open `agriculture_dashboard.pbix` in Power BI Desktop
