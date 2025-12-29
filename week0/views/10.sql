SELECT ROUND(AVG(contrast),2) AS "Average contrast of 5 brightest Hokusai prints" FROM views WHERE artist = "Hokusai" ORDER BY brightness DESC LIMIT 5;
