CREATE TABLE Ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "glutenFree" BOOLEAN,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Donut_Ingredients (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("ingredient_id") REFERENCES "Ingredients"("id")
    FOREIGN KEY("donut_id") REFERENCES "Donuts"("id")
);

CREATE TABLE Customers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE Orders (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "Customers"("id")
);

CREATE TABLE Order_details (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "amount" INTEGER DEFAULT 1,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "Orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "Donuts"("id")
);


