SELECT birth_state, ROUND(AVG(height),2) AS "Average height" FROM players WHERE birth_country = "USA" GROUP BY birth_state ORDER BY birth_state;
