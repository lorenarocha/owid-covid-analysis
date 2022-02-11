--Global statics
SELECT
    SUM(new_cases)                                   AS total_cases,
    SUM(new_deaths)                                  AS total_deaths,
    SUM(to_number(new_vaccinations, '999999999999')) AS total_vaccinations
FROM
    covid_data
WHERE
    continent IS NOT NULL;

--Cases vs Deaths
-- risk of mortality in patients infected with COVID-19
SELECT
    location,
    SUM(new_cases)                                     AS total_cases,
    SUM(new_deaths)                                    AS total_deaths,
    round((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM
    covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    location
ORDER BY
    1;

--Covid Death Rate (Deaths vs Population)
SELECT
    location,
    population,
    SUM(new_deaths)                                AS total_deaths,
    round((SUM(new_deaths) / population) * 100, 2) AS death_rate
FROM
    covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    location,
    population
ORDER BY
    3 DESC;

--ICU vs Hosp Beds
--bed occupancy by ICU patients
--null values
SELECT
    location,
    MAX(to_number(icu_patients, '999999999'))                                                          AS max_icu_patients,
    hospital_beds_per_thousand * 1000                                                                  AS hosp_beds,
    round(((MAX(to_number(icu_patients, '999999999'))) /(hospital_beds_per_thousand * 1000)) * 100, 2) AS beds_occupied
FROM
    covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    location,
    hospital_beds_per_thousand * 1000
ORDER BY
    2 DESC;

--Vaccination Rate (Vaccination vs Population) 
--null values
SELECT
    location,
    population,
    MAX(to_number(people_vaccinated, '999999999999'))                                AS people_vaccinated,
    round((MAX(to_number(people_vaccinated, '999999999999')) / population) * 100, 2) AS vaccination_rate
FROM
    covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    location,
    population
ORDER BY
    4 DESC;

--Top 10
SELECT
    location,
    MAX(to_number(total_vaccinations, '999999999999')) AS max_total_vaccinations
FROM
    covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    location
ORDER BY
    2 DESC;

--Brazil statics
SELECT
    location,
    collect_date,
    new_cases,
    new_deaths
FROM
    covid_data
WHERE
    continent IS NOT NULL
    AND location LIKE 'Brazil';

