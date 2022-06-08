package dto

type CategoryInfoDto struct {
	CategoryId  int    `json:"category_id"`
	Name        string `json:"name"`
	Description string `json:"description"`
}

type CategoriesInfoDto []CategoryInfoDto
