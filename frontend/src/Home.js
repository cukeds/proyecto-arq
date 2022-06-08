import React, { useState } from "react";
import "./Home.css";
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

function Home() {
  const [isLogged, setIsLogged] = useState(false)
  const [user, setUser] = useState({})


    if (Cookie.get("user_id") > -1 && !isLogged){
      getUserById(Cookie.get("user_id")).then(response => setUser(response))
      setIsLogged(true)
    }

  return (
    <div className="home">
        <div className="title">Bienvenido</div>
        {isLogged > -1 ? user.first_name : <p> USUARIO</p>}
    </div>
  );
}

export default Home;
