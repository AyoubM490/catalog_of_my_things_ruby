create table music_albums(
  id serial not null primary key,
  archived boolean,
  publish_date date,
  on_spotify boolean
)

create table genres(
  id serial not null primary key,
  name varchar(100)
)