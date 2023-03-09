select round(avg("number_of_days_between_car_sales")) as "avg_number_of_days_between_car_sales"
from
(SELECT *, "Sold_On" - lag("Sold_On", 1) OVER (ORDER BY "Sold_On") AS "number_of_days_between_car_sales"
from sales_data) as "tab1"