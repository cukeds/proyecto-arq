package address

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

func GetAddressById(id int) model.Address {
	var address model.Address
	Db.Where("address_id = ?", id).First(&address)
	log.Debug("Address: ", address)

	return address
}

// func GetAddresses() model.Addresses {
// 	var addresses model.Addresses
// 	Db.Find(&addresses)
//
// 	log.Debug("Addresses: ", addresses)
//
// 	return addresses
// }

func InsertAddress(address model.Address) model.Address {
	result := Db.Create(&address)

	if result.Error != nil {
		//TODO Manage Errors
		log.Error("")
	}
	log.Debug("Address Created: ", address.AddressId)
	return address
}
