package dto

type CartDto struct {
	Id       int         `json:"cart_id"`
	User     UserDto     `json:"user"`
	Active   bool        `json:"active"`
	Products ProductsDto `json:"products"`
}

type CartsDto []CartDto
