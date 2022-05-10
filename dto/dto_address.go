package dto

type AddressDto struct {
	Id       int    `json:"address_id"`
	Street1  string `json:"street1"`
	Street2  string `json:"street2"`
	Number   int    `json:"number"`
	District string `json:"district"`
	City     string `json:"city"`
	Country  string `json:"country"`
}

type AddressesDto []AddressDto
