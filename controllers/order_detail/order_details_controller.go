package orderDetailController

import (
	"mvc-go/dto"
	"net/http"
	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

func GetOrderDetailById(c *gin.Context) {
	log.Debug("Order Detail id: " + c.Param("id"))

	var orderDetailDto dto.OrderDetailDto

	// Dummy product
	var Product dto.ProductDto
	Product.Name = "Jose"
	Product.Id = "123ABC"
	Product.Picture = "imagen.net"
	Product.Price = 300
	Product.CurrencyId = "ARS"

	orderDetailDto.Product = Product
	orderDetailDto.Price = orderDetailDto.Product.Price
	orderDetailDto.CurrencyId = orderDetailDto.Product.CurrencyId
	orderDetailDto.Quantity = 10

	c.JSON(http.StatusOK, orderDetailDto)
}

func OrderDetailInsert(c *gin.Context) {
	var orderDetailDto dto.OrderDetailDto
	err := c.BindJSON(&orderDetailDto)

	log.Debug(orderDetailDto)

	if err != nil {
		log.Error(err.Error())
		c.JSON(http.StatusBadRequest, err.Error())
		return
	}
	c.JSON(http.StatusCreated, orderDetailDto)
}
