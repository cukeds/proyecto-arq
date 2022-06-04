package dto

type OrderDto struct {
	OrderId      int             `json:"order_id"`
	Date         string          `json:"date"`
	Total        float32         `json:"total"`
	CurrencyId   string          `json:"currency_id"`
	Client       UserDto         `json:"client"`
	OrderDetails OrderDetailsDto `json:"details"`
}

type OrdersDto []OrderDto
