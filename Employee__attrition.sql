create table hrdata
(
	emp_no int8 PRIMARY KEY,
	gender varchar(50) NOT NULL,
	marital_status varchar(50),
	age_band varchar(50),
	age int8,
	department varchar(50),
	education varchar(50),
	education_field varchar(50),
	job_role varchar(50),
	business_travel varchar(50),
	employee_count int8,
	attrition varchar(50),
	attrition_label varchar(50),
	job_satisfaction int8,
	active_employee int8
);

===================================================================================================================================

-- importing the data

copy hrdata from 'C:\Users\abc\Downloads\hrdata.csv' delimiter ',' csv header;
select * from hrdata;

====================================================================================================================================

-- Employee Count:

select sum(employee_count) as Employee_Count from hrdata;

===================================================================================================================================

-- Attrition Count:

select count(attrition) from hrdata where attrition='Yes';

====================================================================================================================================

-- Attrition Rate:

select 
round (((select count(attrition) from hrdata where attrition='Yes')/ 
sum(employee_count)) * 100,2)
from hrdata;

=====================================================================================================================================

-- Active Employee:
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') as active_employees from hrdata;

======================================================================================================================================

-- Average Age:

select round(avg(age),0) as average_age  from hrdata;

=======================================================================================================================================

-- Attrition by Gender

select gender, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by gender
order by count(attrition) desc;

========================================================================================================================================

-- Department wise Attrition:

select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc;

==========================================================================================================================================

-- No of Employee by Age Group

SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;

===========================================================================================================================================

-- Education wise Attrition:

select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc;

===========================================================================================================================================

-- Attrition Rate by Gender for different Age Group

select age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender desc;

============================================================================================================================================









