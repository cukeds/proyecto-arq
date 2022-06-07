
import React, { useState } from "react";
import logo from './logo.svg';
import './Prueba1.css';

async function getUserByID(id) {
 return fetch('http://127.0.0.1:8090/user/' + id, {
   method: 'GET',
   headers: {
     'Content-Type': 'application/json'
   }
 })
   .then(data => data.json())
}


function Prueba1() {

  const [userData, setUserData] = useState({});
  const [isUser, setIsUSer] = useState(false);
  const [errorMessages, setErrorMessages]=useState({});
  const handleSubmit = async event => {
    //Prevent page reload
    event.preventDefault();

    // Obtenemos Textos
    var {uid, upass}  = document.forms[0];

    alert(upass.value);
    // Find user login info
    const user = await getUserByID(uid.value);
    
   
    setUserData(user);
    setIsUSer(true);
    
  };

  
  const renderForm = (
    <div className="form">
      <form onSubmit={handleSubmit}>
        <div className="input-container">
          <label> Usuario</label>
          <input type="text" name="uid" placeholder="name_example@gmail.com" required />
          <label>Contraseña </label>
          <input type="password" name="upass" placeholder="Ingrese Contraseña" required />
        </div>
        <div className="button-container">
          <input type="submit" value="Send Request" />
        </div>
      </form>
    </div>
  );

  return (
    <div className="app">
      <div className="login-form">
        <div className="title">BIENVENIDOS! {userData.name}</div>
          {isUser? <div>bienvenido de nuevo, {userData.name} </div> : renderForm}
      </div>
    </div>
  );
}

export default Prueba1;
