package product

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

func GetProductById(id int) model.Product {
	var product model.Product
	Db.Where("product_id = ?", id).First(&product)
	log.Debug("Product: ", product)

	return product
}

func GetProducts() model.Products {
	var products model.Products
	Db.Find(&products)

	log.Debug("Products: ", products)

	return products
}

func GetNProducts(n int) model.Products {
	var products model.Products
	Db.Order("product_id asc").Limit(n).Find(&products)

	log.Debug("Products: ", products)

	return products
}

func RemoveStock(id int, amount int) model.Product {
	var product model.Product
	Db.Where("product_id = ?", id).First(&product)
	Db.Model(&product).Where("product_id = ?", id).Update("stock", product.Stock-amount)
	log.Debug("Product: ", product)
	return product
}

func GetProductsByCategoryId(id int) model.Products {
	var products model.Products
	Db.Where("category_id = ?", id).Find(&products)
	log.Debug("Products", products)

	return products
}

func GetProductsBySearch(query string) model.Products {
	var products model.Products
	Db.Where("name LIKE ?", "%"+query+"%").Find(&products)
	log.Debug("Products", products)

	return products
}
