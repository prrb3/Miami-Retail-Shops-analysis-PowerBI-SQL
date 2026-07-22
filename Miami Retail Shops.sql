create or replace view retail.tables_joined as
select
s.date,
s.shop_id,
s.shop_name,
dayname(date) as day_of_week,
case when weekday(date) in (5,6) then "Weekend" else "Weekday" end as is_weekend,
s.customers,
s.sales_usd,
s.sales_usd/s.customers as sales_usd_per_customer,
su.pct_male,
su.pct_female,
su.pct_family,
su.pct_single,
w.avg_temp_f,
w.humidity_pct,
w.is_rain,
w.precip_in
from sales s
left join retail.survey su
using (date)
left join retail.weather w
using (date)
