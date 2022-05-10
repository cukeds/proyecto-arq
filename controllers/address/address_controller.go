package addressController

import (
	"mvc-go/dto"
	"net/http"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

func GetAddressById(c *gin.Context) {
	log.Debug("Address id: " + c.Param("id"))

	// Get Back User
	var addressDto dto.AddressDto
	c.JSON(http.StatusOK, addressDto)
}

func AddressInsert(c *gin.Context) {

  var addressDto dto.AddressDto
	err := c.BindJSON(&addressDto)

  log.Debug(addressDto)

  if err != nil {
    log.Error(err.Error())
    c.JSON(http.StatusBadRequest, err.Error())
    return
  }
  c.JSON(http.StatusCreated, addressDto)
}
