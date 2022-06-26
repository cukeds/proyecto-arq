package product

import (
	"mvc-go/model"

	"github.com/jinzhu/gorm"
	log "github.com/sirupsen/logrus"
)

var Db *gorm.DB

type productClient struct{}

type ProductClientInterface interface {
	GetProductById(id int) model.Product
	GetProducts() model.Products
	GetNProducts(n int) model.Products
	RemoveStock(id int, amount int) model.Product
	GetProductsByCategoryId(id int) model.Products
	GetProductsBySearch(query string) model.Products
}

var (
	ProductClient ProductClientInterface
)

func init() {
	ProductClient = &productClient{}
}

func (s *productClient) GetProductById(id int) model.Product {
	var product model.Product
	Db.Where("product_id = ?", id).First(&product)
	log.Debug("Product: ", product)

	return product
}

func (s *productClient) GetProducts() model.Products {
	var products model.Products
	Db.Find(&products)

	log.Debug("Products: ", products)

	return products
}

func (s *productClient) GetNProducts(n int) model.Products {
	var products model.Products
	Db.Order("product_id asc").Limit(n).Find(&products)

	log.Debug("Products: ", products)

	return products
}

func (s *productClient) RemoveStock(id int, amount int) model.Product {
	var product model.Product
	Db.Where("product_id = ?", id).First(&product)
	Db.Model(&product).Where("product_id = ?", id).Update("stock", product.Stock-amount)
	log.Debug("Product: ", product)
	return product
}

func (s *productClient) GetProductsByCategoryId(id int) model.Products {
	var products model.Products
	Db.Where("category_id = ?", id).Find(&products)
	log.Debug("Products", products)

	return products
}

func (s *productClient) GetProductsBySearch(query string) model.Products {
	var products model.Products
	Db.Where("name LIKE ?", "%"+query+"%").Find(&products)
	log.Debug("Products", products)

	return products
}
