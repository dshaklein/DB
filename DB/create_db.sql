CREATE TABLE "User" (
	"role" serial NOT NULL,
	"id" serial NOT NULL,
	"email" character varying(64) NOT NULL,
	"phone" BIGINT NOT NULL,
	CONSTRAINT User_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Group" (
	"id" serial NOT NULL,
	"edit" bool NOT NULL,
	"comment" bool NOT NULL,
	"name" character varying(20) NOT NULL,
	CONSTRAINT Group_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Film" (
	"id" serial NOT NULL,
	"title" character varying(60) NOT NULL,
	"description" TEXT NOT NULL,
	"rating" float8 NOT NULL,
	"director" character varying(60) NOT NULL,
	CONSTRAINT Film_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Comment" (
	"id" serial NOT NULL,
	"film_id" bigint NOT NULL,
	"text" TEXT NOT NULL,
	"rating" float8 NOT NULL,
	"plus" bigint NOT NULL,
	"minus" bigint NOT NULL,
	"date" DATE NOT NULL,
	CONSTRAINT Comment_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "FilmEmotion" (
	"id" serial NOT NULL,
	"film_id" bigint NOT NULL,
	"emotion_id" bigint NOT NULL,
	"emotion_value" float8 NOT NULL,
	CONSTRAINT FilmEmotion_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Emotion" (
	"id" serial NOT NULL,
	"combination" integer[3] NOT NULL DEFAULT '{0,0,0}',
	"title" character varying(60) NOT NULL,
	CONSTRAINT Emotion_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "UserWatch" (
	"id" serial NOT NULL,
	"user_id" bigint NOT NULL,
	"film_id" bigint NOT NULL,
	CONSTRAINT UserWatch_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "UserRating" (
	"id" serial NOT NULL,
	"user_id" bigint NOT NULL,
	"film_id" bigint NOT NULL,
	"emotion_id" bigint NOT NULL,
	"like" bool NOT NULL,
	"dislike" bool NOT NULL,
	CONSTRAINT UserRating_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("role") REFERENCES "Group"("id");



ALTER TABLE "Comment" ADD CONSTRAINT "Comment_fk0" FOREIGN KEY ("film_id") REFERENCES "Film"("id");

ALTER TABLE "FilmEmotion" ADD CONSTRAINT "FilmEmotion_fk0" FOREIGN KEY ("film_id") REFERENCES "Film"("id");
ALTER TABLE "FilmEmotion" ADD CONSTRAINT "FilmEmotion_fk1" FOREIGN KEY ("emotion_id") REFERENCES "Emotion"("id");


ALTER TABLE "UserWatch" ADD CONSTRAINT "UserWatch_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("id");
ALTER TABLE "UserWatch" ADD CONSTRAINT "UserWatch_fk1" FOREIGN KEY ("film_id") REFERENCES "Film"("id");

ALTER TABLE "UserRating" ADD CONSTRAINT "UserRating_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("id");
ALTER TABLE "UserRating" ADD CONSTRAINT "UserRating_fk1" FOREIGN KEY ("film_id") REFERENCES "Film"("id");
ALTER TABLE "UserRating" ADD CONSTRAINT "UserRating_fk2" FOREIGN KEY ("emotion_id") REFERENCES "Emotion"("id");
