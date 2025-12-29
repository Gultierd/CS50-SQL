CREATE TABLE Passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "age" INTEGER NOT NULL CHECK("age" >= 0),
    PRIMARY KEY("id")
);

CREATE TABLE Airlines(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE Flights(
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departure_code" TEXT NOT NULL,
    "departure_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_code" TEXT NOT NULL,
    "arrival_date" NUMERIC NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("airline_id") REFERENCES "Airlines"("id")
);

CREATE TABLE Check_ins (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "Flights"("id")
);
