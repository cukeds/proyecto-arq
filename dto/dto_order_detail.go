package dto

type OrderDetailDto struct {
	Id         int        `json:"order_detail_id"`
	Product    ProductDto `json:"product"`
	Quantity   int        `json:"quantity"`
	Price      float32    `json:"price"`
	CurrencyId string     `json:"currency_id"`
	Name       string     `json:"name"`
}

type OrderDetailsDto []OrderDetailDto
