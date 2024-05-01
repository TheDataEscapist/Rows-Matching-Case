/*Creating Database*/
create database rows_matching_case;

/*Making the database default*/
use rows_matching_case;

/*Altering the column names in both the tables and removing spaces in between for convenience*/
alter table data1 rename column `Order ID` to OrderID;
alter table data1 rename column `Product ID` to ProductID;
alter table data2 rename column `Order ID` to OrderID;
alter table data2 rename column `Product ID` to ProductID;

/*Query 1: The number of records (Order ID + Product ID combination) present in data1 but missing in data2*/
select count(*)
from data1 d1 left join data2 d2
on d1.OrderID = d2.OrderID and d1.ProductId = d2.ProductID
where d2.OrderID IS NULL and d2.ProductID IS NULL;

/*In the above solution, when we tend to left join, we get all the records from the left table i.e. data1 
and the matching records from the right table i.e. data2, based on their composite key.
Thereafter, we define a condition where the OrderID and the ProductID for data2 is NULL, 
giving us all the records present in data1 but missing in data2. 
The count function gives us the number of records missing in data2 but present in data1*/

/*Query 2: The number of records (Order ID + Product ID combination) missing in data1 but present in data2*/
select count(*)
from data2 d2 left join data1 d1
on d1.OrderID = d2.OrderID and d1.ProductId = d2.ProductID
where d1.OrderID IS NULL and d1.ProductID IS NULL;

/*In the above solution, when we tend to left join, we get all the records from the left table i.e. data2 
and the matching records from the right table i.e. data1, based on their composite key.
Thereafter, we define a condition where the OrderID and the ProductID for data1 is NULL, 
giving us all the records present in data2 but missing in data1. 
The count function gives us the number of records missing in data1 but present in data2*/

/*Query 3: The sum of the total quantity of records missing in data1 but present in data2*/
select sum(d2.Qty) as TotalQty
from data2 d2 left join data1 d1
on d1.OrderID = d2.OrderID and d1.ProductId = d2.ProductID
where d1.OrderID is NULL and d1.ProductID IS NULL;

/*In the above solution, when we tend to left join, we get all the records from the left table i.e. data2 
and the matching records from the right table i.e. data1, based on their composite key.
Thereafter, we define a condition where the OrderID and the ProductID for data1 is NULL, 
giving us all the records present in data2 but missing in data1. 
The sum function gives us the sum of the total Qty of records missing in data1 but present in data2*/

/*Query 4: The total number of unique records (Order ID + Product ID combination) present in the combined dataset of data1 and data2*/
select count(*)
from (
	select OrderID, ProductID
	from data1 
	Union
	select OrderID, ProductID
	from data2) as TempTable;
    
/*Here, Common Table Expression (CTE) is used as TempTable, to virtually store the unique records 
(Order ID + Product ID combination), by using UNION, present in the combined dataset of data1 and data2. 
This TempTable is further used in the main query to get the total number of unique records (or the count of the same)*/