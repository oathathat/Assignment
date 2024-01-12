CREATE TABLE movie(
    mov_id integer,
    mov_title varchar(50),
    mov_year integer,
    mov_time integer,
    mov_lang varchar(50),
    mov_dt_rel date,
    mov_rel_country varchar(5),
    PRIMARY KEY(mov_id)
);

CREATE TABLE actor(
    act_id integer,
    act_fname varchar(20),
    act_lname varchar(20),
    act_gender char(1),
    PRIMARY KEY(act_id)
);

CREATE TABLE director(
    dir_id integer,
    dir_fname varchar(20),
    dir_lname varchar(20),
    PRIMARY KEY (dir_id)
);

CREATE TABLE movie_direction(
    dir_id integer,
    mov_id integer,
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE  movie_cast(
    act_id integer,
    mov_id  integer,
    role    varchar(30),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE genres(
    gen_id integer,
    gen_title varchar(20),
    PRIMARY KEY (gen_id)
);

CREATE TABLE movie_genres(
    mov_id integer,
    gen_id integer,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE reviewer(
    rev_id integer,
    rev_name varchar(30),
    PRIMARY KEY (rev_id)
);

CREATE TABLE rating(
    mov_id integer,
    rev_id integer,
    rev_stars integer,
    num_o_ratings integer,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);