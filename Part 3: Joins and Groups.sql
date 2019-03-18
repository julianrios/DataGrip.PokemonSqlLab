# Part 3: Joins and Groups
# What is each pokemon's primary type?
SELECT p.name as "Pokemon Name", t.name as "Pokemon Type"
FROM pokemons p
       JOIN types t
            ON p.primary_type = t.id;

# What is Rufflet's secondary type?
SELECT t.name as "Secondary Type"
FROM pokemons p
       JOIN types t
            ON p.secondary_type = t.id
WHERE p.name = "Rufflet";

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name as "Names of Pokemon for Trainer 303"
FROM pokemon_trainer ti
       JOIN pokemons p
            ON ti.pokemon_id = p.id
WHERE ti.trainerID = "303";

# How many pokemon have a secondary type Poison
SELECT COUNT(*) as "Number of Secondary Poison Type Pokemon"
FROM pokemons p
WHERE secondary_type IN (SELECT t.id
                         FROM types t
                         WHERE t.name = "Poison");

# What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(p.primary_type) as "Primary Types"
FROM pokemons p
       JOIN types t
            ON p.primary_type = t.id
GROUP BY t.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT ti.trainerID, COUNT(*) as "Number of Pokemon over Level 100"
FROM pokemon_trainer ti
WHERE ti.pokelevel = 100
GROUP BY trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT p.name as "Legendary Pokemon", COUNT(*) as "Number of Legendary Pokemon"
FROM pokemon_trainer pi,
     pokemons p
WHERE p.id = pi.pokemon_id
GROUP BY pokemon_id
HAVING COUNT(pi.pokemon_id) = 1;