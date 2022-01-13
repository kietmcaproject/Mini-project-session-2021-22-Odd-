import React, { useEffect, useState } from "react";
import { useAuthState } from "react-firebase-hooks/auth";
import { useHistory } from "react-router";
import "./Dashboard.css";
import './App.css';
import { auth, db, logout } from "./firebase";
function Dashboard() {
    const [temp, setTemp] = useState("");
    const [word, setWord] = useState("");
    const [size, setSize] = useState(400);
    const [bgColor, setBgColor] = useState("ffffff");
    const [qrCode, setQrCode] = useState("");
    
    function handleClick() {
        setWord(temp);
      }


  const [user, loading, error] = useAuthState(auth);
  const [name, setName] = useState("");
  const history = useHistory();
  const fetchUserName = async () => {
    // try {
    //   const query = await db
    //     .collection("users")
    //     .where("uid", "==", user?.uid)
    //     .get();
    //   const data = await query.docs[0].data();
    //   setName(data.name);
    // } catch (err) {
    //   console.error(err);
    //   alert("An error occured while fetching user data");
    // }
  };
  useEffect(() => {
    setQrCode
    (`http://api.qrserver.com/v1/create-qr-code/?data=${word}!&size=${size}x${size}&bgcolor=${bgColor}`);
    //  }, [word, size, bgColor]);
     
    if (loading) return;
    if (!user) return history.replace("/");
    fetchUserName();
  }, [user, loading,word, size, bgColor]);
  return (
    // <div className="dashboard">
    <div className="App">

    <h1>QR Code Generator</h1>
      <div className="input-box">
        <div className="gen">
          <input type="text" onChange={
            (e) => {setTemp(e.target.value)}}
            placeholder="Enter text to encode" />
          <button className="button" 
            onClick={handleClick}>
            Generate
          </button>
        </div>
        <div className="extra">
          <h5>Background Color:</h5>
          <input type="color" onChange={(e) => 
          { setBgColor(e.target.value.substring(1)) }} />
          <h5>Dimension:</h5>
          <input type="range" min="200" max="600"
           value={size} onChange={(e) => 
           {setSize(e.target.value)}} />
        </div>
      </div>
      <div className="output-box">
        <img src={qrCode} alt="" />
        <a href={qrCode} download="QRCode">
          <button type="button">Download</button>
        </a>
      </div>



      {/* <div className="dashboard__container">
        Logged in as
        <div>{name}</div>
        <div>{user?.email}</div>
        <button className="dashboard__btn" onClick={logout}>
          Logout
        </button>
      </div> */}
    </div>
  );
}
export default Dashboard;