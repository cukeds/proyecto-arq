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

function Home() {
  const [isLogged, setIsLogged] = useState(false)
  const [user, setUser] = useState({})
  const [categories, setCategories] = useState([])


  if (Cookie.get("user_id") > -1 && !isLogged){
    getUserById(Cookie.get("user_id")).then(response => setUser(response))
    setIsLogged(true)
  }

  if(categories.length <= 0){
    getCategories().then(response => setCategories(response))
  }

  return (
    <div className="home">
      <div className="topnav">
        <img src={logo} width="64px" height="64px" />
        <input type="text" id="search" placeholder="Search..."/>
        <a id="login" onClick={gotologin}>Login</a>
      </div>


      <div id="mySidenav" className="sidenav">

        {categories.length > 0 ? showCategories(categories) : <a onClick={retry}> Loading Failed. Click to retry </a>}
      </div>

      <div id="main"> HERE GOES MIDDLE </div>
    </div>
  );
}

export default Home;
