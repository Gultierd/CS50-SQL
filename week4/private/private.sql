CREATE TABLE IF NOT EXISTS "phrases" (
    "phrase" TEXT
);

INSERT INTO phrases (phrase) VALUES
    (substr((SELECT sentence FROM sentences WHERE id = 14), 98, 4)),
    (substr((SELECT sentence FROM sentences WHERE id = 114), 3, 5)),
    (substr((SELECT sentence FROM sentences WHERE id = 618), 72, 9)),
    (substr((SELECT sentence FROM sentences WHERE id = 630), 7, 3)),
    (substr((SELECT sentence FROM sentences WHERE id = 932), 12, 5)),
    (substr((SELECT sentence FROM sentences WHERE id = 2230), 50, 7)),
    (substr((SELECT sentence FROM sentences WHERE id = 2346), 44, 10)),
    (substr((SELECT sentence FROM sentences WHERE id = 3041), 14, 5));

CREATE VIEW message AS
    SELECT phrase FROM phrases;
