SELECT *
FROM (
    SELECT
        CONCAT(d.dir_fname, ' ', d.dir_lname) AS `Director Name`,
        CONCAT(a.act_fname, ' ', a.act_lname) AS `Actress Name`,
        COUNT(*) AS `Collaboration Count`,
        ROW_NUMBER() OVER (PARTITION BY d.dir_id ORDER BY COUNT(*) DESC) AS rn
    FROM movie m
    INNER JOIN movie_direction md ON md.mov_id = m.mov_id
    INNER JOIN director d ON d.dir_id = md.dir_id
    INNER JOIN movie_cast mc ON mc.mov_id = m.mov_id
    INNER JOIN actor a ON a.act_id = mc.act_id
    WHERE a.act_gender = 'F'
    GROUP BY d.dir_id, `Actress Name`
) AS ranked
WHERE rn <= 5
ORDER BY `Director Name`, `Collaboration Count` DESC;