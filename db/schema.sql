begin;

drop schema if exists lunchbox cascade;
create schema lunchbox;

CREATE TABLE lunchbox.company (
  id           SERIAL PRIMARY KEY,
  name         TEXT NOT NULL CHECK (char_length(name) < 80),
  address      TEXT NOT NULL CHECK (char_length(address) < 255),
  full_address TEXT,
  logo         TEXT,
  coordinate   POINT
);

-- comment on table lunchbox.company is 'A user of the company.';
-- comment on column lunchbox.company.id is 'The primary unique identifier for the company.';
-- comment on column lunchbox.company.person.first_name is 'The person’s first name.';
-- comment on column flunchbox.company.last_name is 'The person’s last name.';
-- comment on column lunchbox.company.about is 'A short description about the user, written by the user.';
-- comment on column lunchbox.company.created_at is 'The time this person was created.';


CREATE TABLE lunchbox.customer (
  id         SERIAL PRIMARY KEY,
  first_name TEXT    NOT NULL CHECK (char_length(first_name) < 80),
  last_name  TEXT CHECK (char_length(last_name) < 80),
  floor      INTEGER,
  room       INTEGER,
  about      TEXT,
  company_id INTEGER NOT NULL REFERENCES lunchbox.company (id)
);

CREATE TABLE lunchbox.menu_type (
  id          SERIAL PRIMARY KEY,
  description TEXT CHECK (char_length(description) < 30)
);

CREATE TABLE lunchbox.menu (
  id          SERIAL PRIMARY KEY,
  name        TEXT    NOT NULL CHECK (char_length(name) < 80),
  type        INTEGER NOT NULL REFERENCES lunchbox.menu_type (id),
  image       TEXT,
  description TEXT CHECK (char_length(description) < 1000),
  price       INTEGER NOT NULL

);

CREATE TABLE lunchbox.orders (
  id          SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES lunchbox.customer (id),
  menu_id     INTEGER NOT NULL REFERENCES lunchbox.menu (id),
  date        DATE
);






commit;