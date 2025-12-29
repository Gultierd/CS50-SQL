SELECT name, dropped, needs_improvement, per_pupil_expenditure
    FROM schools JOIN graduation_rates ON schools.id = graduation_rates.school_id
    JOIN expenditures ON schools.district_id = expenditures.district_id
    JOIN staff_evaluations ON schools.district_id = staff_evaluations.district_id
    WHERE  per_pupil_expenditure < (SELECT AVG(per_pupil_expenditure) FROM expenditures)
    AND needs_improvement < (SELECT AVG(needs_improvement) FROM staff_evaluations)
    ORDER BY dropped DESC, needs_improvement DESC;
