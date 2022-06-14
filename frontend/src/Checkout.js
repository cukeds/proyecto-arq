import React, { useState, List, Checkbox} from "react";
import "./css/Checkout.css";
import logo from "./images/logo.svg"
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

async function postOrder(products, address) {
  let details = []
  products.forEach((item) => {
    let detail = {
      product_id: item.product_id,
      quantity: Number(item.quantity),
      price: Number(item.base_price),
      currency_id: "ARS",
      name: item.name
    }
    details.push(detail)
  });

  return fetch("http://127.0.0.1:8090/order", {
    method:"POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      currency_id: "ARS",
      user_id: Number(Cookie.get("user_id")),
      details: details,
      address: address
    })
  })
}

function goto(path){
  window.location = window.location.origin + path
}

function logout(){
  Cookie.set("user_id", -1, {path:"/"})
  window.location.reload();
}

async function getCartProducts(){
  let items = []
  let a = Cookie.get("cart").split(";")

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


function getOptions(n){
  let options = []
  for(let i=1; i <= n; i++){
    options.push(i)
  }
  return options.map((option) =>
    <option value={option}> {option} </option>
)
}

function remove(n, p_id){
  let cookie = Cookie.get("cart");
  let newCookie = ""
  let toCompare = cookie.split(";")
  let isEmpty = false
  toCompare.forEach((item) => {
    if(item != ""){
      let array = item.split(",")
      let item_id = array[0]
      let item_quantity = array[1]
      if(p_id == item_id){
        item_quantity = Number(item_quantity) - n
        if(item_quantity == 0){
          isEmpty = true
        }
      }
      if(p_id == item_id && !isEmpty){
        newCookie += item_id + "," + item_quantity + ";"
      }
      else if (p_id != item_id){
        newCookie += item_id + "," + item_quantity + ";"
      }
    }
  });
  cookie = newCookie
  Cookie.set("cart", cookie, {path: "/"})
  goto("/cart")
  return
}

function showProducts(products){
  return products.map((product) =>

   <div>
     <div obj={product} key={product.product_id} className="product">
      <div>
        <img width="128px" height="128px" src={"./images/" + product.picture_url}  onError={(e) => (e.target.onerror = null, e.target.src = "./images/default.jpg")}/>
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
       <h3 className="Remove"> Remove items </h3>
       <select id={"removeSelect" + product.product_id}>
        {getOptions(product.quantity)}
       </select>
       <button className="remove" onClick={() => remove(document.getElementById("removeSelect" + product.product_id).value, product.product_id)}>x</button>
       <h1 className="amount"> Amount: </h1>
       <h1 className="number"> {product.quantity} </h1>
       <h1 className="subtotal"> Subtotal: ${product.quantity * product.base_price} </h1>
      </div>
   </div>


 )

}

async function setCart(setter, setterTotal){
  let total = 0;
  await getCartProducts().then(response => {
    setter(response)
    response.forEach((item) => {
      total += item.base_price * item.quantity;
    });
    setterTotal(total)
  })
}

async function buy(products, address){
  if(address.bought != undefined){
  await postOrder(products, address).then(response => {
    if(response.status == 409){
      response.json().then(response => Cookie.set("orderError", response, {path: "/order"}))
      goto("/order/error")
    }
    if(response.status == 201){
      Cookie.set("order", Cookie.get("cart"), {path: "/order"})
      Cookie.set("cart", "", {path: "/"})
      Cookie.set("cartItems", "", {path: "/"})
      goto("/order/complete")
    }
  })
}else{
  alert("Please fill in the missing address information and submit your address")
}
}

function Checkout(){
  const [user, setUser] = useState({});
  const [isLogged, setIsLogged] = useState(false);
  const [cartProducts, setCartProducts] = useState([]);
  const [total, setTotal] = useState(0);
  const [address, setAddress] = useState({});
  const [addressErrors, setAddressErrors] = useState({});

  function getAddress(){
    let errors = {}
    let stop = false;
    if(document.getElementById("street").value == ""){
      errors.street = true;
    }
    if(document.getElementById("number").value == ""){
      errors.number = true;
    }
    if(document.getElementById("district").value == ""){
      errors.district = true;
    }
    if(document.getElementById("city").value == ""){
      errors.city = true;
    }
    if(document.getElementById("country").value == ""){
      errors.country = true;
    }
    Object.keys(errors).forEach((key) => {
      if(errors[key]){
        setAddressErrors(errors)
        stop = true;
      }
    });
    if(stop){
      return
    }
    setAddress({
      street: document.getElementById("street").value,
      street2: document.getElementById("street2").value,
      number: document.getElementById("number").value,
      district: document.getElementById("district").value,
      city: document.getElementById("city").value,
      country: document.getElementById("country").value,
      bought: true
    })
    setAddressErrors({})
  }

  if (cartProducts.length <= 0 && Cookie.get("user_id") > -1){
    setCart(setCartProducts, setTotal)
  }

  const login = (

    <span>
    <img src={usersvg} onClick={()=>goto("/user")} id="user" width="48px" height="48px"/>
    <a id="logout" onClick={logout}> <span> Welcome in {user.first_name} </span> </a>
    </span>
  )

  if (Cookie.get("user_id") > -1 && !isLogged) {
    getUserById(Cookie.get("user_id")).then(response => setUser(response))
    setIsLogged(true)
  }

  const renderEmptyCart = (
    <a className="empty-cart"> Hey, have you tried logging in? That would make this easier :D </a>
  )

  const renderOrderButton = (
    <div className="emptySpace">
      <span> Total: ${total} </span>
      <button onClick={() => buy(cartProducts, address)}>Pay and Order</button>
    </div>
  )

  return (
    <div className="cart">
      <div className="topnav">
      <div>
        <img src={logo} width="80px" height="80px" id="logo" onClick={()=>goto("/")} /> <p>3 Random Words Shop</p>
      </div>
        {isLogged ? login : <a id="login" onClick={() => goto("/login")}>Login</a>}
      </div>



      <div id="main">
        {Cookie.get("cart") && Cookie.get("user_id") > -1 ? renderOrderButton : <span/>}
        <div className="address">
          <a className="addressTitle">Shipping Address</a>
          <a className="street">Street<input style={addressErrors.street ? {background: "red"} : {background: "white"}} id="street"/></a>
          <a className="street2">Street 2<input style={addressErrors.street2 ? {background: "red"} : {}} id="street2"/></a>
          <a className="number">Number<input style={addressErrors.number ? {background: "red"} : {}} id="number"/></a>
          <a className="district">District<input style={addressErrors.district ? {background: "red"} : {}} id="district"/></a>
          <a className="city">City<input style={addressErrors.city ? {background: "red"} : {}} id="city"/></a>
          <a className="country">Country<input style={addressErrors.country ? {background: "red"} : {}} id="country"/></a>
          <input type="submit" onClick={()=>getAddress()}/>
        </div>
        {Cookie.get("cart") ? (Cookie.get("user_id") > -1 ? showProducts(cartProducts) : renderEmptyCart) : <a> Nothing to show :( </a>}

      </div>
    </div>
  );
}

export default Checkout;
