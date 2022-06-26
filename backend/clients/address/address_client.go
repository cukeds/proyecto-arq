package address

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

type addressClient struct{}

type AddressClientInterface interface {
	GetAddressesByUserId(id int) model.Addresses
	GetAddressById(id int) model.Address
	InsertAddress(address model.Address) model.Address
}

var (
	AddressClient AddressClientInterface
)

func init() {
	AddressClient = &addressClient{}
}

func (s *addressClient) GetAddressById(id int) model.Address {
	var address model.Address
	Db.Where("id = ?", id).First(&address)
	log.Debug("Address: ", address)

	return address
}

func (s *addressClient) GetAddressesByUserId(id int) model.Addresses {
	var addresses model.Addresses
	Db.Where("user_id = ?", id).Find(&addresses)

	log.Debug("Addresses: ", addresses)

	return addresses
}

func (s *addressClient) InsertAddress(address model.Address) model.Address {
	result := Db.Create(&address)

	if result.Error != nil {
		log.Debug("Address already exists: ", address)
		return address
	}
	log.Debug("Address Created: ", address.ID)
	return address
}
