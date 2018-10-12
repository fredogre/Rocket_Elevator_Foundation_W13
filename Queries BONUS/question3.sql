Question 3:

SELECT to_char(customer_id,'99999') as CustomerId, count(elevator_id) as NbElevator
    FROM "FactElevator"
    where building_id in
        (select distinct(building_id)
             from "FactElevator"
                 where customer_id in (
                    select distinct(customer_id) from "FactElevator"))
    
        
group by customer_id,building_id;

Lien pour graphique:
http://rocketelevators.xyz/blazer/queries/3-question-3