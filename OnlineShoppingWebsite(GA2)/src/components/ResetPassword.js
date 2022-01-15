import React ,{useState}from 'react'
import logo from './Assets/navykart-logo.jpg'
import './ResetPassword.css'
import {Link,useHistory} from 'react-router-dom'
import fire from '../config'

function ResetPassword() {

    const [email,setEmail]=useState('')
    const history =useHistory();

    const handleResetPassword=()=>{
        fire.auth().sendPasswordResetEmail(email).then
                   (()=> 
                    alert("Check your email to reset password & Sign IN "),
                    history.push("/login")
                    )
                   .catch(err=> alert(err))
    }

    return (
        <div className="resetPassword">
            <Link to="/">
            <img className="resetPassword_img" src={logo} alt=""/>
            </Link>

            <div className="resetPassword_form" >
                <h2>Password assistance</h2>

                <p className="resetPassword_para">Enter the email address associated with your Navykart account.</p>
                
                <div className="resetPassword_formOption">Registered email</div>
                <input type="email"  className="resetPassword_formText" onChange={(e)=> setEmail(e.target.value)} />

                <button className="resetPassword_resetPassword" onClick={handleResetPassword}>Continue</button>
            </div>

        </div>
    )
}

export default ResetPassword
