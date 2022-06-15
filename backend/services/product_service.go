package services

import (
	productClient "mvc-go/clients/product"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"

	log "github.com/sirupsen/logrus"
)

type productService struct{}

type productServiceInterface interface {
	GetProductById(id int) (dto.ProductDto, e.ApiError)
	GetProducts() (dto.ProductsDto, e.ApiError)
	GetProductsByCategoryId(id int) (dto.ProductsDto, e.ApiError)
	GetProductsBySearch(query string) (dto.ProductsDto, e.ApiError)
	GetNProducts(n int) (dto.ProductsDto, e.ApiError)
}

var (
	ProductService productServiceInterface
)

func init() {
	ProductService = &productService{}
}

func (s *productService) GetProductById(id int) (dto.ProductDto, e.ApiError) {

	var product model.Product = productClient.GetProductById(id)
	var productDto dto.ProductDto

	if product.ProductId < 0 {
		return productDto, e.NewBadRequestApiError("product not found")
	}

	productDto.ProductId = product.ProductId
	productDto.Category, _ = CategoryService.GetCategoryById(product.CategoryId)
	productDto.Name = product.Name
	productDto.Description = product.Description
	productDto.Price = product.Price
	productDto.CurrencyId = product.CurrencyId
	productDto.Stock = product.Stock
	productDto.Picture = product.Picture

	return productDto, nil
}

func (s *productService) GetProducts() (dto.ProductsDto, e.ApiError) {

	var products model.Products = productClient.GetProducts()
	var productsDto dto.ProductsDto

	for _, product := range products {
		var productDto dto.ProductDto
		productDto.ProductId = product.ProductId
		productDto.Category, _ = CategoryService.GetCategoryById(product.CategoryId)
		productDto.Name = product.Name
		productDto.Description = product.Description
		productDto.Price = product.Price
		productDto.CurrencyId = product.CurrencyId
		productDto.Stock = product.Stock
		productDto.Picture = product.Picture

		productsDto = append(productsDto, productDto)
	}

	log.Debug(productsDto)
	return productsDto, nil
}

func (s *productService) GetNProducts(n int) (dto.ProductsDto, e.ApiError) {

	var products model.Products = productClient.GetNProducts(n)
	var productsDto dto.ProductsDto

	for _, product := range products {
		var productDto dto.ProductDto
		productDto.ProductId = product.ProductId
		productDto.Category, _ = CategoryService.GetCategoryById(product.CategoryId)
		productDto.Name = product.Name
		productDto.Description = product.Description
		productDto.Price = product.Price
		productDto.CurrencyId = product.CurrencyId
		productDto.Stock = product.Stock
		productDto.Picture = product.Picture

		productsDto = append(productsDto, productDto)
	}

	log.Debug(productsDto)
	return productsDto, nil
}

func (s *productService) GetProductsByCategoryId(id int) (dto.ProductsDto, e.ApiError) {

	var products model.Products = productClient.GetProductsByCategoryId(id)
	var productsDto dto.ProductsDto

	for _, product := range products {
		var productDto dto.ProductDto
		productDto.ProductId = product.ProductId
		productDto.Category, _ = CategoryService.GetCategoryById(id)
		productDto.Name = product.Name
		productDto.Description = product.Description
		productDto.Price = product.Price
		productDto.CurrencyId = product.CurrencyId
		productDto.Stock = product.Stock
		productDto.Picture = product.Picture

		productsDto = append(productsDto, productDto)
	}

	log.Debug(productsDto)
	return productsDto, nil
}

func (s *productService) GetProductsBySearch(query string) (dto.ProductsDto, e.ApiError) {
	var products model.Products = productClient.GetProductsBySearch(query)
	var productsDto dto.ProductsDto

	for _, product := range products {
		var productDto dto.ProductDto
		productDto.ProductId = product.ProductId
		productDto.Category, _ = CategoryService.GetCategoryById(product.CategoryId)
		productDto.Name = product.Name
		productDto.Description = product.Description
		productDto.Price = product.Price
		productDto.CurrencyId = product.CurrencyId
		productDto.Stock = product.Stock
		productDto.Picture = product.Picture

		productsDto = append(productsDto, productDto)
	}

	log.Debug(productsDto)
	return productsDto, nil
}
