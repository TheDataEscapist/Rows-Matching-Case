# Rows-Matching-Case
### Situation:
Managed a SQL project focusing on data integrity and reconciliation using two datasets (data1 and data2) with Order ID + Product ID as the composite key. Each dataset included an additional Qty column.

### Task:
1. Identify the number of records present in data1 but missing in data2.
2. Identify the number of records missing in data1 but present in data2.
3. Calculate the sum of total quantity of records missing in data1 but present in data2.
4. Determine the total number of unique records in the combined dataset.

### Action:
1. Utilized DDL Commands to create the database and alter the tables.
2. Employed LEFT JOIN and IS NULL Operator to pinpoint records existing in one dataset but not the other.
3. Implemented UNION Operator to merge the datasets and find the total number of unique records.
4. Used Aggregate Functions to count the records and sum the quantities of missing records.
5. Leveraged CTE (Common Table Expressions) for improved query readability and maintenance.
6. Applied Aliases for concise and clear SQL statements.

### Result:
1. Successfully identified and isolated unique records discrepancies between the two datasets.
2. Accurately computed the total missing quantities, enhancing data reconciliation processes.
3. Provided a comprehensive count of unique records, supporting accurate data analysis and reporting.
