import "./App.css";
// import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import React from "react";
// import db from "./firebase";
import database from "./fb2";
// import auth from "./firebase";
// import { auth, signInWithEmailAndPassword, signInWithGoogle } from "./firebase";
// import { Link, useHistory } from "react-router-dom";


// class App extends React.Component{
  class Home extends React.Component{
  constructor(props){
    super(props);
    this.state={
      value:'n',
      nameOf:'n',
      type:'n',
      course:'n',
      branch:'n',
      semester:'n',
      subject:'n',
      date:'n',
      lecture:'n',
      date:'n',
      // qr vla yha se
      temp:"",
      word:"",
      size:250,
      bgColor:'ffffff',
      qrCodes:"",

      fname:"",
      sname:"",
      openQR:false,
      time: {}, seconds: 0,
    };

    // this.state = { time: {}, seconds: 5 };
    this.timer = 0;
    this.startTimer = this.startTimer.bind(this);
    this.countDown = this.countDown.bind(this);
    this.handleTimer = this.handleTimer.bind(this);


    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleName   = this.handleName.bind(this);
    this.handleType   = this.handleType.bind(this);
    this.handleCourse = this.handleCourese.bind(this);
    this.handleBranch = this.handleBranch.bind(this);
    this.handleSemester= this.handleSemester.bind(this);
    this.handleSubject = this.handleSubject.bind(this);
    this.handleLecture = this.handleLecture.bind(this);
    this.handleDate   = this.handleDate.bind(this);

    this.handleTemp = this.handleTemp.bind(this);
    this.handleWord = this.handleWord.bind(this);
    this.handleSize = this.handleSize.bind(this);
    this.handleBgColor = this.handleBgColor.bind(this);
    this.handleQrCode = this.handleQrCode.bind(this);
  
    this.handleFname = this.handleFname.bind(this);
    this.handleSname = this.handleSname.bind(this);
    this.handlePush  = this.handlePush.bind(this);
    this.handleLogout = this.handleLogout.bind(this);
  

  }
  handleLogout(event){
    // logout()
    alert("in progress of logout button")
    // auth.signOut().then(function() {
    //   alert("Sign-out successful.")
    //   // <Link to="/"/>//Login</Link>
    //   // this.props.history.push('/')
    //   // this.props.navigator.immediatelyResetRouteStack([{ name: 'LOGIN' }])
    // }).catch(function(error) {
    //   alert("An error happened.")
    // });
    // alert("you r logout now")
  }
  handleTimer(event){
      // alert(event.target.value);
      if(event.target.value==15){
        this.setState({
          seconds:event.target.value
        });
      }
      else if(event.target.value==30){
        this.setState({
          seconds:event.target.value
        });
      }
      else if(event.target.value==45){
        this.setState({
          seconds:event.target.value
        });
      }
      else if(event.target.value==60){
        this.setState({
          seconds:event.target.value
        });
      }
    // this.setState(event){
    //   timer:
    // }
  }
  // generateQRCode
  handleDate(event){
    this.setState({
      date:event.target.value
    });
  }
  handlePush(event){
      alert(this.state.fname+" " +this.state.sname)

      database.ref("user").set({
        name:this.state.fname,
        age:this.state.sname
      }).catch(alert)
      alert("data saved")
    }

    handleSname(event){
      this.setState({
        sname:event.target.value
      });
    }
    handleFname(event){
      this.setState({
        fname:event.target.value
      });
    }
  handleTemp(event){
    this.setState({
      temp:event.target.value
    });
  }
  handleWord(event){
    this.setState({

      word:event.target.value
    });
  }
  handleSize(event){
    this.setState({
      size:event.target.value
    });
  }
  handleBgColor(event){
    this.setState({
      bgColor:event.target.value
    });
  }
  handleQrCode(event){
    alert("handle qr "+this.state.word);
    // alert(`http://api.qrserver.com/v1/create-qr-code/?data=${this.state.course}!&size=${this.state.size}x${this.state.size}&bgcolor=${this.state.bgColor}`)
    this.setState({
      // qrCodes:event.targer.qrCodes
      qrCodes:`http://api.qrserver.com/v1/create-qr-code/?data=${this.state.lecture}&size=${this.state.size}x${this.state.size}&bgcolor=${this.state.bgColor}`
    });
  }
  handleBranch(event){
    this.setState({
      branch:event.target.value
    });
  }

  handleLecture(event){
    this.setState({
      lecture:event.target.value
    });
  }
  handleSubject(event){
    this.setState({
      subject:event.target.value
    });
  }
  handleSemester(event){
    this.setState({
      semester:event.target.value
    });
  }
  handleCourese(event){
    this.setState({
      course:event.target.value
    });
  }
  handleType(event){
    this.setState({
      type:event.target.value
    });
  }
  handleName(event){
    this.setState({
      nameOf:event.target.value
    });
  }
  handleChange(event){
    this.setState({
      value:event.target.value
    });
  }

  handleSubmit(event){
    // alert('Your fovorite '+this.state.value);
    if(this.state.nameOf=='n'){
      alert("Type of attdence")
    }
    else if((this.state.type)=='n'){
      alert("Select Type")
    }
    else if(this.state.course=='n'){
      alert("Select Course")
    }
    else if(this.state.branch=='n'){
      alert("Select Branch")
    }
    else if(this.state.subject=='n'){
      alert("Select subject")
    }
    else if(this.state.lecture=='n'){
      alert("Select Lecture")
    }
    else if(this.state.date == 'n'){
      alert("Select Date")
    }
    else{
      // alert("Every thing OK "+this.state.nameOf)

      // this.handleQrCode()
      // database.ref("user").set({
      //   name:this.state.fname,
      //   age:this.state.sname
      // }).catch(alert)
      // alert("data saved")
      database.ref(`${this.state.date}/${this.state.lecture}`).set({
        Type_of_attdence:this.state.nameOf,
        Type:this.state.type,
        course:this.state.course,
        branch:this.state.branch,
        semester:this.state.semester,
        subject:this.state.subject,
        lecture:this.state.lecture,
        Date:this.state.date,
        '2023MCA1078':'Absent',
        '2023MCA9999':'Absent',
        '2023MCA8888':'Absent',
        '2023MCA7777':'Absent'
      })
      // this.handleQrCode(),
      this.setState({
        // qrCodes:event.targer.qrCodes
        qrCodes:`http://api.qrserver.com/v1/create-qr-code/?data=${this.state.lecture}&size=${this.state.size}x${this.state.size}&bgcolor=${this.state.bgColor}`
      });
      
      this.setState({
        openQR:true
      })
      this.startTimer()
    }
  }



  ///////////////////////////////////////////////////////////////

  // constructor() {
  //   super();
  //   this.state = { time: {}, seconds: 5 };
  //   this.timer = 0;
  //   this.startTimer = this.startTimer.bind(this);
  //   this.countDown = this.countDown.bind(this);
  // }

  secondsToTime(secs){
    let hours = Math.floor(secs / (60 * 60));

    let divisor_for_minutes = secs % (60 * 60);
    let minutes = Math.floor(divisor_for_minutes / 60);

    let divisor_for_seconds = divisor_for_minutes % 60;
    let seconds = Math.ceil(divisor_for_seconds);

    let obj = {
      "h": hours,
      "m": minutes,
      "s": seconds
    };
    return obj;
  }

  componentDidMount() {
    let timeLeftVar = this.secondsToTime(this.state.seconds);
    this.setState({ time: timeLeftVar });
  }

  startTimer() {
    if (this.timer == 0 && this.state.seconds > 0) {
      this.timer = setInterval(this.countDown, 1000);
    }
  }

  countDown() {
    // Remove one second, set state so a re-render happens.
    let seconds = this.state.seconds - 1;
    this.setState({
      time: this.secondsToTime(seconds),
      seconds: seconds,
    });
    
    // Check if we're at zero.
    if (seconds == 0) { 
      clearInterval(this.timer);
      this.setState({
        openQR:false
      })
    }
  }

  


  ////////////////////////////////////////////////////////////////
  render(){

    
    return(
    <>
        
    <div style={{backgroundColor:'#0087b7',height:55}}>
      <img 
      src="https://www.pinclipart.com/picdir/big/532-5328945_menu-bar-icon-white-clipart-png-download-menu.png"
      style={{
        height:20,
        width:25,
        marginLeft:150
        // ,marginBottom:15
        
      }}
      />

    <label style={{
        height:70,
        backgroundColor:'#0087b7',
        color:'white'  ,
        fontSize:30,
        width:'20%',
        marginLeft:50

      }}>
      EASy
      
    </label>
    
    {/* <label style={{ */}
    <button style={{
        height:50,
        // backgroundColor:'#0087b7',
        backgroundColor:'transparent',

        color:'white'  ,
        fontSize:25,
        width:'20%',
        marginLeft:200,
        bottom:20,
        borderBlockColor:'transparent',
        borderColor:'transparent',

      }}
      onClick={this.handleLogout}
      // onClick={() => logout(auth)}
      >
      Academics
    </button>

    <label style={{
        height:70,
        backgroundColor:'#0087b7',
        color:'white'  ,
        fontSize:20,
        width:'20%',
        marginLeft:330,
        marginTop:5

      }}>
      2021-2022 Odd
      <img 
      src="https://cdn4.iconfinder.com/data/icons/text-editor-3/100/Minio_Text_Editor_Bold-26-512.png"
      style={{
        height:25,
        width:25,
        // marginLeft:1250,
        marginLeft:15,
        // marginTop:75,
        // marginBottom:15,
        // top:220,
        borderRadius:20,
        backgroundColor:'white'
      }}
      />
      
      {/* <span style={{
        // height:70,
        backgroundColor:'#0087b7',
        color:'white'  ,
        fontSize:10,
        // width:'20%',
        marginLeft:225,
        margintop:100
        // top:50

      }}>
      EASy
    </span> */}
    </label>
    
    {/* <img 
      src="https://cdn4.iconfinder.com/data/icons/text-editor-3/100/Minio_Text_Editor_Bold-26-512.png"
      style={{
        height:25,
        width:25,
        marginLeft:1250,
        top:220,
        borderRadius:20,
        backgroundColor:'white'
      }}
      /> */}
    {/* <center>
    <label style={{
      color:'white',
      // left:550,
      fontSize:30,  
      bottom:100
    }}>
      Academics
    </label>
    </center> */}
    
    </div>
    <div style={{marginLeft:40}}>
      <h3 style={{color:'gray'}}>HOME > STUFDENT ACADEMICS > <spam style={{color:'#0087b7'}}>MARK ATTENDANCE</spam></h3>
    </div>
    <div style={{backgroundColor:'#00c4df',height:50}}>
      <h2 style={{color:'white',marginLeft:40,paddingTop:10,paddingBottom:10,fontWeight:'lighter'}}>Mark Attendance</h2>
    </div>
    <div>

    
      {/* <h1 style={{
        height:50,
        backgroundColor:'blue',


        color:'white'  
      }}>EASY
      
      <spam  style={{
        // left:-250,
        justifyContent:'center',
        alignSelf:'center',
        backgroundColor:'blue',
        color:'white'  
      }}>djsf</spam>
      </h1> */}
{/* <table>
  <tr>
    <th>EASy</th>
  </tr>
</table> */}
      {/* <form 
      // onSubmit={this.handleSubmit}
      > */}

<div 
style={{
  marginLeft:150,
  // fontSize:20,
  // fontFamily:'bold',
  fontWeight: 'bold',
  marginTop:30
  }}
>      
<table>
{/* <tr> */}

 <div className="text-bold"> 
<label>
  Name of attdence:
  </label>
    <select 
    style={{marginLeft:50}}
    // style={{width:200}}
      value={this.state.nameOf}
      onChange={this.handleName}
    >
      {/* <option value="null" ></option> */}
      <option value="Choose One" >Choose One</option>
      <option value="NORMAL" >NORMAL</option>
      <option value="DOUBT CLEARING" >DOUBT CLEARING </option>
      <option value="TUTORIAL" >TUTORIAL</option>
      <option value="ATTENDANCE IMPROVEMENT" >ATTENDANCE IMPROVEMENT</option>
    </select>
    

<label
    style={{marginLeft:150}}

>
  Type:
  </label>
  <select style={{width:200}}
    value={this.state.type}
    onChange={this.handleType}
    style={{marginLeft:50}}

  >
    <option value="Choose One">Choose One</option>
    <option value="NON-GROUP">NON-GROUP</option>
    <option value="Group">Group</option>
    {/* <option value="t2">T2</option> */}
    
  </select>

 {/* </tr> */}
 </div>
<br/>
<tr>
<label>
 COURSE:
 </label> 
  <select style={{width:200}}
    value={this.state.course}
    onChange={this.handleCourse}
    style={{marginLeft:120}}

    >
      <option value="Choose One">Choose One</option>
      <option value="MBA">MBA</option>
      <option valur="MCA">MCA</option>
      <option valur="Btech">Btech</option>
      <option valur="Bpharma">Bpharma</option>
     
    </select>
 

 <label 
    style={{marginLeft:266}}
 
 >
    BRANCH:
    </label>
    <select style={{width:200}}
      value={this.state.branch}
      onChange={this.handleBranch}
    style={{marginLeft:20}}

      >
        <option value="Choose One">Choose One</option>
        <option value="MBA">MBA</option>
        <option value="MCA">MCA</option>
        <option value="CS">CS</option>
        <option value="IT">IT</option>
        {/* <option value="b2">MCA</option> */}
      </select>
  
 </tr>
<br/>
 <tr>
  <label>
    SEMESTER:
    </label>
    <select style={{width:200}}
      value={this.state.semester}
      onChange={this.handleSemester}
    style={{marginLeft:105}}

    >
      <option value="Choose One">Choose One</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  
 </tr>
<br/>
 <tr>
  <label
    style={{marginLeft:0}}
  
  >
    SUBJECT*
    </label>
    <select style={{width:200}}
      value={this.state.subject}
      onChange={this.handleSubject}
    style={{marginLeft:115}}

    >
      <option value="Choose One">Choose One</option>
      <option value="AI">AI</option>
      <option value="SE">SE</option>
      <option value="CN">CN</option>
      <option value="WT">WT</option>
      <option value="MERN">MERN</option>
      <option value="CC">CC</option>

    </select>
  
    <label
    style={{marginLeft:265}}
  
  >
    TIMER*
    </label>
    <select style={{width:200}}
      value={this.state.seconds}
      onChange={this.handleTimer}
    style={{marginLeft:35}}

    >
      <option value="Choose One">Choose One</option>
      <option value="15">15 second</option>
      <option value="30">30 second</option>
      <option value="45">45 second</option>
      <option value="60">60 second</option>
      {/* <option value="MERN">MERN</option>
      <option value="CC">CC</option> */}

    </select>
  
 </tr>
<br/>
 <tr>
  <label>
    DATE*:
  </label>
  <input 
    type="date" 
    value={this.state.date} 
    onChange={this.handleDate}
    style={{marginLeft:135}}

  />

  <label 
    style={{marginLeft:225}}
  
  >
    LECTURE: </label>
      <select style={{width:200}}
       value={this.state.lecture}
       onChange={this.handleLecture}
    style={{marginLeft:15}}

      >
        <option value="lec0">Choose One</option>
        <option value="lec1">LEC1</option>
        <option value="lec2">LEC2</option>
        <option value="lec3">LEC3</option>
        <option value="lec4">LEC4</option>
        <option value="lec5">LEC5</option>
        <option value="lec6">LEC6</option>
        <option value="lec7">LEC7</option>
        <option value="lec8">LEC8</option>
      </select>
  
  </tr>
<br/>
<center>

<button onClick={this.handleSubmit} 
className="text-bold"
style={{
  fontSize:25,
  fontFamily:'bold',
  backgroundColor:"#0087b7",
  borderColor:'white',
  paddingLeft:20,
  paddingRight:20,
  paddingTop:5,
  paddingBottom:5,
  color:'white'
  }}
> Next </button>
</center>
</table>
</div>
</div>
{/* </form> */}


<div style={{marginLeft:900,color:'red',fontWeight:'bolder'}}>
        {/* <button onClick={this.startTimer}>Start</button> */}
        Minute: {this.state.time.m} second left: {this.state.time.s}
      </div>

{
this.state.openQR?<center>
<div className="input-box">
  {/* <div className="gen">
    <input 
      placeholder="Enter text" 
      type="text" 
      value={this.state.word}
      onChange={this.handleWord}
    />
    <button 
      className="button" 
      onClick={this.handleQrCode}
    >Generate</button>
  </div> */}

  <div className="extra">
    <h5>Background Color</h5>
    <input 
      type="color"
      value={this.state.bgColor}
      onChange={this.handleBgColor}
      />
      <h5>Dimensions:</h5>
      <input 
        type="range" 
        min="200"
        max="600"
        value={this.state.size}
        onChange={this.handleSize}
      />
  </div>

  <div className="output-box">
    <img 
      src={this.state.qrCodes} 
      alt="Code kaam nhi kr rha hahahaha..."
    />
    <a 
      href={this.state.qrCodes} 
      download="QRCode"
    />
    
  </div>
</div></center>:
<h6>.</h6>

}

{/* <h1>QR code is here</h1> */}
<div className="input-box">
  {/* <div className="gen">
    <input 
      placeholder="Enter text" 
      type="text" 
      value={this.state.word}
      onChange={this.handleWord}
    />
    <button 
      className="button" 
      onClick={this.handleQrCode}
    >Generate</button>
  </div> */}

  <div className="extra">
    {/* <h5>Background Color</h5>
    <input 
      type="color"
      value={this.state.bgColor}
      onChange={this.handleBgColor}
      />
      <h5>Dimensions:</h5> */}
      {/* <input 
        type="range" 
        min="200"
        max="600"
        value={this.state.size}
        onChange={this.handleSize}
      /> */}
  </div>

  {/* <div className="output-box">
    <img 
      src={this.state.qrCodes} 
      alt="Code kaam nhi kr rha hahahaha..."
    />
    <a 
      href={this.state.qrCodes} 
      download="QRCode"
    />
    
  </div> */}
</div>

{/* <h1>databse vala</h1>
  
  <input 
  placeholder="Enter  text for database" 
  value={this.state.fname}
  onChange={this.handleFname}
  // onChange={()=>this.setState(this.state.fname)}
/>
<br/>
<input 
  placeholder="Enter Second Name"
  value={this.state.sname}
  onChange={this.handleSname}
  // onChange={()=>this.setState({sname})}
/>

<button 
  onClick={this.handlePush}
>Push Button</button> */}
</>
    )
  }
}
















// class App extends React.Component{
//   constructor(props){
//     super(props);
//     this.state ={
//       value:"Please Write an paragraph"
//     }

//     this.handleChange = this.handleChange.bind(this);
//     this.handleSubmit = this.handleSubmit.bind(this);
//   }

//   handleChange(event){
//     this.setState({value:event.target.value});
//   }
//   handleSubmit(event){
//     alert('An eass was ' +this.state.value);
//     // event.preventDefault();
//   }
//   render(){
//     return(
//       <>
//         <h1>Form</h1>
//         <form onSubmit={this.handleSubmit}>
//           <label>
//             Eassy:
//               <textarea value={this.state.value} 
//                 onChange={this.handleChange} />
//           </label>

//           <input type="submit" value="Submit" />
//         </form>
//       </>
//     )
//   }
// }






// class App extends React.Component{
//   constructor(props){
//     super(props);
//     this.state = {value:''};

//     this.handleChange = this.handleChange.bind(this);
//     this.handleSubmit = this.handleSubmit.bind(this);
//   }

//   handleChange(event){
//     this.setState({value:event.target.value});
//   }

//   handleSubmit(event){
//     alert('sumbited'+this.state.value);
//     event.preventDefault();
//   }
//   render(){
//     return(
//       <div>
//       <h1>Hello</h1>
//         <form onSubmit={this.handleSubmit}>
//           <label>
//             Name: <input type="text"  value={this.state.value}
//               onChange={this.handleChange}
//                />
//           </label>
//           <input type="submit" value="Submit" />
//         </form>     
//       </div>
//     );
//   }
// }










///////////////////////////////////////////////////////

// // import Login from "./Login";
// // import Register from "./Register";
// // import Reset from "./Reset";
// // import Dashboard from "./Dashboard";
// function App() {
//   return (
//     <div className="app">
//       <h1>hello form is makings</h1>



//       {/* <Router>
//         <Switch>
//           <Route exact path="/" component={Login} />
//           <Route exact path="/register" component={Register} />
//           <Route exact path="/reset" component={Reset} />
//           <Route exact path="/dashboard" component={Dashboard} />
//         </Switch>
//       </Router> */}
//     </div>
//   );
// }
// export default App;
//////////////////////////////////////////////////////////

// // path="/Login"

// // import logo from './logo.svg';
// // import './App.css';

// // function App() {
// //   return (
// //     <div className="App">
// //       <header className="App-header">
// //         <img src={logo} className="App-logo" alt="logo" />
// //         <p>
// //           Edit <code>src/App.js</code> and save to reload.
// //         </p>
// //         <a
// //           className="App-link"
// //           href="https://reactjs.org"
// //           target="_blank"
// //           rel="noopener noreferrer"
// //         >
// //           Learn React
// //         </a>
// //       </header>
// //     </div>
// //   );
// // }

export default Home;
