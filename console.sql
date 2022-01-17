CREATE DATABASE printing_house_repository;

CREATE TABLE user_data
(
    id           BIGSERIAL PRIMARY KEY,
    name         VARCHAR(128),
    phone_number VARCHAR(16) NOT NULL UNIQUE,
    address      VARCHAR(128),
    role        SMALLINT DEFAULT 0,
    email        VARCHAR(32) NOT NULL UNIQUE,
    password     VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE machine
(
    id    SERIAL PRIMARY KEY,
    model VARCHAR(128) NOT NULL
);

CREATE TABLE service
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(128)  NOT NULL UNIQUE,
    description TEXT          NOT NULL,
    machine_id  INT REFERENCES machine (id),
    price       NUMERIC(8, 2) NOT NULL
);

CREATE TABLE order_data
(
    id            BIGSERIAL PRIMARY KEY,
    user_id       INT REFERENCES user_data (id)          NOT NULL,
    service_id    INT REFERENCES service (id)            NOT NULL,
    service_name  VARCHAR(128) REFERENCES service (name) NOT NULL,
    file          VARCHAR(128)                           NOT NULL,
    paper_type    VARCHAR(32),
    quantity      INT                                    NOT NULL,
    status        VARCHAR(32)                            NOT NULL,
    total_price   NUMERIC(8, 2),
    created_date  TIMESTAMP                              NOT NULL,
    delivery_date TIMESTAMP                              NOT NULL,
    delivery      VARCHAR(128)                           NOT NULL
);