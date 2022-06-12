package services

import (
	orderDetailClient "mvc-go/clients/order_detail"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"

	log "github.com/sirupsen/logrus"
)

type orderDetailService struct{}

type orderDetailServiceInterface interface {
	InsertDetail(orderDetailDto dto.OrderDetailInsertDto, orderId int) (dto.OrderDetailResponseDto, e.ApiError)
	GetOrderDetailById(id int) (dto.OrderDetailDto, e.ApiError)
	GetOrderDetailsByOrderId(id int) (dto.OrderDetailsDto, e.ApiError)
}

var (
	OrderDetailService orderDetailServiceInterface
)

func init() {
	OrderDetailService = &orderDetailService{}
}

func (s *orderDetailService) GetOrderDetailById(id int) (dto.OrderDetailDto, e.ApiError) {

	var orderDetail model.OrderDetail = orderDetailClient.GetOrderDetailById(id)
	var orderDetailDto dto.OrderDetailDto

	orderDetailDto.OrderDetailId = orderDetail.OrderDetailId
	orderDetailDto.ProductId = orderDetail.ProductId
	orderDetailDto.Quantity = orderDetail.Quantity
	orderDetailDto.Price = orderDetail.Price
	orderDetailDto.CurrencyId = orderDetail.CurrencyId
	orderDetailDto.Name = orderDetail.Name

	return orderDetailDto, nil
}

func (s *orderDetailService) GetOrderDetailsByOrderId(id int) (dto.OrderDetailsDto, e.ApiError) {
	var orderDetails model.OrderDetails = orderDetailClient.GetOrderDetailsByOrderId(id)
	var orderDetailsDto dto.OrderDetailsDto

	for _, orderDetail := range orderDetails {
		var orderDetailDto dto.OrderDetailDto
		orderDetailDto.OrderDetailId = orderDetail.OrderDetailId
		orderDetailDto.ProductId = orderDetail.ProductId
		orderDetailDto.Quantity = orderDetail.Quantity
		orderDetailDto.Price = orderDetail.Price
		orderDetailDto.CurrencyId = orderDetail.CurrencyId
		orderDetailDto.Name = orderDetail.Name

		orderDetailsDto = append(orderDetailsDto, orderDetailDto)
	}

	return orderDetailsDto, nil
}

func (s *orderDetailService) InsertDetail(orderDetailDto dto.OrderDetailInsertDto, orderId int) (dto.OrderDetailResponseDto, e.ApiError) {

	var orderDetail model.OrderDetail
	orderDetail.OrderId = orderId
	orderDetail.ProductId = orderDetailDto.ProductId
	orderDetail.Quantity = orderDetailDto.Quantity
	orderDetail.CurrencyId = "ARS"
	orderDetail.Name = orderDetailDto.Name
	orderDetail.Price = orderDetailDto.Price

	orderDetail = orderDetailClient.InsertOrderDetail(orderDetail)

	var orderDetailResponseDto dto.OrderDetailResponseDto
	orderDetailResponseDto.OrderDetailId = orderDetail.OrderDetailId

	log.Debug(orderDetail)

	return orderDetailResponseDto, nil
}
