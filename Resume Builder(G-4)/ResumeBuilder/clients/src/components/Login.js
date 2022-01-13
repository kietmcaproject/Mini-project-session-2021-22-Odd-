import React, { Component } from 'react'
import axios from 'axios';
class Login extends Component {

   state:{
    name:''
   }
   signup=e=>{
    e.preventDefault()
    window.location.href="/signup"
   }

    login = e => {
        e.preventDefault();
        console.log("login...................",this.state.email)
        var {email,password} =this.state
        axios.post('/login',{email,password}).then(resp=>{
            if(resp.data.success == 1)
            {
                  localStorage.setItem('auth_data', JSON.stringify(resp.data.user));
                  localStorage.setItem('token', JSON.stringify(resp.data.token));
                  window.location.href="/"
                  // window.location.reload()

            }
            else
            {
                alert("User does not exists")
                console.log(resp.data)
            }
        })
    }
 handleChange = ({ target: { value, name } }) => this.setState({ [name]: value })
    render() {
       
        return (
            <div className="card animated fadeInLeft col-lg-9 container">
                <div className="card-body">

                    <h3 className="card-title text-center">Login</h3>
                    <hr />
                </div>
           <form className="col-lg-9 container">
  <div className="form-group">
    <label htmlFor="exampleInputEmail1">Email address</label>
    <input type="email" className="form-control" onChange={this.handleChange} name="email"  placeholder="Enter email"/>
    <small  className="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
  <div className="form-group">
    <label htmlFor="exampleInputPassword1">Password</label>
    <input type="password" className="form-control" onChange={this.handleChange}  placeholder="Password" name="password" />
  </div>
 
  <button type="submit" className="btn btn-primary" onClick={this.login}>Login</button>
  <button type="submit" className="btn btn-primary" onClick={this.signup}>Signup</button>

</form>
            </div>
        )
    }
}

export default Login;
