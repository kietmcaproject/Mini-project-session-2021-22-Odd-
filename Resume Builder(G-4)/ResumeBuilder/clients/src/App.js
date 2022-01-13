import React, { Component } from 'react';

import axios from 'axios';
import './App.css';
import UserForm from './components/UserForm';
import Login from './components/Login';
import Signup from './components/Signup';
import Navbar from './components/Navbar';




class App extends Component {
     state = {
      logged_in: false
    }

      componentDidMount() {
            var auth_token=localStorage.getItem('token')
            try{
                var auth_email= JSON.parse(localStorage.getItem('auth_data')).email
            }
            catch(e)
            {

            }

            if(auth_token)
            {
                auth_token = JSON.parse(auth_token)
                    axios.post(`/check/login`,{auth_token,auth_email})
      .then(res=>{

        if(res.data.success == 1)
        {
     this.setState({ logged_in: true }) 
     // alert("logged in.....")  
        }
        else
        {
            alert("error in login",res.data)
             this.setState({ logged_in: false }) 
        }
      
      }).catch(err=>{
        console.log("Eror is ",err)
      })

            }
            else
            {
                console.log("null auht token")
            }
        

  }

  componentDidUpdate()
  {
    console.log("+++++++++++++++++updtaed.....")
  }



    render() {
        var show;
        if(this.state.logged_in)
        {
                   show =<div>
                   <Navbar/>
            <div className = 'col-lg-8 mx-auto text-center mt-5' >

            <h1 > < b > Lets generate your Resume</b></h1> 
            <p className = 'lead' > Please provide accurate and clear description wherever necessary. < /p> 
            <hr / >
            </div>   
            <UserForm / >
            </div>
        }
       
           else if(window.location.pathname == "/signup" && !this.state.logged_in)
        {
             show=<Signup/>
        }
        else
        {
            show=<Login/>
        }
        return ( <>{show}</>);
    }
}

export default App;