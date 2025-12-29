CREATE TABLE `Users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32),
    `username` VARCHAR(16) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE Schools(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` VARCHAR(16) NOT NULL,
    `location` VARCHAR(32),
    `founded` SMALLINT,
    PRIMARY KEY(`id`)
);

CREATE TABLE Companies(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` VARCHAR(16) NOT NULL,
    `location` VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE UsersCon(
    `user1_id` INT,
    `user2_id` INT,
    FOREIGN KEY(`user1_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `Users`(`id`),
    CONSTRAINT `id_match` CHECK (`user1_id` != `user2_id`)
);

CREATE TABLE SchoolsCon(
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `type` VARCHAR(16) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `Schools`(`id`)
);

CREATE TABLE CompaniesCon(
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(64) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
);
