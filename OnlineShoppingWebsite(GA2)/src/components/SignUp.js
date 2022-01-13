import React ,{useState} from 'react'
import logo from './Assets/navykart-logo.jpg'
import './signup.css'
import {Link, useHistory} from 'react-router-dom'
import fire from '../config'

function SignUp() {

    const [name,setName]=useState('')
    const [email,setEmail]=useState('')
    const [password,setPassword]=useState('')
    const [confirmPassword,setConfirmPassword]=useState('')
    
    const history = useHistory();

    const handleSignUp=(e)=>{
        e.preventDefault();
        if(name!==''){
            if(password===confirmPassword){
                fire.auth().createUserWithEmailAndPassword( email,password)
                    .then(() => {
                        const userData = fire.auth().currentUser;
                        userData.updateProfile({ displayName: name })    /*the name we type in input tag can be passed to firebase user data*/
                        userData.sendEmailVerification().catch(err=>alert(err))
                        alert("Check Your email")
                        history.push("/login")
                    })
                    .catch((err)=> alert(err))
            }else{ alert("Password doesn't match")}
        }else{ alert("Please enter Name")}
    }

    return (
        <div className="signup">
            
            <Link to="/">
            <img className="signup_img" src={logo} alt=""/>
            </Link>

            <div className="signup_form" >
                <h2>Create Account</h2>

                <div className="signup_formOption">Your Name</div>
                <input type="text" value={name} className="signup_formText" onChange={(e)=> setName(e.target.value)} required/>
                
                <div className="signup_formOption">Email</div>
                <input type="email" value={email} className="signup_formText" onChange={(e)=> setEmail(e.target.value)} />

                <div className="signup_formOption">Password</div>
                <input type="password" value={password} placeholder="At least 6 characters" className="signup_formText" onChange={(e)=> setPassword(e.target.value)} />

                <div className="signup_formOption">Confirm Password</div>
                <input type="password" value={confirmPassword} placeholder="must be same as password" className="signup_formText" onChange={(e)=> setConfirmPassword(e.target.value)} />
                 
                <div className="signup_para">
                    <p>We will send you a text to verify your phone.</p>
                    <p>Message and Data rates may apply.</p>
                </div>
                
                <button className="signup_signup" onClick={handleSignUp}>Continue</button>
                
                <div className="signup_borderline"></div>

                <div className="signup_login_line">Already have an account? 
                    <Link to="/login" className="signup_linkToLogin">
                        <span className="signup_login">Sign in</span>
                    </Link>
                </div>        
    
            </div>

        </div>
    )
}

export default SignUp
