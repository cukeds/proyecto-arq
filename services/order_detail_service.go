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
}

var (
	OrderDetailService orderDetailServiceInterface
)

func init() {
	OrderDetailService = &orderDetailService{}
}

//
// func (s *orderDetailService) GetOrderDetailById(id int) (dto.OrderDetailDto, e.ApiError) {
//
// 	var orderDetail model.OrderDetail = orderDetailClient.GetOrderDetailById(id)
// 	var orderDetailDto dto.OrderDetailDto
//
// 	if orderDetail.OrderDetailId < 0 {
// 		return orderDetailDto, e.NewBadRequestApiError("orderDetail not found")
// 	}
// 	orderDetailDto.FirstName = orderDetail.FirstName
// 	orderDetailDto.LastName = orderDetail.LastName
// 	orderDetailDto.OrderDetailname = orderDetail.OrderDetailname
// 	orderDetailDto.OrderDetailId = orderDetail.OrderDetailId
// 	return orderDetailDto, nil
// }

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
