package orderController

import (
	"mvc-go/dto"
	"net/http"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

func GetOrderById(c *gin.Context) {
	log.Debug("Order id: " + c.Param("id"))

	var orderDto dto.OrderDto
	var Client dto.UserDto
	Client.FirstName = "Jose"
	Client.LastName = "Marcos"

	orderDto.Date = "29/03/22"
	orderDto.Total = 300
	orderDto.CurrencyId = "ARS"
	orderDto.Client = Client

	// Dummy array of details
	var Details dto.OrderDetailsDto

	// Dummy Order Detail
	var Detail1 dto.OrderDetailDto
	Detail1.Quantity = 5
	Detail1.Price = 30
	Detail1.CurrencyId = "ARS"

	// Dummy Product
	var Product dto.ProductDto
	Product.Name = "Jose"
	Product.Id = "123ABC"
	Product.Picture = "imagen.net"
	Product.Price = 300
	Product.CurrencyId = "ARS"

	Detail1.Product = Product

	Details = append(Details, Detail1)
	Details = append(Details, Detail1)
	orderDto.OrderDetails = Details

	c.JSON(http.StatusOK, orderDto)
}

func OrderInsert(c *gin.Context) {
	var orderDto dto.OrderDto
	err := c.BindJSON(&orderDto)

	log.Debug(orderDto)

	if err != nil {
		log.Error(err.Error())
		c.JSON(http.StatusBadRequest, err.Error())
		return
	}
	c.JSON(http.StatusCreated, orderDto)
}
