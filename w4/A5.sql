select titles.title, ratings.rating, ratings.votes 
from titles JOIN ratings ON titles.title_id=ratings.title_id 
where ratings.votes>1000000 ORDER BY rating DESC;
