import React, { useState } from "react";
import { BrowserRouter as Router, Route, Routes, Link} from "react-router-dom";
import "./App.css";
import Home from "./Home"
import Login from "./Login"
  
function App(){
return (
    <Router>
      <Routes>
        <Route exact path= "/login" element={Login}/>
        <Route path = "/home" element={Home}/>
      </Routes>
    </Router>
  );
}

export default App;