-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS NewsCategories (
    categoryId BIGINT NOT NULL,
    newsId BIGINT NOT NULL REFERENCES News(Id),
    PRIMARY KEY (categoryId, newsId)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS NewsCategories;
-- +goose StatementEnd
