UPDATE actor
SET act_gender ='F'
WHERE LOWER(act_fname) REGEXP '^(em.*|char.*|.*dy|.*sy|.*lia)$';