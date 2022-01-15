import React from 'react'
import './Header.css'
import navykartLogo from './Assets/navykart-logo.jpg'
import SearchIcon from '@material-ui/icons/Search';
import ShoppingBasketIcon from '@material-ui/icons/ShoppingBasket';
import {Link} from 'react-router-dom'
import fire from '../config'
import { useStateValue } from './StateProvider';

function Header({user}) {

    const [{basket},dispatch]=useStateValue();

    const handleLogout=()=>{
        if(user)
        fire.auth().signOut();
    }
    
    return (
        <div className="header">
            <Link to="/">
            <img className="header_logo" src={navykartLogo} alt="Logo" />
            </Link>

            <div className="header_search">
                <input className="header_input" type="text" />
                <SearchIcon className="header_icon" />     
            </div>
            <div className="header_nav">

                <div className="header_signIn">            {/* Conditional operator */}
                    
                    <div className="header_signIn">                               
                        <Link to={!user && '/login'} className="header_linkToLogin ">
                            <div className="header_options" onClick={handleLogout} >
                                <span className="header_lineOne">{user ? fire.auth().currentUser?.email : 'Hello, Guest'}</span> 
                                <span className="header_lineTwo">{user ? fire.auth().currentUser?.displayName : 'Sign In'}</span>
                            </div>
                        </Link>    
                        {/*the '?' in "auth().currentUser.displayname" is because initially it will show error that "display name can not be empty"
                            while it have data but it takes times to fetch it so '?' makes it async fuction which means wait for some time till it fetch the data.  }
                        </Link>
                        */}
                        {user ? 
                            <div className="header_SignInMenu">
                                <button className="header_signInmenuBtn" onClick={handleLogout}>Logout</button>
                            </div> :
                            <div className="header_SignInMenu">
                                <Link to="/login">
                                    <button className="header_signInmenuBtn">Sign in</button>
                                </Link>
                                <div className="header_SignInMenuText">New Customer? 
                                    <Link to="/signup" className="header_SignInMenu_signupLink">
                                        <span className="header_SignInMenu_signup"> Start here.</span>
                                    </Link>
                                </div>  
                            </div>}
                    </div>
                    
                    
                <div className="header_arrowup"></div>     {/* for little triangle near the signin button*/} 
                </div>   

                <div className="header_options">
                    <span className="header_lineOne">Returns</span> 
                    <span className="header_lineTwo">& Orders</span>
                </div>

                <div className="header_options">
                    <span className="header_lineOne">Your</span> 
                    <span className="header_lineTwo">Prime</span>
                </div>

                <Link to="/cart" className="header_linkToCart">
                <div className="header_optionCart">
                    <ShoppingBasketIcon className="header_cartLogo" />
                    <span className="header_lineTwo header_cartCount">{basket?.length}</span>
                </div>
                </Link>
            </div>  
        </div>
    )
}

export default Header
