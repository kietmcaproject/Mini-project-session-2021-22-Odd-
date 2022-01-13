import React, { Component } from 'react'
import axios from 'axios'
class Signup extends Component {

 state:{
    name:''
   }

    login=e=>{
    e.preventDefault()
    window.location.href="/login"
   }

    signup = e => {
        e.preventDefault();
        console.log("signup...................",this.state)
        var {email,password,name} =this.state
        axios.post('/signup',{email,password,name}).then(resp=>{
            if(resp.data.success == 1)
            {
                  alert(resp.data.message)
                  window.location.href="/login"
            }
            else
            {
                alert("unable to save user")
                console.log(resp.data)
            }
        })
    }
 handleChange = ({ target: { value, name } }) => this.setState({ [name]: value })

    render() {
       
        return (
            <div className="card animated fadeInLeft col-lg-9 container">
                <div className="card-body">

                    <h3 className="card-title text-center">Signup</h3>
                    <hr />
                </div>
           <form className="col-lg-9 container">
            <div className="form-group">
    <label for="exampleInputname">Name</label>
    <input type="text" className="form-control" id="exampleInputname" onChange={this.handleChange} aria-describedby="emailHelp" placeholder="Enter name" name="name"/>
   
  </div>
  <div className="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" className="form-control" id="exampleInputEmail1" onChange={this.handleChange} aria-describedby="emailHelp" placeholder="Enter email" name="email" />
    <small id="emailHelp" className="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div className="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" className="form-control" id="exampleInputPassword1" onChange={this.handleChange} placeholder="Password" name="password" />
  </div>
 
  <button type="submit" className="btn btn-primary" onClick={this.signup}>Signup</button>
  <button type="submit" className="btn btn-primary" onClick={this.login}>Login</button>

</form>
            </div>
        )
    }
}

export default Signup;
