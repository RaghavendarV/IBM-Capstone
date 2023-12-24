use ibm

select * from Spacex

--Task 1
--Display the names of the unique launch sites in the space mission
select distinct Launch_Site from Spacex


--Task 2
--Display 5 records where launch sites begin with the string 'CCA'
select TOP 5 * from Spacex
where Launch_Site like 'CCA%'


--Task 3
--Display the total payload mass carried by boosters launched by NASA (CRS)
select sum(PAYLOAD_MASS_KG) as NASA_CRS_PAYLOAD from Spacex
where Customer like 'NASA (CRS)%'


--Task 4
--Display average payload mass carried by booster version F9 v1.1
select avg(PAYLOAD_MASS_KG) as AVG_PAYLOAD from Spacex
where Booster_Version like 'F9 v1.1'


--Task 5
--List the date when the first succesful landing outcome in ground pad was acheived.
select top 1 Date,Landing_Outcome from Spacex
where Landing_Outcome like 'Success%'


--Task 6
--List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000
select Booster_Version,PAYLOAD_MASS_KG,Landing_Outcome from Spacex
where Landing_Outcome like 'Success (drone ship)' and
PAYLOAD_MASS_KG between 4000 and 6000


--Task 7
--List the total number of successful and failure mission outcomes
select Mission_Outcome,count(Mission_Outcome) as Rate from Spacex
group by Mission_Outcome


--Task 8
--List the names of the booster_versions which have carried the maximum payload mass. Use a subquery
select Booster_Version from Spacex
where PAYLOAD_MASS_KG = (
	select max(PAYLOAD_MASS_KG) from Spacex)


--Task 9
--List the records which will display the month names, failure landing_outcomes in drone ship ,booster versions, launch_site for the months in year 2015.
select DATENAME(MONTH,Date) as Month,Landing_Outcome,Booster_Version,Launch_Site from Spacex
where YEAR(Date) = 2015 and Landing_Outcome like 'Failure (drone ship)'


--Task 10
--Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order.
select row_number() over(order by count(Landing_Outcome) Desc) as Rate_Rank,Landing_Outcome, count(Landing_Outcome) as Rate from Spacex​
where date between '2010-06-04' and '2017-03-20'
group by Landing_outcome

