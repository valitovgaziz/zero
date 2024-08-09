package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"zero/models"

	"github.com/gofiber/fiber/v2"
	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/dialects/postgresql"
)

// POST /edit/:Id - изменение новости по Id
// GET /list - список новостейv

var DB reform.DB

func main() {
	// init server and routing
	app := fiber.New()
	app.Get("/list", getNews)
	app.Post("/edit/:id", editNews)
	log.Printf("app listen and serv: %s", app.Listen(":3000"))

	// init DB
	conStr := fmt.Sprintf(
		"%s://%s:%s/%s",
		os.Getenv("DB_USER"),
		os.Getenv("HOST_DB"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
	)
	sqlDB, err := sql.Open("postgres", conStr)
	if err != nil {
		log.Fatal("Can't connect to database", err)
	}

	logger := log.New(os.Stderr, "SQL: ", log.Flags())

	DB := reform.NewDB(sqlDB, postgresql.Dialect, reform.NewPrintfLogger(logger.Printf))
	log.Println("Db connected ", DB.String())
}

func getNews(c *fiber.Ctx) error {
	return c.SendString("Hello, World!")
}

func editNews(c *fiber.Ctx) error {
	editNews := new(models.News)
	if err := c.BodyParser(editNews); err != nil {
		log.Fatal("Can't parce from body news for edit", err)
	}
	return c.SendString("Edited")
}
