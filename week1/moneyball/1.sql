SELECT year, ROUND(AVG(salary),2) AS "Average salary"
    FROM salaries
    GROUP BY year
    ORDER BY year DESC;
