import React, { useState } from "react";
import "./css/Home.css";
import logo from "./images/logo.svg"
import cart from "./images/cart.svg"
import Cookies from "universal-cookie";

const Cookie = new Cookies();

async function getUserById(id){
    return await fetch('http://127.0.0.1:8090/user/' + id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
}).then(response => response.json())

}

async function getCategories(){
  return await fetch('http://127.0.0.1:8090/categories', {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

async function getProducts(){
  return await fetch('http://127.0.0.1:8090/products', {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

async function getProductsByCategoryId(id){
  return await fetch('http://127.0.0.1:8090/products/' + id, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

async function getCategoryById(id){
  return await fetch('http://127.0.0.1:8090/category/' + id, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

function goto(path){
  window.location = window.location.origin + path
}


function gotologin(){
  goto("/login")
}


function retry() {
  goto("/")
}

function productsByCategoryId(id, setter, categorySetter) {
  getProductsByCategoryId(id).then(response => {setter(response); Cookie.set("category", id); getCategoryById(id).then(category => categorySetter(category))})
}

function showCategories(categories, setter, categorySetter) {
  return categories.map((category, i) => <a onClick={() => productsByCategoryId(category.category_id, setter, categorySetter)} obj={category} key={category.category_id}>{category.name}</a>)
}

function addToCart(id, setCartItems){
  let cookie = Cookie.get("cart");

  if(cookie == undefined){
    Cookie.set("cart", id + ",1;", {path: "/"});
    setCartItems(1)
    return
  }
  let newCookie = ""
  let isNewItem = true
  let toCompare = cookie.split(";")
  let total = 0;
  toCompare.forEach((item) => {
    if(item != ""){
      let array = item.split(",")
      let item_id = array[0]
      let item_quantity = array[1]
      if(id == item_id){
        item_quantity = Number(item_quantity) + 1
        isNewItem = false
      }
      newCookie += item_id + "," + item_quantity + ";"
      total += Number(item_quantity);
    }
  });
  if(isNewItem){
    newCookie += id + ",1;"
    total += 1;
  }
  cookie = newCookie
  Cookie.set("cart", cookie, {path: "/"})
  Cookie.set("cartItems", total, {path: "/"})
  setCartItems(total)
  return
}

function showProducts(products, setCartItems){
  return products.map((product) =>

   <div obj={product} key={product.product_id} className="product">
    <div>
      <img width="128px" height="128px" src={"./images/" + product.picture_url}/>
    </div>
    <a className="name">{product.name}</a>
    <a className="addcart" onClick={() => addToCart(product.product_id, setCartItems)}>Add to Cart</a>
    <a className="price">{product.currency_id + "$" + product.base_price}</a>
    <div>
      <a className="description">{product.description}</a>
    </div>
    <div className="right">
      <a className="category">{product.category.name}</a>
      <a className="stock">Stock: {product.stock}</a>
    </div>
   </div>
 )
}

function logout(){
  Cookie.set("user_id", -1, {path: "/"})
  document.location.reload()
}

function search(){
  let input, filter, a, i;
  input = document.getElementById("search");
  filter = input.value.toUpperCase();
  a = document.getElementsByClassName("product");
  for (i = 0; i < a.length; i++) {
    let txtValue = a[i].children[1].textContent || a[i].children[1].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "inherit";
    } else {
      a[i].style.display = "none";
    }
  }
  if(input.value.toUpperCase().length <= 0){
    for(i = 0; i < a.length; i++){
      a[i].style.display = "inherit";
    }
  }

}

function deleteCategory(){
  Cookie.set("category", 0, {path: "/"})
  goto("/")
}

function gotocart(){
  goto("/cart")
}


function Home() {
  const [isLogged, setIsLogged] = useState(false)
  const [user, setUser] = useState({})
  const [categories, setCategories] = useState([])
  const [products, setProducts] = useState([])
  const [category, setCategory] = useState("")
  const [cartItems, setCartItems] = useState("")


  if (Cookie.get("user_id") > -1 && !isLogged){
    getUserById(Cookie.get("user_id")).then(response => setUser(response))
    setIsLogged(true)
  }

  if (!(Cookie.get("user_id") > -1) && isLogged){
    setIsLogged(false)
  }

  if(categories.length <= 0){
    getCategories().then(response => setCategories(response))
  }

  if (products.length <= 0){
    getProducts().then(response => {setProducts(response)})
  }

  if (!cartItems && Cookie.get("cartItems")){
    setCartItems(Cookie.get("cartItems"))
  }

  const login = (

    <span>
    <img src={cart} onClick={gotocart} id="cart" width="48px" height="48px"/>
    <span className="cartNumber">{cartItems > 0 ? cartItems : 0}</span>
    <a id="logout" onClick={logout}> <span> Welcome in {user.first_name} </span> </a>
    </span>
  )

  return (
    <div className="home">
      <div className="topnav">
        <img src={logo} width="80px" height="80px" />
        <input type="text" id="search" placeholder="Search..." onChange={search}/>
        {isLogged ? login : <a id="login" onClick={gotologin}>Login</a>}
      </div>


      <div id="mySidenav" className="sidenav">

        {categories.length > 0 ? showCategories(categories, setProducts, setCategory) : <a onClick={retry}> Loading Failed. Click to retry </a>}
      </div>

      <div id="main">
        {Cookie.get("category") > 0 ? <a className="categoryFilter"> {category.name} <button className="delete" onClick={deleteCategory}>X</button> </a> : <a/>}
        {products.length > 0 ? showProducts(products, setCartItems) : <a> Nothing to show :( </a>}


      </div>
    </div>
  );
}

export default Home;
