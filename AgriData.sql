use agriculture_db;

#Year-wise Trend of Rice Production Across Top 3 States
SELECT year, state_name, total_rice_production
FROM (
    SELECT year, state_name, 
           SUM(`rice_production_(1000_tons)`) AS total_rice_production,
           ROW_NUMBER() OVER (PARTITION BY year ORDER BY SUM(`rice_production_(1000_tons)`) DESC) AS rn
    FROM agriculture_data
    GROUP BY year, state_name
) ranked
WHERE rn <= 3
ORDER BY year, total_rice_production DESC;

#Top 5 Districts by Wheat Yield Increase Over the Last 5 Years
SELECT dist_name, state_name,
       MAX(`wheat_yield_(kg_per_ha)`) - MIN(`wheat_yield_(kg_per_ha)`) AS yield_increase
FROM agriculture_data
WHERE year BETWEEN 2013 AND 2017   
GROUP BY dist_name, state_name
ORDER BY yield_increase DESC
LIMIT 5;

#States with the Highest Growth in Oilseed Production (5-Year Growth Rate)
SELECT state_name,
       (MAX(`oilseeds_production_(1000_tons)`) - MIN(`oilseeds_production_(1000_tons)`)) 
       / NULLIF(MIN(`oilseeds_production_(1000_tons)`),0) * 100 AS growth_rate
FROM agriculture_data
WHERE year BETWEEN 2013 AND 2017  
GROUP BY state_name
ORDER BY growth_rate DESC
LIMIT 5;

#District-wise Area vs Production (Rice, Wheat, Maize)
USE agriculture_db;

SELECT dist_name, state_name,
       SUM(`rice_area_(1000_ha)`)  AS rice_area,  SUM(`rice_production_(1000_tons)`)  AS rice_production,
       SUM(`wheat_area_(1000_ha)`) AS wheat_area, SUM(`wheat_production_(1000_tons)`) AS wheat_production,
       SUM(`maize_area_(1000_ha)`) AS maize_area, SUM(`maize_production_(1000_tons)`) AS maize_production
FROM agriculture_data
GROUP BY dist_name, state_name;

#Yearly Cotton Production in Top 5 Cotton States 
SELECT state_name,
       ROUND(SUM(`cotton_production_(1000_tons)`), 2) AS total_cotton
FROM agriculture_data
GROUP BY state_name
ORDER BY total_cotton DESC
LIMIT 5;
SELECT year, state_name,
       ROUND(SUM(`cotton_production_(1000_tons)`), 2) AS yearly_cotton
FROM agriculture_data
WHERE state_name IN ('Gujarat', 'Maharashtra', 'Punjab', 'Haryana', 'Telangana')  
GROUP BY year, state_name
ORDER BY year, state_name;

#Districts with the Highest Groundnut Production in 2017
SELECT dist_name, state_name, SUM(`groundnut_production_(1000_tons)`) AS total_groundnut
FROM agriculture_data
WHERE year = 2017
GROUP BY dist_name, state_name
ORDER BY total_groundnut DESC
LIMIT 10;

#Annual Average Maize Yield Across All States
SELECT 
    year, 
    ROUND(AVG(`maize_yield_(kg_per_ha)`), 2) AS avg_maize_yield
FROM agriculture_data
GROUP BY year
ORDER BY year;

#Total Area Cultivated for Oilseeds in Each State
SELECT state_name, ROUND(AVG(`oilseeds_area_(1000_ha)`),2) AS total_oilseeds_area
FROM agriculture_data
GROUP BY state_name
ORDER BY total_oilseeds_area DESC;

#Districts with the Highest Rice Yield
SELECT dist_name, state_name, MAX(`rice_yield_(kg_per_ha)`) AS max_rice_yield
FROM agriculture_data
GROUP BY dist_name, state_name
ORDER BY max_rice_yield DESC
LIMIT 10;

#Compare the Production of Wheat and Rice for the Top 5 States Over 10 Years
SELECT state_name,
       ROUND(SUM(`rice_production_(1000_tons)` + `wheat_production_(1000_tons)`), 2) AS total_rw
FROM agriculture_data
GROUP BY state_name
ORDER BY total_rw DESC
LIMIT 5;
SELECT year, state_name,
       ROUND(SUM(`rice_production_(1000_tons)`), 2)  AS total_rice,
       ROUND(SUM(`wheat_production_(1000_tons)`), 2) AS total_wheat
FROM agriculture_data
WHERE state_name IN ('Uttar Pradesh','Punjab','West Bengal','Haryana','Madhya Pradesh')  
GROUP BY year, state_name
ORDER BY year, state_name;
