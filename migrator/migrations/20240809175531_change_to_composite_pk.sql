-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS NewNewsCategories (
    categoryId BIGINT NOT NULL,
    newsId BIGINT NOT NULL REFERENCES News(Id),
    PRIMARY KEY (categoryId, newsId)
);
INSERT INTO
    NewNewsCategories
SELECT
FROM
    NewsCategories;
DROP TABLE IF EXISTS newscategories;
ALTER TABLE NewNewsCategories RENAME TO newscategories;
-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS AldNewsCategories (
    categoriId BIGINT NOT PRIMARY KEY,
    newsid BIGINT NOT NULL
);
INSERT INTO AldNewsCategories SELECT * FROM newscategories;
DROPT TABLE IF EXISTS newscategories;
ALTER TABLE AldNewsCategories RENAME TO newscategories;
-- +goose StatementEnd