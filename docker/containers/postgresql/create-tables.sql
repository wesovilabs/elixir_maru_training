CREATE SEQUENCE tracks_seq;

CREATE TABLE "tracks"
( 
  "id" integer PRIMARY KEY default nextval('tracks_seq'),
  "title" varchar(200),
  "singer" varchar(200)
);