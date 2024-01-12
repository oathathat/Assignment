SELECT d.dir_fname,MAX(r.rev_stars),g.gen_title
FROM movie m
INNER JOIN movie_direction md ON md.mov_id = m.mov_id
INNER JOIN director d ON d.dir_id = md.dir_id
INNER JOIN rating r ON r.mov_id = m.mov_id
INNER JOIN movie_genres mg ON mg.mov_id = m.mov_id
INNER JOIN genres g ON g.gen_id = mg.gen_id
GROUP BY d.dir_fname,g.gen_title;