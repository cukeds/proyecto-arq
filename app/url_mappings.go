package app

import (
	orderController "mvc-go/controllers/order"
	orderDetailController "mvc-go/controllers/order_detail"
	productController "mvc-go/controllers/product"
	userController "mvc-go/controllers/user"
	categoryController "mvc-go/controllers/category"
	addressController "mvc-go/controllers/address"
	cartController "mvc-go/controllers/cart"

	log "github.com/sirupsen/logrus"
)

func mapUrls() {
	// Products Mapping
	router.GET("/product/:product_id", productController.GetProductById)
	router.GET("/product", productController.GetProducts)

	// Users Mapping
	router.GET("/user/:id", userController.GetUserById)
	router.GET("/user", userController.GetUsers)
	router.POST("/user", userController.UserInsert)

	// Orders Mapping
	router.GET("/order/:id", orderController.GetOrderById)
	router.POST("/order", orderController.OrderInsert)

	// OrderDetails Mapping
	router.GET("/orderDetail/:id", orderDetailController.GetOrderDetailById)
	router.POST("/orderDetail", orderDetailController.OrderDetailInsert)

	// Address Mapping
	router.GET("/address/:id", addressController.GetAddressById)
	router.POST("/address", addressController.AddressInsert)

	// Category Mapping
	router.GET("/category/:id", categoryController.GetCategoryById)
	router.GET("/categories", categoryController.GetCategories)

	// Cart Mapping
	router.GET("/cart/:id", cartController.GetCartById)



	log.Info("Finishing mappings configurations")
}
