--Global statics
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths,
SUM(TO_NUMBER(new_vaccinations, '999999999999')) as total_vaccinations
FROM covid_data
WHERE continent is not null;

--Cases vs Deaths
-- risk of mortality in patients infected with COVID-19
SELECT location, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths,
ROUND((SUM(new_deaths)/SUM(new_cases))*100, 2) AS death_percentage
FROM covid_data
WHERE continent is not null
GROUP BY location
ORDER BY 1;

--Covid Death Rate (Deaths vs Population)
SELECT location, population, SUM(new_deaths) as total_deaths,
ROUND((SUM(new_deaths)/population)*100,2) as death_rate
FROM covid_data
WHERE continent is not null
GROUP BY location, population
ORDER BY 3 DESC;

--ICU vs Hosp Beds
--bed occupancy by ICU patients
--null values
SELECT location, 
MAX(TO_NUMBER(icu_patients, '999999999')) as max_icu_patients,  
hospital_beds_per_thousand*1000 as hosp_beds,
ROUND(((MAX(TO_NUMBER(icu_patients, '999999999')))/(hospital_beds_per_thousand*1000))*100,2) as beds_occupied
FROM covid_data
WHERE continent is not null
GROUP BY location, hospital_beds_per_thousand*1000
ORDER BY 2 DESC;

--Vaccination Rate (Vaccination vs Population) 
--null values
SELECT location, population, MAX(TO_NUMBER(people_vaccinated, '999999999999')) as people_vaccinated,
ROUND((MAX(TO_NUMBER(people_vaccinated, '999999999999'))/population)*100, 2) as vaccination_rate
FROM covid_data
WHERE continent is not null
GROUP BY location, population
ORDER BY 4 DESC;

--Top 10
SELECT location, MAX(TO_NUMBER(total_vaccinations, '999999999999')) 
as max_total_vaccinations
FROM covid_data
WHERE continent is not null
GROUP BY location
ORDER BY 2 DESC;

--Brazil statics
SELECT location, collect_date, new_cases, new_deaths FROM covid_data
WHERE continent is not null
and location like 'Brazil';

