package app

import (
	addressController "mvc-go/controllers/address"
	cartController "mvc-go/controllers/cart"
	categoryController "mvc-go/controllers/category"
	orderController "mvc-go/controllers/order"
	orderDetailController "mvc-go/controllers/order_detail"
	productController "mvc-go/controllers/product"
	userController "mvc-go/controllers/user"

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
	// maybe: router.GET("/order, orderController.GetOrders")
	router.POST("/order", orderController.OrderInsert)

	// OrderDetails Mapping
	router.GET("/orderDetail/:id", orderDetailController.GetOrderDetailById)
	router.POST("/orderDetail", orderDetailController.OrderDetailInsert)

	// Address Mapping
	router.GET("/address/:id", addressController.GetAddressById)
	// maybe: router.GET("/address, addressController.GetAddresses")
	router.POST("/address", addressController.AddressInsert)

	// Category Mapping
	router.GET("/category/:id", categoryController.GetCategoryById)
	router.GET("/categories", categoryController.GetCategoriesInfo)

	// Cart Mapping
	router.GET("/cart/:id", cartController.GetCartById)
	// maybe: router.GET("/cart, cartController.GetCarts")
	router.POST("/cart", cartController.InsertCart)

	// Login Mapping
	router.POST("/login", userController.Login)

	log.Info("Finishing mappings configurations")
}
