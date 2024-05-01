SELECT * FROM AFLResult WHERE (homeTeam == 'West Coast' and homescore >= awayScore) OR (awayTeam == 'West Coast' and awayScore >= homescore);
