import React ,{useState} from 'react'
import logo from './Assets/navykart-logo.jpg'
import './Login.css'
import {Link , useHistory} from 'react-router-dom'
import fire from '../config'

function Login() {

    const [email,setEmail]=useState("")
    const [password,setPassword]=useState("")

    const history = useHistory();

    const handleLogin=(e)=>{
        e.preventDefault();
        fire.auth().signInWithEmailAndPassword(email,password)
        .then((res)=>{
            if(res.user.emailVerified){
                history.push("/")
            }else{
                fire.auth().currentUser.sendEmailVerification().catch(err=> alert(err))
                alert("Email not verified, Check Your email to verify & Login")
            }
        })
        .catch((err)=> alert(err))
    }

    return (
        <div className="login">
             <Link to="/">
            <img className="login_img" src={logo} alt=""/>
            </Link>
            <div className="login_form" >
                <h2>Login</h2>
                <div className="login_formOption ">Email Address</div>
                <input type="text" value={email} className="login_formText" onChange={(e)=> setEmail(e.target.value)} />

                <div className="login_formOption">Password</div>
                <input type="password" value={password} className="login_formText" onChange={(e)=> setPassword(e.target.value)} />

                <div className="login_formOption forgot">
                    <Link to="/resetpassword" className="login_forgot">Forgot password?</Link>
                </div>

                <button className="login_login" onClick={handleLogin}>Login</button>
                
                <p>By continuing, you agree to Navykart's <span className="login_form_pSpan">Conditions of Use</span> and <span className="login_form_pSpan">Privacy Notice.</span></p>
            </div>

            <span className="login_line"></span>
            <span className="login_linePara"> New to Navykart?</span>

            <Link to="/signup">
            <button className="login_register">Create your Navykart account</button>
            </Link>
            
        </div>
    )
}

export default Login
