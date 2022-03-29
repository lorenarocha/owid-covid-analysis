CREATE TABLE covid.`covid-data` AS
    (SELECT 
        continent,
        location,
        date,
        population,
        total_cases,
        new_cases,
        total_deaths,
        new_deaths,
        new_vaccinations,
        total_vaccinations,
        people_vaccinated,
        people_fully_vaccinated
FROM covid.`owid-covid-data`);
CREATE VIEW covid.basics
AS
SELECT
    SUM(new_cases)                                   AS total_cases,
    SUM(new_deaths)                                  AS total_deaths,
    SUM(new_vaccinations) AS total_vaccinations
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL;
CREATE VIEW covid.`death-percentage-country`
AS
SELECT
    location,
    SUM(new_cases)                                     AS total_cases,
    SUM(new_deaths)                                    AS total_deaths,
    round(((SUM(new_deaths)) / (SUM(new_cases))) * 100, 2) AS death_percentage
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL
GROUP BY
    location
ORDER BY
    1;
CREATE VIEW covid.`death-rate-country`
AS
SELECT
    location,
    population,
    SUM(new_deaths)                                AS total_deaths,
    round(((SUM(new_deaths)) / (population)) * 100, 2) AS death_rate
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL
GROUP BY
    location,
    population
ORDER BY
    3 DESC;
CREATE VIEW covid.`vaccinations`
AS
SELECT
    location,
    population,
    MAX(people_vaccinated)                                AS people_vaccinated,
    MAX(people_fully_vaccinated)                                AS people_fully_vaccinated,
    round((MAX(people_vaccinated) / population) * 100, 2) AS vaccination_rate
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL
GROUP BY
    location,
    population
ORDER BY
    4 DESC;
CREATE VIEW covid.`vaccination-country`
AS
SELECT
    location,
    MAX(total_vaccinations) AS max_total_vaccinations
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL
GROUP BY
    location
ORDER BY
    2 DESC;
CREATE VIEW covid.`brazil-metrics`
AS
SELECT
    location,
    date,
    new_cases,
    new_deaths
FROM
    covid.`covid-data`
WHERE
    continent IS NOT NULL
    AND location LIKE 'Brazil';



