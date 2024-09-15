
# [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports)

[中文文档](/solution/0500-0599/0570.Managers%20with%20at%20Least%205%20Direct%20Reports/README.md)

## Description

<!-- description:start -->

<p>Table: <code>Employee</code></p>

<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
</pre>

<p>&nbsp;</p>

<p>Write a solution to find managers with at least <strong>five direct reports</strong>.</p>

<p>Return the result table in <strong>any order</strong>.</p>

<p>The result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
<strong>Output:</strong> 
+------+
| name |
+------+
| John |
+------+
</pre>

<!-- description:end -->

## Solutions

<!-- solution:start -->

### Solution 1: Grouping and Joining

We can first count the number of direct subordinates for each manager, and then join the `Employee` table to find the managers whose number of direct subordinates is greater than or equal to $5$.


#### MySQL

```sql
# Write your MySQL query statement below
SELECT name
FROM
    Employee
    JOIN (
        SELECT managerId AS id, COUNT(1) AS cnt
        FROM Employee
        GROUP BY 1
        HAVING cnt >= 5
    ) AS t
        USING (id);
```