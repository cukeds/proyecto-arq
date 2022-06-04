package model

type Cart struct {
	CartId   int  `gorm:"primaryKey	"`
	UserId   int  `gorm:"type:int"`
	Active   bool `gorm:"type:bool;"`
	Products Products
}

type Carts []Cart
