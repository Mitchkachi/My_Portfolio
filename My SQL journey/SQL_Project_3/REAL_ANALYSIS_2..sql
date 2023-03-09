select d."Sales_Managers_ID", c."Car_Name", c."Car_Price",  t."Monthly_Target",
("Car_Price" / "Monthly_Target"* 100) as "Contrubuting_%_Of_Car_Sold"
from sales_data as d join cars_data as c on d."Customer_Car_Code" = c."Car_Code" 
join sales_team as t
on d."Sales_Managers_ID"= t."Sales_Manager_ID"
where d."Sales_Managers_ID" = 12134
group by 1, 2, 3, 4
order by 5
