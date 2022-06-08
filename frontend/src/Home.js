import React, { useState } from "react";
import "./css/Home.css";
import logo from "./images/logo.svg"
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

function goto(path){
  window.location = window.location.origin + path
}


function gotologin(){
  goto("/login")
}


function retry() {
  Home();
}

function showCategories(categories) {
  return categories.map((category, i) => <a obj={category} key={category.category_id}>{category.name}</a>)
}

function showProducts(products){
  return products.map((product, i) =>

   <div obj={product} key={product.product_id} className="product">
    <div>
      <img width="128px" height="128px" src={"./images/" + product.picture_url}/>
    </div>
    <a className="name">{product.name}</a>
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


function Home() {
  const [isLogged, setIsLogged] = useState(false)
  const [user, setUser] = useState({})
  const [categories, setCategories] = useState([])
  const [products, setProducts] = useState([])


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

  return (
    <div className="home">
      <div className="topnav">
        <img src={logo} width="64px" height="64px" />
        <input type="text" id="search" placeholder="Search..." onChange={search}/>
        {isLogged ? <a id="logout" onClick={logout}> <span> Welcome in {user.first_name} </span> </a> : <a id="login" onClick={gotologin}>Login</a>}
      </div>


      <div id="mySidenav" className="sidenav">

        {categories.length > 0 ? showCategories(categories) : <a onClick={retry}> Loading Failed. Click to retry </a>}
      </div>

      <div id="main">
        {products.length > 0 ? showProducts(products) : <a> Nothing to show :( </a>}


      </div>
    </div>
  );
}

export default Home;
