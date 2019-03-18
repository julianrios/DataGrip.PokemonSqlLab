# Part 4: Final Report
SELECT DISTINCT t.trainername AS "Trainers Name",
                p.name        AS "Pokemon Name",
                pt.pokelevel  AS "Level",
                tp.name       as "Primary Type",
                ts.name       as "Secondary Type"
FROM pokemons p
       LEFT OUTER JOIN pokemon_trainer pt ON p.id = pt.pokemon_id
       LEFT OUTER JOIN trainers t ON pt.trainerID = t.trainerID
       LEFT OUTER JOIN types tp ON p.primary_type = tp.id
       LEFT OUTER JOIN types ts ON p.secondary_type = ts.id;

# Strongest Trainer Ranking
SELECT t.trainername as "Trainer Name", AVG(pt.attack) as "Attack Damage"
FROM pokemons p
       JOIN pokemon_trainer pt
            ON p.id = pt.pokemon_id
       JOIN trainers t
            ON pt.trainerID = t.trainerID
GROUP BY t.trainername, pt.attack
ORDER BY AVG(pt.attack) DESC;
# Ranked by getting the AVG of all a Trainer's Pokemons attack damage