package order

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

type orderClient struct{}

type OrderClientInterface interface {
	GetOrderById(id int) model.Order
	GetOrdersByUserId(id int) model.Orders
	InsertOrder(order model.Order) model.Order
}

var (
	OrderClient OrderClientInterface
)

func init() {
	OrderClient = &orderClient{}
}

func (s *orderClient) GetOrderById(id int) model.Order {
	var order model.Order
	Db.Where("id = ?", id).First(&order)
	log.Debug("Order: ", order)

	return order
}

func (s *orderClient) GetOrdersByUserId(id int) model.Orders {
	var orders model.Orders
	Db.Where("user_id = ?", id).Find(&orders)

	log.Debug("Orders: ", orders)

	return orders
}

func (s *orderClient) InsertOrder(order model.Order) model.Order {

	result := Db.Create(&order)

	if result.Error != nil {

		log.Debug(result.Error, order)
		order.ID = 0
		return order
	}
	log.Debug("Order Created: ", order.ID)
	return order
}
