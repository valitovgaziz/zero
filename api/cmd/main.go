package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
	_"gopkg.in/reform.v1"
)

// POST /edit/:Id - изменение новости по Id
// GET /list - список новостейv

func main() {
	app := fiber.New()
	app.Get("/list", func (c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Post("/edit/{id}", func (c *fiber.Ctx) error {
		return c.SendString("Edited")
	})

	log.Fatal(app.Listen(":3000"))
}

