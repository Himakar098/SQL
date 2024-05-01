SELECT titles.title, people.name 
FROM titles JOIN castmembers ON titles.title_id = castmembers.title_id 
JOIN people ON castmembers.person_id = people.person_id 
JOIN ratings ON titles.title_id = ratings.title_id WHERE ratings.rating >= 9;
