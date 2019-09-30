
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS statuses;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS user_photos;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE statuses(
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  body VARCHAR(255) NOT NULL
);

CREATE TABLE photos(
  id SERIAL PRIMARY KEY,
  img_src VARCHAR(255) NOT NULL
);

CREATE TABLE user_photos(
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  photo_id INTEGER NOT NULL
);

INSERT INTO users(username, email, created_at, updated_at)
VALUES
  ('cornCobbler10', 'corncobbler@corn.com', NOW(), NOW()),
  ('aMazeMe', 'mazesRKewl.maze', NOW(), NOW()),
  ('XciderAndDonutsXkillah', 'smallannoyingchild@hotmail.com', NOW(), NOW());

INSERT INTO statuses(user_id, body)
VALUES
  (1, 'I had much fun'),
  (2, 'definitely not part corn person there'),
  (3, 'the maze is a lie');


INSERT INTO photos(img_src)
VALUES
  ('imageOfCorn'),
  ('cornBeastPhoto');

INSERT INTO user_photos(user_id, photo_id)
VALUES
  (1, 1),
  (2, 2);

  -- SELECT users.username, statuses.body
  -- FROM users JOIN statuses ON users.id = statuses.user_id
  --
  -- SELECT users.username, users.id, user_photos.user_id, user_photos.photo_id, photos.id, photos.img_src
  -- FROM users
  -- JOIN user_photos ON users.id = user_photos.user_id
  -- JOIN photos ON photos.id = user_photos.photo_id;
  -- --
  -- SELECT users.username, photos.img_src
  -- FROM users
  -- JOIN user_photos ON users.id = user_photos.user_id
  -- JOIN photos ON photos.id = user_photos.photo_id;
