package dto

type CategoryDto struct {
	Id          int         `json:"category_id"`
	Name        string      `json:"name"`
	Description string      `json:"description"`
	Products    ProductsDto `json:"products"`
}

type CategoriesDto []CategoryDto
