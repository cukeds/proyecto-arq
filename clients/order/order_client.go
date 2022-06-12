package order

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

func GetOrderById(id int) model.Order {
	var order model.Order
	Db.Where("order_id = ?", id).First(&order)
	log.Debug("Order: ", order)

	return order
}

func GetOrdersByUserId(id int) model.Orders {
	var orders model.Orders
	Db.Where("user_id = ?", id).Find(&orders)

	log.Debug("Orders: ", orders)

	return orders
}

func InsertOrder(order model.Order) model.Order {
	result := Db.Create(&order)

	if result.Error != nil {
		//TODO Manage Errors
		log.Debug(result.Error, order)
	}
	log.Debug("Order Created: ", order.OrderId)
	return order
}
