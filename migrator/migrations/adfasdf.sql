-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS NewsCategories (
    categoryId BIGINT NOT NULL PRIMARY KEY,
    newsId BIGINT NOT NULL REFERENCES News(Id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS NewsCategories;
-- +goose StatementEnd
