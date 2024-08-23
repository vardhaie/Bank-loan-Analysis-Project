select * from finance1;
select * from finance2;

select year(issue_d) NOTNULL
from finance1;

#KPI 1
select year(issue_d) as Year_of_issue_d , sum(loan_amnt) as Total_loan_amnt
from finance1
group by Year_of_issue_d
order by Year_of_issue_d;

#KPI 2
select grade, sub_grade, sum(revol_bal) as total_revol_bal
from finance1 inner join finance2
on(finance1.id = finance2.id)
group by grade, sub_grade
order by grade, sub_grade ;

#KPI 3
select verification_status ,
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance1 inner join finance2
on (finance1.id = finance2.id)
group by verification_status ;

#KPI 4
SELECT
f1.addr_state,f1.loan_status,count(f2.last_credit_pull_d)AS Total_count
FROM finance1 f1
LEFT JOIN finance2 f2
ON f1.id=f2.id
GROUP BY 1,2
ORDER BY 1,2;

#KPI 5
select
home_ownership as Home_Ownership, last_pymnt_d as Last_Payment_Date
from finance1 inner join finance2
on(finance1.id = finance2.id)
group by
home_ownership, last_pymnt_d
order by
home_ownership, last_pymnt_d ;
