# [596. Classes More Than 5 Students](https://leetcode.com/problems/classes-more-than-5-students)


## Description

<!-- description:start -->

<p>Table: <code>Courses</code></p>

<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
</pre>

<p>&nbsp;</p>

<p>Write a solution to find all the classes that have <strong>at least five students</strong>.</p>

<p>Return the result table in <strong>any order</strong>.</p>

<p>The&nbsp;result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
<strong>Output:</strong> 
+---------+
| class   |
+---------+
| Math    |
+---------+
<strong>Explanation:</strong> 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
</pre>

<!-- description:end -->

## Solutions

<!-- solution:start -->

### Solution 1: Grouping and Aggregation

We can use the `GROUP BY` statement to group by class and then use the `HAVING` statement to filter out the classes with a student count greater than or equal to $5$.

<!-- tabs:start -->

#### MySQL

```sql
# Write your MySQL query statement below
SELECT class
FROM Courses
GROUP BY 1
HAVING COUNT(1) >= 5;
```
