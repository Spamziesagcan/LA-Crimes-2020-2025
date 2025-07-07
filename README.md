# 📊 Los Angeles Crime Data Analysis (2020–2025)

A full-stack data analytics and forecasting project using **Los Angeles crime data** from 2020 to present. This project combines **MySQL, Python (EDA, TSA, GA)**, **Power BI**, and **Geospatial Visualization** to generate deep insights into crime patterns across Los Angeles.

---

## 📁 Dataset

- **Source**: [Data.gov - Crimes in Los Angeles (2020–Present)](https://catalog.data.gov/dataset/crime-data-from-2020-to-present)
- **Format**: CSV, updated daily  
- **Size**: 1M+ rows  
- **Fields**: Date, Crime Description, Time, Location, Victim Demographics, Division, Coordinates

---

## 🔧 Tools & Technologies

| Layer          | Tools Used                        |
|----------------|------------------------------------|
| **Database**   | MySQL Workbench, MySQL Shell       |
| **ETL & Prep** | Pandas, NumPy                      |
| **Analysis**   | Python (Matplotlib, Seaborn, Plotly, Statsmodels, Prophet) |
| **Geospatial** | GeoPandas, Shapely, Folium         |
| **Visualization** | Power BI Desktop, DAX, Custom Visuals |
| **Forecasting**| ARIMA, ARIMAX, SARIMAX, Prophet    |

---

## 🧱 Project Structure

LA-Crimes-2020-2025/
│
├── data/
│ ├── cleaned_crime.csv
│ └── shapefiles/ (LAPD divisions & districts)
│
├── sql/
│ ├── crimes_table_schema.sql
│ └── mysql_import_script.sql
│
├── notebooks/
│ ├── eda.ipynb
│ ├── time_series_analysis.ipynb
│ ├── geospatial_analysis.ipynb
│
├── visuals/
│ └── powerbi_dashboard.pbix
│
└── README.md


---

## ✅ Project Steps

### 1. 🔗 Data Storage & Integration
- Imported CSV into **MySQL database**
- Created crime table schema with attention to datatypes
- Enabled local file loading with security restrictions bypassed

### 2. 📊 Exploratory Data Analysis (EDA)
- Trend of crime over time
- Top crime types
- Day of week vs hour of day heatmaps
- Victim age/gender analysis

### 3. 🕒 Time Series Analysis (TSA)
- Grouped by date to create daily crime count
- Tested stationarity with ADF
- Performed forecasting using:
  - ARIMA
  - ARIMAX (with weekday dummies as exog)
  - SARIMAX (with seasonal parameters)
  - Prophet (holidays + seasonality handled)

### 4. 🌍 Geospatial Analysis
- Used LAPD division shapefiles
- Performed spatial joins with GeoPandas
- Generated choropleth maps by division
- Created heatmaps of crime hotspots
- Interactive folium map for incident exploration

### 5. 📈 Power BI Dashboard
- Multi-page dynamic dashboard:
  - Overview KPIs: Total Crimes, Arrest Rate*, Peak Hour
  - Time trends, weekday/hour breakdowns
  - Choropleth and heatmaps with slicers
  - Forecasting insights & hotspot analysis
- Used DAX for:
  - Crime rates
  - YOY Change
  - Rolling averages
  - Weekend vs Weekday analysis

> _Note: Arrest data was not available in the primary dataset, so related insights were excluded or approximated._

---

## 📸 Sample Visuals

| 📍 Geospatial Map | 📅 Time Series Forecast | 📊 Dashboard |
|------------------|--------------------------|--------------|
| ![](./visuals/map.png) | ![](./visuals/forecast.png) | ![](./visuals/dashboard.png) |

---

## 📌 Key Insights

- Crimes peaked during mid-2022, then gradually declined
- Theft-related crimes are most frequent; peak around weekends
- Crime density is highest in **77th Street**, **Newton**, and **Central** divisions
- Strong weekday-seasonality patterns observed in SARIMAX and Prophet
- Prophet showed smoother forecasting performance with holiday-aware modeling

---

## 🧠 Features That Stand Out

- Full-stack pipeline: MySQL → Python → Power BI
- Forecasting with multiple models including Prophet
- Cleaned and normalized LA shapefiles for proper spatial joins
- Custom Power BI slicers, bookmarks, and tooltip pages
- Forecast parameters tunable via What-If sliders

---

## 🚀 Getting Started

### Prerequisites
- Python 3.10+
- MySQL 8.0
- Power BI Desktop
- Jupyter / VSCode

### Run the project

```bash
# 1. Clone repo
git clone https://github.com/Spamziesagcan/LA-Crimes-2020-2025.git

# 2. Activate environment
pip install -r requirements.txt

# 3. Load SQL schema (optional)
#    or use cleaned CSVs for direct Python work

# 4. Launch Jupyter notebooks
jupyter notebook

```


## 👤 Author
Harsh Chandramania
📫 Reach out for collaborations, internships, or dashboard consulting.
