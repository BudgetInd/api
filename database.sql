create table users (
  username         VARCHAR(100) NOT NULL,
  password         VARCHAR(100) NOT NULL,
  name             VARCHAR(100) NOT NULL,
  token            VARCHAR(100),
  token_expired_at BIGINT,
  PRIMARY KEY (username),
  UNIQUE (token),
  constraint UniqueToken unique (token)
) engine=InnoDB;

create table contacts (
  id         VARCHAR(100) NOT NULL,
  username   VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name  VARCHAR(100),
  phone      VARCHAR(100),
  email      VARCHAR(100),
  PRIMARY KEY (id),
  FOREIGN KEY fk_users_contacts (username) REFERENCES users (username)
) engine=InnoDB;

create table addresses (
  id          VARCHAR(100) NOT NULL,
  contact_id  VARCHAR(100) NOT NULL,
  street      VARCHAR(200),
  city        VARCHAR(100),
  province    VARCHAR(100),
  country     VARCHAR(100) NOT NULL,
  postal_code VARCHAR(10),
  PRIMARY KEY (id),
  FOREIGN KEY fk_contacts_addresses (contact_id) REFERENCES contacts (id)
) engine=InnoDB

