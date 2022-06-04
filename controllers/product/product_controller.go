package productController

import (
	"mvc-go/dto"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetProductById(c *gin.Context) {
	c.JSON(http.StatusOK, "Buscando: " + c.Param("product_id"))

	var productDto dto.ProductDto
	productDto.Name = "Jose"
	productDto.ProductId = 1
	productDto.Picture = "imagen.net"
	productDto.Price = 300
	productDto.CurrencyId = "ARS"

	c.JSON(http.StatusOK, productDto)
}

func GetProducts(c *gin.Context) {
	c.JSON(http.StatusOK, "")
}
