-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS News (
    Id SERIAL PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS News;
-- +goose StatementEnd
