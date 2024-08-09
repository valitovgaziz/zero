package models

//go:generate reform

//reform:newscategories
type NewsCategories struct {
	IdNews       int64 `reform:"id"`
	IdCategories int64 `reform:""`
}
