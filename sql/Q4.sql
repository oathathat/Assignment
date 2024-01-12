ALTER TABLE genres ADD COLUMN new_gen_title INTEGER;
SET @row_number = 0;
UPDATE genres
SET new_gen_title = (@row_number := @row_number + 1)
ORDER BY gen_title;
ALTER TABLE genres DROP COLUMN gen_title;
ALTER TABLE genres CHANGE COLUMN new_gen_title gen_title INTEGER;