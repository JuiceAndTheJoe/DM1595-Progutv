/*
 Countries and dependent territories, 2020
 Data adapted from
 http://www.worldometers.info/world-population/population-by-country/
 Does not include rows which had "N.A." values, so some territories are missing.
 */

CREATE TABLE countries(
   name                    TEXT PRIMARY KEY,
   population              INTEGER,
   percent_one_year_change REAL,
   population_change       INTEGER,
   density_per_sq_km       INTEGER,
   area_sq_km              INTEGER,
   net_migrants            INTEGER,
   fertility_rate          REAL,
   median_age              REAL,
   percent_of_world_pop    REAL
);

INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('China',1439323776,0.39,5540090,153,9388211,-348399,1.70,38.00,18.47);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('India',1380004385,0.99,13586631,464,2973190,-532687,2.20,28.00,17.7);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('United States',331002651,0.59,1937734,36,9147420,954806,1.80,38.00,4.25);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Indonesia',273523615,1.07,2898047,151,1811570,-98955,2.30,30.00,3.51);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Pakistan',220892340,2.00,4327022,287,770880,-233379,3.60,23.00,2.83);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Brazil',212559417,0.72,1509890,25,8358140,21200,1.70,33.00,2.73);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Nigeria',206139589,2.58,5175990,226,910770,-60000,5.40,18.00,2.64);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Bangladesh',164689383,1.01,1643222,1265,130170,-369501,2.10,28.00,2.11);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Russia',145934462,0.04,62206,9,16376870,182456,1.80,40.00,1.87);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Mexico',128932753,1.06,1357224,66,1943950,-60000,2.10,29.00,1.65);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Japan',126476461,-0.30,-383840,347,364555,71560,1.40,48.00,1.62);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Ethiopia',114963588,2.57,2884858,115,1000000,30000,4.30,19.00,1.47);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Philippines',109581078,1.35,1464463,368,298170,-67152,2.60,26.00,1.41);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Egypt',102334404,1.94,1946331,103,995450,-38033,3.30,25.00,1.31);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Vietnam',97338579,0.91,876473,314,310070,-80000,2.10,32.00,1.25);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('DR Congo',89561403,3.19,2770836,40,2267050,23861,6.00,17.00,1.15);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Turkey',84339067,1.09,909452,110,769630,283922,2.10,32.00,1.08);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Iran',83992949,1.30,1079043,52,1628550,-55000,2.20,32.00,1.08);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Germany',83783942,0.32,266897,240,348560,543822,1.60,46.00,1.07);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Thailand',69799978,0.25,174396,137,510890,19444,1.50,40.00,0.9);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('United Kingdom',67886011,0.53,355839,281,241930,260650,1.80,40.00,0.87);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('France',65273511,0.22,143783,119,547557,36527,1.90,42.00,0.84);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Italy',60461826,-0.15,-88249,206,294140,148943,1.30,47.00,0.78);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Tanzania',59734218,2.98,1728755,67,885800,-40076,4.90,18.00,0.77);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('South Africa',59308690,1.28,750420,49,1213090,145405,2.40,28.00,0.76);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Myanmar',54409800,0.67,364380,83,653290,-163313,2.20,29.00,0.7);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Kenya',53771296,2.28,1197323,94,569140,-10000,3.50,20.00,0.69);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('South Korea',51269185,0.09,43877,527,97230,11731,1.10,44.00,0.66);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Colombia',50882891,1.08,543448,46,1109500,204796,1.80,31.00,0.65);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Spain',46754778,0.04,18002,94,498800,40000,1.30,45.00,0.6);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Uganda',45741007,3.32,1471413,229,199810,168694,5.00,17.00,0.59);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Argentina',45195774,0.93,415097,17,2736690,4800,2.30,32.00,0.58);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Algeria',43851044,1.85,797990,18,2381740,-10000,3.10,29.00,0.56);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Sudan',43849260,2.42,1036022,25,1765048,-50000,4.40,20.00,0.56);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Ukraine',43733762,-0.59,-259876,75,579320,10000,1.40,41.00,0.56);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Iraq',40222493,2.32,912710,93,434320,7834,3.70,21.00,0.52);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Afghanistan',38928346,2.33,886592,60,652860,-62920,4.60,18.00,0.5);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Poland',37846611,-0.11,-41157,124,306230,-29395,1.40,42.00,0.49);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Canada',37742154,0.89,331107,4,9093510,242032,1.50,41.00,0.48);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Morocco',36910560,1.20,438791,83,446300,-51419,2.40,30.00,0.47);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Saudi Arabia',34813871,1.59,545343,16,2149690,134979,2.30,32.00,0.45);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Uzbekistan',33469203,1.48,487487,79,425400,-8863,2.40,28.00,0.43);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Peru',32971854,1.42,461401,26,1280000,99069,2.30,31.00,0.42);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Angola',32866272,3.27,1040977,26,1246700,6413,5.60,17.00,0.42);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Malaysia',32365999,1.30,416222,99,328550,50000,2.00,30.00,0.42);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Mozambique',31255435,2.93,889399,40,786380,-5000,4.90,18.00,0.4);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Ghana',31072940,2.15,655084,137,227540,-10000,3.90,22.00,0.4);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Yemen',29825964,2.28,664042,56,527970,-30000,3.80,20.00,0.38);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Nepal',29136808,1.85,528098,203,143350,41710,1.90,25.00,0.37);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Venezuela',28435940,-0.28,-79889,32,882050,-653249,2.30,30.00,0.36);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Madagascar',27691018,2.68,721711,48,581795,-1500,4.10,20.00,0.36);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Cameroon',26545863,2.59,669483,56,472710,-4800,4.60,19.00,0.34);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Côte d''Ivoire',26378274,2.57,661730,83,318000,-8000,4.70,19.00,0.34);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('North Korea',25778816,0.44,112655,214,120410,-5403,1.90,35.00,0.33);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Australia',25499884,1.18,296686,3,7682300,158246,1.80,38.00,0.33);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Niger',24206644,3.84,895929,19,1266700,4000,7.00,15.00,0.31);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Taiwan',23816775,0.18,42899,673,35410,30001,1.20,42.00,0.31);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Sri Lanka',21413249,0.42,89516,341,62710,-97986,2.20,34.00,0.27);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Burkina Faso',20903273,2.86,581895,76,273600,-25000,5.20,18.00,0.27);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Mali',20250833,3.02,592802,17,1220190,-40000,5.90,16.00,0.26);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Romania',19237691,-0.66,-126866,84,230170,-73999,1.60,43.00,0.25);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Malawi',19129952,2.69,501205,203,94280,-16053,4.30,18.00,0.25);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Chile',19116201,0.87,164163,26,743532,111708,1.70,35.00,0.25);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Kazakhstan',18776707,1.21,225280,7,2699700,-18000,2.80,31.00,0.24);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Zambia',18383955,2.93,522925,25,743390,-8000,4.70,18.00,0.24);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Guatemala',17915568,1.90,334096,167,107160,-9215,2.90,23.00,0.23);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Ecuador',17643054,1.55,269392,71,248360,36400,2.40,28.00,0.23);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Syria',17500658,2.52,430523,95,183630,-427391,2.80,26.00,0.22);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Netherlands',17134872,0.22,37742,508,33720,16000,1.70,43.00,0.22);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Senegal',16743927,2.75,447563,87,192530,-20000,4.70,19.00,0.21);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Cambodia',16718965,1.41,232423,95,176520,-30000,2.50,26.00,0.21);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Chad',16425864,3.00,478988,13,1259200,2000,5.80,17.00,0.21);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Somalia',15893222,2.92,450317,25,627340,-40000,6.10,17.00,0.2);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Zimbabwe',14862924,1.48,217456,38,386850,-116858,3.60,19.00,0.19);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Guinea',13132795,2.83,361549,53,245720,-4000,4.70,18.00,0.17);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Rwanda',12952218,2.58,325268,525,24670,-9000,4.10,20.00,0.17);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Benin',12123200,2.73,322049,108,112760,-2000,4.90,19.00,0.16);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Burundi',11890784,3.12,360204,463,25680,2001,5.50,17.00,0.15);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Tunisia',11818619,1.06,123900,76,155360,-4000,2.20,33.00,0.15);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Bolivia',11673021,1.39,159921,11,1083300,-9504,2.80,26.00,0.15);
INSERT INTO countries(name,population,percent_one_year_change,population_change,density_per_sq_km,area_sq_km,net_migrants,fertility_rate,median_age,percent_of_world_pop) VALUES ('Belgium',11589623,0.44,50295,383,30280,48000,1.70,42.00,0.15);

 /* We'll work with only the first few countries, as per the tip in Canvas */
 
SELECT COUNT(name) AS countries_subset FROM countries;

/* Big-picture view of the dataset:
    - Average popultation
    - list of 20 most populated countries in our subset*/
    
SELECT
    AVG(population) AS avg_population
FROM countries;

SELECT name, population
FROM countries
ORDER BY population DESC LIMIT 20;

/* Grouping by net migration, losing vs gaining people */

SELECT
    name,
    CASE
        WHEN net_migrants > 0 THEN "gaining through inmigration"
        WHEN net_migrants < 0 THEN "losing to migration"
        ELSE "Migration doesn't affect this population! Incredible!"
  END AS migration_category
FROM countries
ORDER BY migration_category, name;

/* How many of which? */
SELECT 
  CASE 
    WHEN net_migrants > 0 THEN "gaining through inmigration"
        WHEN net_migrants < 0 THEN "losing to migration"
        ELSE "Migration doesn't affect this population! Incredible!"
  END AS migration_category,
  COUNT(*) AS num_countries
FROM countries
GROUP BY migration_category;

/* Visualizing top 5 gaining/losing people */

SELECT 'Top 5 Gaining' AS category, name, net_migrants
FROM countries
WHERE net_migrants > 0
ORDER BY net_migrants DESC
LIMIT 5;

SELECT 'Top 5 Losing' AS category, name, net_migrants
FROM countries
WHERE net_migrants < 0
ORDER BY net_migrants ASC
LIMIT 5;

/* Countries grouped by fertility level, only categories with median age under 30 */

SELECT 
  CASE
    WHEN fertility_rate < 2 THEN 'Low fertility'
    WHEN fertility_rate BETWEEN 2 AND 3 THEN 'Moderate fertility'
    ELSE 'High fertility'
  END AS fertility_group,
  AVG(median_age) AS avg_age,
  COUNT(*) AS num_countries
FROM countries
GROUP BY fertility_group
HAVING AVG(median_age) < 30;
/* This filerting helps find which fertility groups are associated with young populations */

/* Finding countries with young population AND high fertility OR high net migration */

SELECT name, median_age, fertility_rate, net_migrants
FROM countries
WHERE (median_age < 25 AND fertility_rate > 3) 
   OR net_migrants > 100000;