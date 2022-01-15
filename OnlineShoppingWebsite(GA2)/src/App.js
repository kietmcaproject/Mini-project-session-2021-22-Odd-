import React ,{useState,useEffect} from 'react'
import "./App.css";
import Header from './components/Header'
import Home from './components/Home'
import Login from './components/Login'
import {BrowserRouter as Router, Route ,Switch} from "react-router-dom"
import SignUp from './components/SignUp'
import Cart from './components/Cart'
import fire from './config'
import ResetPassword from './components/ResetPassword'
import CheckOut from './components/CheckOut'

function App() {
const [user,setUser]=useState(null)

useEffect(() => {
  fire.auth().onAuthStateChanged(user=>{
    if(user){
      if(user?.emailVerified){
        setUser(user) 
      }else{
        setUser(null)
      }
    }else{
      setUser(null) 
    }
  })
}, [])

  return (
    
      <Router>
        <div className="App">
        <Switch >

          <Route path="/cart">
            <Header user={user}/>
            <Cart/>
          </Route>
          
          <Route path="/login">
            <Login />     
          </Route>

          <Route path="/signup">
            <SignUp  />
          </Route>

          <Route path="/resetpassword">
            <ResetPassword/>
          </Route>

          <Route path="/checkout">
            <Header user={user}/>
            <CheckOut/>  
          </Route>
          
          <Route path="/">
            <Header user={user}/>            {/* for sending the data to header page*/}
            <Home />
          </Route>

        </Switch>
      
      </div>
      </Router>
  );
}

export default App;
