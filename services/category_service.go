package services

import (
	categoryClient "mvc-go/clients/category"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"

	log "github.com/sirupsen/logrus"
)

type categoryService struct{}

type categoryServiceInterface interface {
	GetCategoryById(id int) (dto.CategoryDto, e.ApiError)
	GetCategoriesInfo() (dto.CategoriesInfoDto, e.ApiError)
}

var (
	CategoryService categoryServiceInterface
)

func init() {
	CategoryService = &categoryService{}
}

func (s *categoryService) GetCategoryById(id int) (dto.CategoryDto, e.ApiError) {

	var category model.Category = categoryClient.GetCategoryById(id)
	var categoryDto dto.CategoryDto

	if category.CategoryId == 0 {
		return categoryDto, e.NewBadRequestApiError("category not found")
	}
	categoryDto.Description = category.Description
	categoryDto.Name = category.Name
	categoryDto.CategoryId = category.CategoryId
	return categoryDto, nil
}

func (s *categoryService) GetCategoriesInfo() (dto.CategoriesInfoDto, e.ApiError) {

	var categories model.Categories = categoryClient.GetCategoriesInfo()
	var categoriesInfoDto dto.CategoriesInfoDto

	for _, category := range categories {
		var categoryInfoDto dto.CategoryInfoDto
		categoryInfoDto.Description = category.Description
		categoryInfoDto.Name = category.Name
		categoryInfoDto.CategoryId = category.CategoryId

		categoriesInfoDto = append(categoriesInfoDto, categoryInfoDto)
	}

	log.Debug(categoriesInfoDto)
	return categoriesInfoDto, nil
}
