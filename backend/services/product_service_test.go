package services

import (
	"github.com/stretchr/testify/assert"
	mock "github.com/stretchr/testify/mock"
	"mvc-go/dto"
	"mvc-go/model"
	"testing"
)

type ProductClientInterface struct {
	mock.Mock
}

func (m *ProductClientInterface) GetProductById(id int) model.Product {
	ret := m.Called(id)
	return ret.Get(0).(model.Product)
}
func (m *ProductClientInterface) GetProducts() model.Products {
	ret := m.Called()
	return ret.Get(0).(model.Products)
}
func (m *ProductClientInterface) GetNProducts(n int) model.Products {
	ret := m.Called(n)
	return ret.Get(0).(model.Products)
}
func (m *ProductClientInterface) RemoveStock(id int, amount int) model.Product {
	ret := m.Called(id, amount)
	return ret.Get(0).(model.Product)
}
func (m *ProductClientInterface) GetProductsByCategoryId(id int) model.Products {
	ret := m.Called(id)
	return ret.Get(0).(model.Products)
}
func (m *ProductClientInterface) GetProductsBySearch(query string) model.Products {
	ret := m.Called(query)
	return ret.Get(0).(model.Products)
}

func TestGetProductById(t *testing.T) {
	mockProductClient := new(ProductClientInterface)
	mockCategoryClient := new(CategoryClientInterface)

	var product model.Product
	product.ProductId = 1
	product.CategoryId = 1
	product.Name = "Test_Product"
	product.Description = "Test_Desc"
	product.Price = 500
	product.CurrencyId = "ARS"
	product.Stock = 5
	product.Picture = "test.png"

	var categoryDto dto.CategoryDto
	categoryDto.CategoryId = 1
	categoryDto.Name = "Test_Category"
	categoryDto.Description = "Test_Description"

	var category model.Category
	category.CategoryId = 1
	category.Name = "Test_Category"
	category.Description = "Test_Description"

	var productDto dto.ProductDto
	productDto.ProductId = 1
	productDto.Category = categoryDto
	productDto.Name = "Test_Product"
	productDto.Description = "Test_Desc"
	productDto.Price = 500
	productDto.CurrencyId = "ARS"
	productDto.Stock = 5
	productDto.Picture = "test.png"

	mockProductClient.On("GetProductById", 1).Return(product)
	mockCategoryClient.On("GetCategoryById", 1).Return(category)
	service := initProductService(mockProductClient, mockCategoryClient)
	res, err := service.GetProductById(1)
	assert.Nil(t, err, "Error should be nil")
	assert.Equal(t, res, productDto)
}

// func TestGetProducts(t *testing.T) {
// 	mockProductClient := new(ProductClientInterface)
// 	mockCategoryClient := new(CategoryClientInterface)
// 	service := initProductService(mockProductClient, CategoryClientInterface)
// 	res, err := service.GetProducts()
// }
//
// func TestGetProductsByCategoryId(t *testing.T) {
// 	mockProductClient := new(ProductClientInterface)
// 	mockCategoryClient := new(CategoryClientInterface)
// 	service := initProductService(mockProductClient, CategoryClientInterface)
// 	res, err := service.GetProductsByCategoryId(1)
// }
//
// func TestGetProductsBySearch(t *testing.T) {
// 	mockProductClient := new(ProductClientInterface)
// 	mockCategoryClient := new(CategoryClientInterface)
// 	service := initProductService(mockProductClient, CategoryClientInterface)
// 	res, err := service.GetProductsBySearch("Wood")
// }
//
// func TestGetNProducts(t *testing.T) {
// 	mockProductClient := new(ProductClientInterface)
// 	mockCategoryClient := new(CategoryClientInterface)
// 	service := initProductService(mockProductClient, CategoryClientInterface)
// 	res, err := service.GetNProducts(5)
// }
