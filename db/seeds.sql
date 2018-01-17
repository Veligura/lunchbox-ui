begin;

insert into todos_list.item (id, body, created_at) values
  (1, 'Learn GraphQL',               '2017-07-03T14:11:30Z'),
  (2, 'Learn Apollo',                '2017-08-03T14:11:30Z'),
  (3, 'Learn Postgraphql',           '2017-08-03T14:11:30Z'),
  (4, 'Learn how use them together', '2017-08-03T14:11:30Z');

alter sequence todos_list.item_id_seq restart with 4;

commit;