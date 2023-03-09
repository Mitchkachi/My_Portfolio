select *, 'Max' as "Max_And_Min"
from
(select distinct("Full_Name"), SUM("Sum_Perc_Dep_Per_Car_Per_Sales_Mg") as "Sum_Perc_Dep"
from
(select "Full_Name", "Customer_Car_Code",
SUM("Deposit_paid_for_booking") as "Sum_Dep_Per_Car_Per_Sales_Mg",
SUM("Car_Price") as "Sum_Car_Price_Per_Car_Per_Sales_Mg",
SUM("Percentage_Deposit") as "Sum_Perc_Dep_Per_Car_Per_Sales_Mg"
from
(select *, ("Deposit_paid_for_booking" / "Car_Price" * 100) as "Percentage_Deposit"
from
(select CONCAT("First_Name", ' ', "Last_Name") as "Full_Name",d."Customer_Car_Code",
d."Deposit_paid_for_booking", c."Car_Price"
from sales_team as t join sales_data as d
on t."Sales_Manager_ID"= d."Sales_Managers_ID"
join cars_data as c 
on d."Customer_Car_Code" = c."Car_Code"
group by 1, 2, 3, 4) as "tab1"
group by 1, 2, 3, 4
order by 5) as "tab2"
group by 1,2
order by 3,4,5)as "tab3"
group by 1
order by 2 desc
limit 1) as "tab4"


UNION ALL


select *, 'Min' as "Max_And_Min"
from
(select distinct("Full_Name"), SUM("Sum_Perc_Dep_Per_Car_Per_Sales_Mg") as "Sum_Perc_Dep"
from
(select "Full_Name", "Customer_Car_Code",
SUM("Deposit_paid_for_booking") as "Sum_Dep_Per_Car_Per_Sales_Mg",
SUM("Car_Price") as "Sum_Car_Price_Per_Car_Per_Sales_Mg",
SUM("Percentage_Deposit") as "Sum_Perc_Dep_Per_Car_Per_Sales_Mg"
from
(select *, ("Deposit_paid_for_booking" / "Car_Price" * 100) as "Percentage_Deposit"
from
(select CONCAT("First_Name", ' ', "Last_Name") as "Full_Name",d."Customer_Car_Code",
d."Deposit_paid_for_booking", c."Car_Price"
from sales_team as t join sales_data as d
on t."Sales_Manager_ID"= d."Sales_Managers_ID"
join cars_data as c 
on d."Customer_Car_Code" = c."Car_Code"
group by 1, 2, 3, 4) as "tab1"
group by 1, 2, 3, 4
order by 5) as "tab2"
group by 1,2
order by 3,4,5)as "tab3"
group by 1
order by 2
limit 1) as "tab4"