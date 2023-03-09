select *,
(("Monthly_Target" - "Total_Car_Sold") / "Monthly_Target" * 100) as "Percent_Target_Left"
from
(select distinct("Full_Name"), SUM("Car_Price") as "Total_Car_Sold", "Monthly_Target"
from
(select distinct(CONCAT("First_Name", ' ', "Last_Name")) as "Full_Name",
d."Customer_Car_Code", c."Car_Price", d."Deposit_paid_for_booking", t."Monthly_Target"
from sales_team as t join sales_data as d on 
t."Sales_Manager_ID" = d."Sales_Managers_ID" join cars_data as c on
d."Customer_Car_Code" = c."Car_Code") as "tab1"
group by 1, 3
order by 2) as "tab2"

