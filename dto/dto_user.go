package dto

type UserDto struct {
	Id        int          `json:"user_id"`
	Username  string       `json:"username"`
	Password  string       `json:"password"`
	FirstName string       `json:"first_name"`
	LastName  string       `json:"last_name"`
	Email     string       `json:email`
	Addresses AddressesDto `json:"addresses"`
}

type UsersDto []UserDto
