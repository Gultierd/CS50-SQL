SELECT name, ROUND(AVG(salary),2) AS "Average salary"
    FROM teams
    JOIN salaries ON teams.id = salaries.team_id
    WHERE salaries.year = "2001"
    GROUP BY team_id
    ORDER BY ROUND(AVG(salary),2) ASC LIMIT 5;
