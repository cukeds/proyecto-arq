package services

import (
	orderClient "mvc-go/clients/order"
	productClient "mvc-go/clients/product"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"
	"time"

	log "github.com/sirupsen/logrus"
)

type orderService struct{}

type orderServiceInterface interface {
	InsertOrder(orderDto dto.OrderInsertDto) (dto.OrderResponseDto, e.ApiError)
	GetOrdersByUserId(id int) (dto.OrdersDto, e.ApiError)
}

var (
	OrderService orderServiceInterface
)

func init() {
	OrderService = &orderService{}
}

func (s *orderService) GetOrdersByUserId(id int) (dto.OrdersDto, e.ApiError) {

	var orders model.Orders = orderClient.GetOrdersByUserId(id)
	var ordersDto dto.OrdersDto

	for _, order := range orders {
		var orderDto dto.OrderDto
		orderDto.OrderId = order.ID
		orderDto.Address, _ = AddressService.GetAddressById(order.AddressId)
		orderDto.Date = order.Date
		orderDto.Total = order.Total
		orderDto.CurrencyId = order.CurrencyId
		orderDto.OrderDetails, _ = OrderDetailService.GetOrderDetailsByOrderId(order.ID)
		ordersDto = append(ordersDto, orderDto)
	}
	return ordersDto, nil
}

func (s *orderService) InsertOrder(orderInsertDto dto.OrderInsertDto) (dto.OrderResponseDto, e.ApiError) {

	var order model.Order
	var addressDto dto.AddressDto
	var total float32
	var orderResponseDto dto.OrderResponseDto

	_, err := AddressService.GetAddressById(orderInsertDto.Address.AddressId)
	if err != nil {
		addressDto, _ = AddressService.InsertAddress(orderInsertDto.Address)
	} else {
		addressDto = orderInsertDto.Address
	}

	order.AddressId = addressDto.AddressId
	total = 0
	order.UserId = orderInsertDto.UserId
	order.Date = time.Now().Format("2006.01.02 15:04:05")
	for i := 0; i < len(orderInsertDto.OrderDetails); i++ {
		var product model.Product
		detail := orderInsertDto.OrderDetails[i]
		product = productClient.GetProductById(detail.ProductId)
		if product.Stock < detail.Quantity {
			orderResponseDto.OrderId = 0
			return orderResponseDto, e.NewConflictApiError("Not enough stock on product: " + product.Name)
		}

		total += (detail.Price * float32(detail.Quantity))

	}

	for i := 0; i < len(orderInsertDto.OrderDetails); i++ {
		detail := orderInsertDto.OrderDetails[i]
		productClient.RemoveStock(detail.ProductId, detail.Quantity)
	}

	order.Total = total
	order.CurrencyId = "ARS"

	order = orderClient.InsertOrder(order)

	orderResponseDto.OrderId = order.ID

	log.Debug(order)
	return orderResponseDto, nil
}
