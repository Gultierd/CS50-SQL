SELECT name, SUM(H) FROM teams
    JOIN performances ON teams.id = performances.team_id
    WHERE performances.year = "2001"
    GROUP BY performances.team_id
    ORDER BY SUM(H) DESC LIMIT 5;
