package model

type Order struct {
	OrderId      int     `gorm:"primaryKey"`
	UserId       int     `gorm:"type:int"`
	Date         string  `gorm:"type:date;not null;"`
	Total        float32 `gorm:"type:float;not null;"`
	CurrencyId   string  `gorm:"type:varchar(10);not null;"`
	Client       User    `gorm:"type:varchar(100);not null;unique;"`
	OrderDetails OrderDetails
}

type Orders []Order
