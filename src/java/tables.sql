CREATE TABLE cities (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    city VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE races (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    city_start INTEGER NOT NULL,
    city_end INTEGER NOT NULL,
    time_start VARCHAR(255),
    time_end VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (city_start) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (city_end) REFERENCES cities(id) ON DELETE CASCADE
);