package services

import (
	userClient "mvc-go/clients/user"
	"mvc-go/dto"
	"mvc-go/model"
	e "mvc-go/utils/errors"
)

type userService struct{}

type userServiceInterface interface {
	GetUserById(id int) (dto.UserDto, e.ApiError)
	GetUsers() (dto.UsersDto, e.ApiError)
	InsertUser(userDto dto.UserDto) (dto.UserDto, e.ApiError)
}

var (
	UserService userServiceInterface
)

func init() {
	UserService = &userService{}
}

func (s *userService) GetUserById(id int) (dto.UserDto, e.ApiError) {

	var user model.User = userClient.GetUserById(id)
	var userDto dto.UserDto

	if user.UserId == 0 {
		return userDto, e.NewBadRequestApiError("user not found")
	}
	userDto.FirstName = user.FirstName
	userDto.LastName = user.LastName
	userDto.Username = user.Username
	userDto.UserId = user.UserId
	return userDto, nil
}

func (s *userService) GetUsers() (dto.UsersDto, e.ApiError) {

	var users model.Users = userClient.GetUsers()
	var usersDto dto.UsersDto

	for _, user := range users {
		var userDto dto.UserDto
		userDto.FirstName = user.FirstName
		userDto.LastName = user.LastName
		userDto.Username = user.Username
		userDto.UserId = user.UserId

		usersDto = append(usersDto, userDto)
	}

	return usersDto, nil
}

func (s *userService) InsertUser(userDto dto.UserDto) (dto.UserDto, e.ApiError) {

	var user model.User

	user.FirstName = userDto.FirstName
	user.LastName = userDto.LastName
	user.Username = userDto.Username
	user.Password = userDto.Password
	user.Email = userDto.Email

	user = userClient.InsertUser(user)

	userDto.UserId = user.UserId

	return userDto, nil
}
