CREATE TABLE Users (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Schools(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT,
    "founded" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE Companies(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE UsersCon(
    "user1_id" INTEGER,
    "user2_id" INTEGER CHECK("user2_id" != "user1_id"),
    FOREIGN KEY("user1_id") REFERENCES "Users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "Users"("id")
);

CREATE TABLE SchoolsCon(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC,
    "type" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("school_id") REFERENCES "Schools"("id")
);

CREATE TABLE CompaniesCon(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("id")
);
