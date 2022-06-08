package productController

import (
	"mvc-go/dto"
	service "mvc-go/services"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func GetProductById(c *gin.Context) {
	c.JSON(http.StatusOK, "Buscando: "+c.Param("product_id"))

	var productDto dto.ProductDto
	productDto.Name = "Jose"
	productDto.ProductId = 1
	productDto.Picture = "imagen.net"
	productDto.Price = 300
	productDto.CurrencyId = "ARS"

	c.JSON(http.StatusOK, productDto)
}

func GetProducts(c *gin.Context) {

	var productsDto dto.ProductsDto
	productsDto, err := service.ProductService.GetProducts()

	if err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
		return
	}

	c.JSON(http.StatusOK, productsDto)
}

func GetProductsByCategoryId(c *gin.Context) {

	var productsDto dto.ProductsDto
	id, _ := strconv.Atoi(c.Param("category_id"))
	productsDto, err := service.ProductService.GetProductsByCategoryId(id)

	if err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
		return
	}

	c.JSON(http.StatusOK, productsDto)
}
