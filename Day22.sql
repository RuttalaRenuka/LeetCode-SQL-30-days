select user_id, 
round(avg(case when activity_type = 'free_trial' then activity_duration end),2) as trial_avg_duration,
round(avg(case when activity_type = 'paid' then activity_duration end),2) as paid_avg_duration
from useractivity
group by 1
having user_id in (select distinct user_id from useractivity where activity_type='paid')
order by 1