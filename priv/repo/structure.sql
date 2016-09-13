CREATE SEQUENCE tracks_id_seq;

CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title   VARCHAR,
    singer VARCHAR,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);