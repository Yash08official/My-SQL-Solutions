SELECT MAX(num) AS num
FROM
    (
        SELECT num
        FROM MyNumbers
        GROUP BY 1
        HAVING COUNT(1) = 1
    ) AS t;