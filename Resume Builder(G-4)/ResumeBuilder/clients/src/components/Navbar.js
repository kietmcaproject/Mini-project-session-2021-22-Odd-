import React, { Component } from 'react';

import axios from 'axios';


class Navbar extends Component {
logout()
{
    localStorage.clear()
    window.location.reload()
}
  


    render() {
      
        return (
            <div className="card animated fadeInLeft">
             
<nav className="navbar navbar-light bg-light">
  <a className="navbar-brand" href="#">
    <img src="/logo.png" width="30" height="30" className="d-inline-block align-top" alt=""/>
    Resume builder
  </a>
  <button className="btn btn-secondary" onClick={this.logout}>Logout</button>
</nav>
            </div>

        )
    }
}

export default Navbar;
