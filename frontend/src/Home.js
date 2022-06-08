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

function goto(path){
  window.location = window.location.origin + path
}


function gotologin(){
  goto("/login")
}

function Home() {
  const [isLogged, setIsLogged] = useState(false)
  const [user, setUser] = useState({})


    if (Cookie.get("user_id") > -1 && !isLogged){
      getUserById(Cookie.get("user_id")).then(response => setUser(response))
      setIsLogged(true)
    }

  return (
    <div className="home">
      <div className="topnav">
        <img src={logo} width="64px" height="64px" />
        <input type="text" id="search" placeholder="Search..."/>
        <a id="login" onClick={gotologin}>Login</a>
      </div>
    </div>
  );
}

export default Home;
