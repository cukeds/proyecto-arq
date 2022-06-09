package services

import (
	orderClient "mvc-go/clients/order"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"
	"time"

	log "github.com/sirupsen/logrus"
)

type orderService struct{}

type orderServiceInterface interface {
	InsertOrder(orderDto dto.OrderInsertDto) (dto.OrderResponseDto, e.ApiError)
}

var (
	OrderService orderServiceInterface
)

func init() {
	OrderService = &orderService{}
}

//
// func (s *orderService) GetOrderById(id int) (dto.OrderDto, e.ApiError) {
//
// 	var order model.Order = orderClient.GetOrderById(id)
// 	var orderDto dto.OrderDto
//
// 	if order.OrderId < 0 {
// 		return orderDto, e.NewBadRequestApiError("order not found")
// 	}
// 	orderDto.FirstName = order.FirstName
// 	orderDto.LastName = order.LastName
// 	orderDto.Ordername = order.Ordername
// 	orderDto.OrderId = order.OrderId
// 	return orderDto, nil
// }

func (s *orderService) InsertOrder(orderInsertDto dto.OrderInsertDto) (dto.OrderResponseDto, e.ApiError) {

	var order model.Order
	var total float32
	total = 0
	order.UserId = orderInsertDto.UserId
	order.Date = time.Now().Format("2006.01.02 15:04:05")
	for i := 0; i < len(orderInsertDto.OrderDetails); i++ {
		total += orderInsertDto.OrderDetails[i].Price
	}
	order.Total = total
	order.CurrencyId = "ARS"

	order = orderClient.InsertOrder(order)

	var orderResponseDto dto.OrderResponseDto
	orderResponseDto.OrderId = order.OrderId

	log.Debug(order)
	return orderResponseDto, nil
}
