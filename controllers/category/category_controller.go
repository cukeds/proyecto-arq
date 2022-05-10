package categoryController

import (
	"mvc-go/dto"
	"net/http"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

func GetCategoryById(c *gin.Context) {
	log.Debug("Category id: " + c.Param("id"))

	// Get Back User
	var categoryDto dto.CategoryDto
	c.JSON(http.StatusOK, categoryDto)
}

func GetCategories(c *gin.Context) {

	var categoriesDto dto.CategoriesDto
	c.JSON(http.StatusOK, categoriesDto)
}
