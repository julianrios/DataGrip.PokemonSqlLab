# Part 2: Simple Selects and Counts
# What are all the types of pokemon that a pokemon can have?
SELECT name
FROM types;

# What is the name of the pokemon with id 45?
SELECT name
FROM pokemons
WHERE id = 45;

# How many pokemon are there?
SELECT COUNT(name) as "Total Pokemon"
FROM pokemons;

# How many types are there?
SELECT COUNT(name) as "Total number of Types"
FROM types;

# How many pokemon have a secondary type?
SELECT COUNT(secondary_type) as "Total of Pokemon with a Secondary Type"
FROM pokemons;
