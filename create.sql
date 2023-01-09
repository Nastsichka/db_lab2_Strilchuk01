CREATE TABLE authors (
	author_id SERIAL,
	author_name varchar(40) NOT NULL
);

CREATE TABLE periods (
	period_id SERIAL,
	period_name VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
	genre_id SERIAL,
	genre_name VARCHAR(25) NOT NULL
);

CREATE TABLE poems (
	poem_id SERIAL,
	poem_name VARCHAR(100),
	poem_content VARCHAR(1000) NOT NULL,
	author_id INT NOT NULL,
	period_id INT NOT NULL,
	genre_id INT NOT NULL
);

-- -------------------
-- Define primary keys
-- -------------------
ALTER TABLE authors ADD PRIMARY KEY (author_id);
ALTER TABLE periods ADD PRIMARY KEY (period_id);
ALTER TABLE genres ADD PRIMARY KEY (genre_id);
ALTER TABLE poems ADD PRIMARY KEY (poem_id);


-- -------------------
-- Define foreign keys
-- -------------------
ALTER TABLE Poems ADD CONSTRAINT FK_Poems_Authors FOREIGN KEY (author_id) REFERENCES authors (author_id);
ALTER TABLE Poems ADD CONSTRAINT FK_Poems_Periods FOREIGN KEY (period_id) REFERENCES periods (period_id);
ALTER TABLE Poems ADD CONSTRAINT FK_Poems_Genres FOREIGN KEY (genre_id) REFERENCES genres (genre_id);

