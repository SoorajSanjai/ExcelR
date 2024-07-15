create database bank_loan;

use bank_loan;

--------------------------------------------------------------------------------------------------------------------------
# KPI 2

select * from finance_1 as f1
join finance_2 as f2
on f1.id=f2.id;


select f1.grade, f1.sub_grade, sum(f2.revol_bal) from finance_1 as f1
join finance_2 as f2
on f1.id=f2.id
group by grade, sub_grade
order by grade, sub_grade;





#### The answer is this one. Shows each grade's total revolving balance and percentage of total of each.
SELECT
    f1.grade,
    SUM(f2.revol_bal) AS total_revol_bal,
    (SUM(f2.revol_bal) / (SELECT SUM(revol_bal) FROM finance_2)) * 100 AS percentage_of_total
FROM
    finance_1 AS f1
JOIN
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY
    grade
ORDER BY
    grade;

# Given percentage of total so that we can easily understand which grade makes up for the highest.

--------------------------------------------------------------------------------------------------------------------------
# KPI 1

select concat("20",right(issue_d,2)) as "Year",concat((sum(loan_amnt)/1000000)," M") as "Total Loan Amount" from Finance_1 group by concat("20",right(issue_d,2)); 
# answer
# The issue date is stored in text format; so a YEAR() function won't work.

--------------------------------------------------------------------------------------------------------------------------
# KPI 3

select f1.verification_status as "Verification Status", concat((sum(f2.total_pymnt)/1000000)," M") as total_payment
from finance_1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by f1.verification_status;

--------------------------------------------------------------------------------------------------------------------------
# KPI 4

select addr_state as State, loan_status, count(loan_status) as Count
from finance_1
group by addr_state, loan_status
order by addr_state, loan_status;

--------------------------------------------------------------------------------------------------------------------------
# KPI 5

# KPI 5 Home ownership Vs last payment date stats
select concat("20",right(issue_d,2)) as payment_year, left(issue_d,3) as payment_month, f1.home_ownership, count(f1.home_ownership) home_ownership
from finance_1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by concat("20",right(issue_d,2)),left(issue_d,3), f1.home_ownership
order by concat("20",right(issue_d,2)),left(issue_d,3);
# for each year and each month within that year; how many people came under each type of home ownership


select concat("20",right(issue_d,2)) as payment_year, f1.home_ownership, count(f1.home_ownership) home_ownership
from finance_1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by payment_year, f1.home_ownership
order by payment_year;
# for each year how many people came under each type of home ownership








