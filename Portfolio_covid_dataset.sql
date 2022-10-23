-- comparing total death vs total cases
select location, date, total_cases, new_cases, total_deaths, population, (total_deaths/total_cases)*100 as deathpercent
From coviddata.cd
where location like '%Australia%'
order by 1,2;
-- 
select location, date, total_cases, new_cases, total_deaths, population, (total_cases/population)*100 as covidpercent
From coviddata.cd
where location like '%australia%'
order by 1,2
-- highest covid rate
select location, date, MAX(total_cases) as highestcount, new_cases, total_deaths, population, MAX((total_cases/population))*100 as covidpercent
From coviddata.cd
group by location, population
order by covidpercent desc

-- highest deathcount
select Continent, MAX(cast(total_deaths as integer)) as total_deathcount 
From coviddata.cd
group by continent
order by total_deathcount desc;

select  SUM(new_Cases), SUM(CAST(new_deaths as integer)), SUM(CAST(new_deaths as integer))/SUM(new_cases)*100 as deathpercentage
From coviddata.cd
where continent is not null
group by date
order by 1,2;

