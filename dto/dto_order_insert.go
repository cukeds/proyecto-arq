package dto

type OrderInsertDto struct {
	CurrencyId   string                `json:"currency_id"`
	UserId       int                   `json:"user_id"`
	OrderDetails OrderDetailsInsertDto `json:"details"`
}
