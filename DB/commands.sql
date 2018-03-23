INSERT INTO "Group" (edit, comment, name) VALUES (TRUE, TRUE,'admin');
INSERT INTO "Group" (edit, comment, name) VALUES (FALSE, TRUE,'user');


INSERT INTO "User" (role, email, phone) VALUES (1, 'admin@mail.ru', 9853029999);


INSERT INTO "Film" (title, director, description, rating)  VALUES ('Toy Story', 'John Lasseter', 'A little boy named Andy loves to be in his room, playing with his toys, especially his doll named "Woody". But, what do the toys do when Andy is not with them, they come to life. Woody believes that he has life (as a toy) good. However, he must worry about Andy''s family moving, and what Woody does not know is about Andy''s birthday party. Woody does not realize that Andy''s mother gave him an action figure known as Buzz Lightyear, who does not believe that he is a toy, and quickly becomes Andy''s new favorite toy. Woody, who is now consumed with jealousy, tries to get rid of Buzz. Then, both Woody and Buzz are now lost. They must find a way to get back to Andy before he moves without them, but they will have to pass through a ruthless toy killer, Sid Phillips.', 8.3);

INSERT INTO "Emotion" (combination, title) VALUES ('{0, 0, 0}', 'happy');

INSERT INTO "FilmEmotion" (film_id, emotion_id, emotion_value) VALUES (1, 1, 0.004931);

INSERT INTO "Emotion" (combination, title) VALUES ('{0, 1, 2}', 'happy, teen, funny');

INSERT INTO "UserWatch" (user_id, film_id) VALUES (1, 1);

INSERT INTO "UserRating" (user_id, film_id, emotion_id, "like", dislike) VALUES (1, 1, 2, TRUE, FALSE);

INSERT INTO "Comment" (film_id, text, rating, plus, minus, date) VALUES (1, 'The best film I have ever seen.', 8.7, 1, 0, '2018-03-23');


SELECT * FROM "Film" WHERE id = 1; /* Информация о фильме */

SELECT * FROM "Comment" WHERE film_id = 1 ORDER BY rating; /* Комменатрии для данного фильма,
                                                            отсортированные по рейтингу */
UPDATE "UserRating" SET "like" = FALSE WHERE user_id = 1; /* Удалить отметку пользователя */

DELETE FROM "UserWatch" WHERE user_id = 1;

SELECT * FROM "User" JOIN "UserRating" UR ON "User".id = UR.user_id; /* Информация о пользователе и его оценках */

SELECT * FROM "Film" JOIN "FilmEmotion" FE ON "Film".id = FE.film_id WHERE FE.emotion_id = 1; /* Список фильмов с заданной эмоцией */

SELECT * FROM "User" JOIN "UserWatch" UW ON "User".id = UW.user_id WHERE UW.film_id = 1; /* Информация о пользователях, которые смотрели фильм с id 1*/


SELECT * FROM "User" JOIN "UserWatch" UW ON "User".id = UW.user_id,
(SELECT id FROM "Film" WHERE title = 'Toy Story') as FT
WHERE  UW.film_id = FT.id; /* Информация о пользователях, которые смотрели фильм с названием Toy Story*/