SELECT CONCAT(a.act_fname,' ',a.act_lname) 'Actor Name',SUM(mov_time) 'Total Time'
FROM movie m
INNER JOIN movie_cast mc ON mc.mov_id = m.mov_id
INNER JOIN actor a ON a.act_id = mc.act_id
INNER JOIN rating r ON r.mov_id = m.mov_id
WHERE r.rev_stars IS NOT NULL
GROUP BY a.act_fname,a.act_lname;