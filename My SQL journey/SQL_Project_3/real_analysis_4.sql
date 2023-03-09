select "Car_Name", Sum("Car_Price") as "Total_Car_Price_Sold", "Car_Price", "Full_Name"
from
(select distinct(CONCAT("First_Name", ' ', "Last_Name")) as "Full_Name",
d."Sales_Managers_ID", d."Customer_Car_Code", c."Car_Name",
c."Car_Price",  t."Monthly_Target",d."Deposit_paid_for_booking"
from sales_data as d join cars_data as c on d."Customer_Car_Code" = c."Car_Code" 
join sales_team as t
on d."Sales_Managers_ID"= t."Sales_Manager_ID") as "tab1"
group by 1, 3, 4
order by 3
limit 3

