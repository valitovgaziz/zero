package models

//reform:news
type News struct {
	id         int64  `reform:"id,pk"`
	title      string `reform:"title"`
	content    string `reform:"content"`
	categories []int  `reform:"categories"`
}
