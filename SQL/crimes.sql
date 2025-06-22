DROP DATABASE crime_data;
CREATE DATABASE crime_data;
USE crime_data;

CREATE TABLE crimes (
    dr_no BIGINT PRIMARY KEY,
    date_reported DATE,
    date_occurred DATE,
    time_occurred INT,
    area TINYINT,
    area_name VARCHAR(50),
    reporting_district_no INT,
    part TINYINT,
    crime_code INT,
    crime_description VARCHAR(255),
    mocodes VARCHAR(100),
    victim_age INT,
    victim_sex CHAR(1),
    victim_descent CHAR(1),
    premise_code INT,
    premise_description VARCHAR(100),
    weapon_code VARCHAR(10),
    weapon_description VARCHAR(100),
    status_code VARCHAR(10),
    status_description VARCHAR(100),
    crime_location VARCHAR(100),
    cross_street VARCHAR(100),
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7)
);

# 1. Number of rows
select count(*)
from crimes;

# 2. different crimes committed
select distinct crime_description
from crimes;

# 3. different premises where crimes were committed
select distinct premise_description
from crimes;

# 4. crimes committed on minors
select count(*)
from crimes 
where victim_age < 18;

# 5. crimes committed on female victims
select count(*)
from crimes
where victim_sex like 'F';

# 6. crimes committed per area 
select area_name, count(*) as crime_count
from crimes
group by area_name
order by crime_count desc;

# 7. crimes committed in the year 2023
select count(*)
from crimes
where year(date_reported) = 2023;

# 8. crime code distribution
select crime_code, count(*) as common
from crimes
group by crime_code
order by common desc
limit 5;

# 9. top 10 crime prone areas
select area_name, count(*) as crimes_count
from crimes
group by area_name
order by crimes_count desc
limit 10;

# 10. weapons involved crimes frequency distribution
select weapon_description, count(*) as weapon_count
from crimes
group by weapon_description
having weapon_description not like null
order by weapon_count desc;

# 11. part distribution
select part, count(*) as part_count
from crimes
group by part
order by part_count desc;

# 12. Cases that are still under investigation
select *
from crimes
where status_description like 'Invest Cont';

# 13. average age of victims of each crime
select crime_description, avg(victim_age) as avg_age
from crimes
group by crime_description;

# 14. average age of victims harmed in each area
select area_name, avg(victim_age) as victim_avg
from crimes
group by area_name
having victim_avg > 25;

# 15. crimes at each latitude and longitude
select latitude, longitude, count(*) as cnt
from crimes
group by latitude, longitude
order by cnt desc
limit 10;

# 16. areas where violent crimes have increased year by year
select
    a.area_name,
    a.year as current_year,
    a.crime_count as current_year_count,
    b.crime_count as previous_year_count,
    (a.crime_count - b.crime_count) as increase
from (
    select area_name, year(date_occurred) as year, count(*) as crime_count
    from crimes
    where crime_code in (110, 113, 121, 122, 210, 220, 230)
    group by area_name, year(date_occurred)
) a
join (
    select area_name, year(date_occurred) as year, count(*) as crime_count
    from crimes
    where crime_code in (110, 113, 121, 122, 210, 220, 230)
    group by area_name, year(date_occurred)
) b
on a.area_name = b.area_name and a.year = b.year + 1
where a.crime_count > b.crime_count
order by increase desc;

# 17. distribution of victim sex in each crime
select crime_description, victim_sex, count(*) as cont
from crimes
group by crime_description, victim_sex
order by crime_description, victim_sex desc;

# 18. Crime committed every hour
select
    floor(time_occurred / 100) as hour,
    count(*) as crime_count
from crimes
group by FLOOR(time_occurred / 100)
order by hour;

# 19. monthly crime distribution of the most dangerous areas
select
    extract(year from date_occurred) as year,
    extract(month from date_occurred) as month,
    count(*) as crime_count
from crimes
where area_name = (
    select area_name
    from crimes
    group by area_name
    order by count(*) desc
    limit 1
)
group by year, month
order by year, month;

# 20. unsolved crimes
select area_name, crime_description, count(*) as unsolved_count
from crimes
where status_code not in ('AR', 'ADW') 
group by area_name, crime_description
order by unsolved_count desc;