package model

type Address struct {
	AddressId int    `gorm:"primaryKey"`
	UserId    int    `gorm:"type:int"`
	Street1   string `gorm:"type:varchar(100)"`
	Street2   string `gorm:"type:varchar(100)"`
	Number    int    `gorm:"type:int"`
	District  string `gorm:"type:varchar(100)"`
	City      string `gorm:"type:varchar(100)"`
	Country   string `gorm:"type:varchar(100)"`
}

type Addresses []Address
