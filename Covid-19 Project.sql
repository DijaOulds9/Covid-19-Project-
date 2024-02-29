SELECT * FROM Covid_19_Project.covid_19_project;
# Data cleaning 
Select state, week_ending, facilities_reporting, staff_census, patient_census,patient_covid_cases, patient_covid_deaths,staff_covid_deaths
from covid_19_project;

#Data analytics 
# Looking at Total Cases VS Total Deaths in patients in MA  
# shows the liklihood of dying if you contract Covid_19 as a patient in MA
select state, week_ending, patient_covid_cases, patient_covid_deaths, (patient_covid_deaths/patient_covid_cases)*100 as Patient_deaths_Percentenge
from covid_19_project
where state = 'Ma'
order by state, week_ending;
# Looking at Total Cases VS Total Deaths in Staff in MA 
# shows the liklihood of dying if you contract Covid_19 as a hospital staff in MA
select state, week_ending, staff_covid_cases, staff_covid_deaths, (staff_covid_deaths/staff_covid_cases)*100 as Staff_deaths_Percentenge
from covid_19_project
where state = 'Ma'
order by state, week_ending;

##Looking at Covid_19 cases vs Population 
# shows what percentage of poulation got covid in patients in MA 
select state, week_ending, patient_census, patient_covid_cases, (patient_covid_cases/patient_census)*100 as Patients_Deaths_Percentenge
from covid_19_project
where state = 'Ma'
order by state, week_ending;
# shows what percentage of staff poulation got covid in MA 
select state, week_ending, staff_census, staff_covid_cases, (Staff_covid_cases/staff_census)*100 as Staff_Deaths_Percentenge
from covid_19_project
where state = 'Ma'
order by state, week_ending;

# states with highest patient infection rate compared to Patient Population 

select state, Max(patient_census) AS total_patient_Census, Max(patient_covid_cases)AS Highest_infection_rate, Max(patient_covid_cases/patient_census)*100 as Patients_INFECTION_percentage
from covid_19_project
Group by state
order by state; 
 

# states with highest Staff infection rate compared to Staff Population 
select state, sum(staff_census) AS total_staff_census, Max(staff_covid_cases)AS Highest_infection_rate, Max(staff_covid_cases/staff_census)*100 as staff_INFECTION_percentage
from covid_19_project
Group by state
order by state; 

# States with highest patient deaths compared to patient population 
##the likihood of you dying if you got covid and you live in that state
 select state, sum(Patient_census) AS total_patient_census, Max(patient_covid_deaths)AS Highest_death_rate, Max(patient_covid_cases/patient_census)*100 as Patients_Death_percentage
from covid_19_project
Group by state
order by patients_Death_percentage desc; 

# States with highest Staff deaths compared to staff population 
## shows the likehood of a staff memeber dying if they got covid and they live in that state 
select state, sum(staff_census) AS total_staff_census, Max(staff_covid_deaths)AS Highest_Death_rate, Max(staff_covid_deaths/staff_census)*100 as staff_death_percentage
from covid_19_project
Group by state
order by staff_death_percentage desc; 


