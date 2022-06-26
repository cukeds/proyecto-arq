package orderDetail

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

type orderDetailClient struct{}

type OrderDetailClientInterface interface {
	GetOrderDetailById(id int) model.OrderDetail
	GetOrderDetailsByOrderId(id int) model.OrderDetails
	InsertOrderDetail(orderDetail model.OrderDetail) model.OrderDetail
}

var (
	OrderDetailClient OrderDetailClientInterface
)

func init() {
	OrderDetailClient = &orderDetailClient{}
}

func (s *orderDetailClient) GetOrderDetailById(id int) model.OrderDetail {
	var orderDetail model.OrderDetail
	Db.Where("order_detail_id = ?", id).First(&orderDetail)
	log.Debug("OrderDetail: ", orderDetail)

	return orderDetail
}

func (s *orderDetailClient) GetOrderDetailsByOrderId(id int) model.OrderDetails {
	var orderDetails model.OrderDetails
	Db.Where("order_id = ?", id).Find(&orderDetails)

	log.Debug("OrderDetails: ", orderDetails)

	return orderDetails
}

func (s *orderDetailClient) InsertOrderDetail(orderDetail model.OrderDetail) model.OrderDetail {
	result := Db.Create(&orderDetail)

	if result.Error != nil {
		//TODO Manage Errors
		log.Error("")
	}
	log.Debug("OrderDetail Created: ", orderDetail.OrderDetailId)
	return orderDetail
}
