Question 1: 

    SELECT  to_char(creation_date, 'YYYY-MM'), count(contact_id) AS NbRequestPerMonth
    FROM "FactContacts"
    GROUP BY to_char(creation_date, 'YYYY-MM')
    ORDER BY to_char(creation_date, 'YYYY-MM');


Lien pour graphique:
http://rocketelevators.xyz/blazer/queries/1-question-1