INSERT INTO "Group" (write, read, comment, name) VALUES (TRUE, TRUE, TRUE,'admin');
INSERT INTO "Group" (write, read, comment, name) VALUES (FALSE, TRUE, TRUE,'user');


INSERT INTO "User" (role, email, phone) VALUES (1, 'admin@mail.ru', 79853029999);



INSERT INTO "Film" (title, director, description, rating)  VALUES ('Toy Story', 'John Lasseter', 'A little boy named Andy loves to be in his room, playing with his toys, especially his doll named "Woody". But, what do the toys do when Andy is not with them, they come to life. Woody believes that he has life (as a toy) good. However, he must worry about Andy''s family moving, and what Woody does not know is about Andy''s birthday party. Woody does not realize that Andy''s mother gave him an action figure known as Buzz Lightyear, who does not believe that he is a toy, and quickly becomes Andy''s new favorite toy. Woody, who is now consumed with jealousy, tries to get rid of Buzz. Then, both Woody and Buzz are now lost. They must find a way to get back to Andy before he moves without them, but they will have to pass through a ruthless toy killer, Sid Phillips.', 8.3);

INSERT INTO "Emotion" (combination, title) VALUES (0, 'happy');

INSERT INTO "UserRating" (user_id, film_id, emotion_id, "like", dislike) VALUES (1, 1, 2, TRUE, FALSE);

INSERT INTO "UserWatch" (user_id, film_id) VALUES (1, 1);
