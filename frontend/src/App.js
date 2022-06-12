import React, { useState } from "react";
import { BrowserRouter as Router, Route, Routes, Link} from "react-router-dom";
import "./css/App.css";
import Home from "./Home"
import Login from "./Login"
import Cart from "./Cart"
import Order from "./Order"
import User from "./User"

function App(){
return (
    <Router>
      <Routes>
        <Route exact path = "/" element={<Home/>}/>
        <Route path= "/login" element={<Login/>}/>
        <Route path= "/cart" element={<Cart/>}/>
        <Route path= "/order/complete" element={<Order/>}/>
        <Route path= "/order/error" element={<Order/>}/>
        <Route path= "/user" element={<User/>}/>
      </Routes>
    </Router>
  );
}

export default App;
