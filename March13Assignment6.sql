/* Table: Customer
product_key is a foreign key to Product table.
Table: Product
product_key is the primary key column for this table.
Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.*/

SELECT * FROM Product;
SELECT * FROM Customer;
SELECT customer_id FROM Customer GROUP BY customer_id HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);



/*Table: Products
product_id is the primary key for this table.
low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
Write an SQL query to find the ids of products that are both low fat and recyclable.

*/

SELECT * FROM products;
SELECT product_id FROM Products WHERE low_fats='Y' AND recyclable='Y';



/*
A pupil Tim gets homework to identify whether three line segments could possibly form a triangle.
However, this assignment is very heavy because there are hundreds of records to calculate.
Could you help Tim by writing a query to judge whether these three  sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z.
*/


SELECT * FROM Triangle;
 SELECT x,y,z,
	CASE
		WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes'
		ELSE 'No'
	END AS triangle
FROM Triangle;


/*
Table: Friends
id is the id of the friend and primary key for this table.
name is the name of the friend.
activity is the name of the activity which the friend takes part in.

Table: Activities
id is the primary key for this table.
name is the name of the activity.
Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.
*/

SELECT * FROM Friends;
SELECT * FROM Activities;
SELECT activity
FROM Friends
GROUP BY activity
HAVING COUNT(activity) != (
	SELECT MAX(activity_count) FROM (
		SELECT COUNT(activity) AS activity_count
		FROM Friends
		GROUP BY activity
        ) AS subquery
) AND COUNT(activity) != (
	SELECT MIN(activity_count) FROM (
		SELECT COUNT(activity) AS activity_count
		FROM Friends
		GROUP BY activity
       ) AS subquery
    );
    
    
    
/*
There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.
*/

SELECT * FROM CLASS1;
SELECT class FROM CLASS1 GROUP BY class HAVING COUNT(class)>=5;


/*
Write a SQL query to find all duplicate emails in a table named Person.
*/

SELECT * FROM Email;
SELECT email FROM Email GROUP BY email HAVING COUNT(*) > 1;


/*
Table: Submissions
There is no primary key for this table, it may have duplicate rows.
Each row can be a post or comment on the post.
parent_id is null for posts.
parent_id for comments is sub_id for another post in the table.

Write an SQL query to find number of comments per each post.
*/
-- SELECT * FROM Submissions
SELECT s.sub_id AS post_id,
COUNT(DISTINCT c.sub_id) AS number_of_comments 
FROM Submissions s LEFT JOIN Submissions c ON s.sub_id=c.parent_id 
WHERE s.parent_id IS NULL 
GROUP BY s.sub_id
ORDER BY s.sub_id;
