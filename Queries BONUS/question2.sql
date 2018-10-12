Question 2: 

SELECT to_char(i, 'YYYY'), to_char(i, 'TMmon') AS MONTH,
count(quote_id)
FROM generate_series(now() - INTERVAL '1 year', now(), '1 month') as i
left join "FactQuotes" on (to_char(i, 'YYYY') = to_char(creation_date, 'YYYY')
and to_char(i, 'MM') = to_char(creation_date, 'MM'))
GROUP BY 1,2
ORDER BY 1,2;

Lien pour graphique:
http://rocketelevators.xyz/blazer/queries/2-question-2