SELECT * FROM owid_covid_data;

--selecionando apenas algumas colunas para a análise

CREATE TABLE covid_data AS
    (SELECT 
        continent,
        location,
        collect_date,
        population,
        total_cases,
        new_cases,
        total_deaths,
        new_deaths,
        icu_patients,
        hospital_beds_per_thousand,
        new_vaccinations,
        total_vaccinations,
        people_vaccinated
FROM owid_covid_data);

SELECT * FROM covid_data;
    
        