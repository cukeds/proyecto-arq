import React, { useState } from "react";
import "./Home.css";
import Cookies from "universal-cookie";

const Cookie = new Cookies();

/* async function getUserById(id){
    return await fetch('http://127.0.0.1:8090/user/' + id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
}).then(response => {
    return response.json()
})

}
const renderName = (

    <div>{getUserById(Cookie.get("user_id"))}</div>
)
 */
function Home() {
  const [isLogged, setIsLogged] = useState(false)
  return (
    <div className="home">
        <div className="title">HOME</div>
        {Cookie.get("user_id") > -1 ? <p>jose</p> : <p> USUARIO</p>}
    </div>
  );
}

export default Home;