package category

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

type categoryClient struct{}

type CategoryClientInterface interface {
	GetCategoryById(id int) model.Category
	GetCategories() model.Categories
}

var (
	CategoryClient CategoryClientInterface
)

func init() {
	CategoryClient = &categoryClient{}
}

func (s *categoryClient) GetCategoryById(id int) model.Category {
	var category model.Category
	Db.Where("category_id = ?", id).First(&category)
	log.Debug("Category: ", category)

	return category
}

func (s *categoryClient) GetCategories() model.Categories {
	var categories model.Categories
	Db.Find(&categories)

	log.Debug("Categories: ", categories)

	return categories
}
