import React, { useState } from "react";
import "./css/Order.css";
import logo from "./images/logo.svg"
import cart from "./images/cart.svg"
import usersvg from "./images/user.svg"
import Cookies from "universal-cookie";

const Cookie = new Cookies();

async function getUserById(id){
  return fetch("http://127.0.0.1:8090/user/" + id, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

async function getProductById(id){
  return fetch("http://127.0.0.1:8090/product/" + id, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

async function getOrderById(id) {
  return fetch("http://127.0.0.1:8090/order/" + id, {
    method:"GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then(response => response.json())
}

function goto(path){
  window.location = window.location.origin + path
}

function logout(){
  Cookie.set("user_id", -1, {path:"/"})
  window.location.reload();
}

function showProducts(products){
  return products.map((product) =>
   <div>
   <div obj={product} key={product.product_id} className="product">
    <div>
      <img width="128px" height="128px" src={"../images/" + product.picture_url}  onError={(e) => (e.target.onerror = null, e.target.src = "../images/default.jpg")}/>
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
   <div className="quantity">
     <h1 className="amount"> Amount: </h1>
     <h1 className="number"> {product.quantity} </h1>
     <h1 className="subtotal"> Subtotal: ${product.quantity * product.base_price} </h1>
  </div>
   </div>
 )

}

async function getOrderProducts(){
  let items = []
  let a = Cookie.get("order").split(";")

  for (let i = 0; i < a.length; i++){
    let item = a[i];
    if(item != ""){
      let array = item.split(",")
      let id = array[0]
      let quantity = array[1]
      let product = await getProductById(id)
      product.quantity = quantity;
      items.push(product)
    }
  }
  return items
}


async function setOrder(setOrder, setTotal){
  let total = 0;
  await getOrderProducts().then(response => {
    setOrder(response)
    response.forEach((item) => {
      total += item.base_price * item.quantity;
    });
    setTotal(total)
  })
}



function Order(){
  const [user, setUser] = useState({});
  const [isLogged, setIsLogged] = useState(false);
  const [orderProducts, setOrderProducts] = useState([])
  const [total, setTotal] = useState(0)

  const login = (

    <span>
    <img src={usersvg} onClick={()=>goto("/user")} id="user" width="48px" height="48px"/>
    <img src={cart} onClick={()=>goto("/cart")} id="cart" width="48px" height="48px"/>
    <a id="logout" onClick={logout}> <span> Welcome in {user.first_name} </span> </a>
    </span>
  )

  if (Cookie.get("user_id") > -1 && !isLogged) {
    getUserById(Cookie.get("user_id")).then(response => setUser(response))
    setIsLogged(true)
  }


  if (orderProducts.length <= 0 && Cookie.get("user_id") > -1){
    setOrder(setOrderProducts, setTotal)
  }

  const complete = (
    <div>
    <div> Woohoo you placed a freaking order. I'm so proud of you</div>
    {showProducts(orderProducts)}

    <div> Total: ${total} </div>
    </div>
  )


  const error = (
    <div>
    <div> BOO ERROR :(((( </div>
    <div> Let's think. This probably happened because of some stock mistake </div>
    <div> Error {Cookie.get("orderError")} </div>
    <h1> X </h1>
    </div>
  )

  return (
    <div className="orderstatus">
      <div className="topnav">
        <img src={logo} width="80px" height="80px" id="logo" onClick={()=>goto("/")} />
        {isLogged ? login : <a id="login" onClick={() => goto("/login")}>Login</a>}
      </div>



      <div id="main">
        {window.location.pathname.split("/")[2] == "complete" ? complete : error}
      </div>
    </div>
  );
}

export default Order;
