'use strict';

import React, { Component } from 'react';

import {
  AppRegistry,
  StyleSheet,
  Text,
  TouchableOpacity,
  Linking
} from 'react-native';
import firebase from "firebase/compat";
import QRCodeScanner from 'react-native-qrcode-scanner';
import { RNCamera } from 'react-native-camera';
// import database from "./fb1";
class Login extends Component {
    constructor(props){
        super(props);
        // this.onSuccess = this.onSuccess.bind(this);
        // this.jump = this.jump.bind(this);
        // this.jumping=false;
    }
    
  onSuccess = e => {
    // this.props.navigation.navigate('HomeScreen')
    const that = this;
    // alert(e.data)
    const firebaseConfig = {
      apiKey: "AIzaSyDgAlDW1KNoOx2Az2mFNiuZuuVeXEGtKO4",
      authDomain: "arproject-c8e53.firebaseapp.com",
      projectId: "arproject-c8e53",
      storageBucket: "arproject-c8e53.appspot.com",
      messagingSenderId: "535590209950",
      appId: "1:535590209950:web:04925bc916e9a222206e8f",
      measurementId: "G-KXGPWXVD64"
    };
  
    firebase.initializeApp(firebaseConfig);
    var database = firebase.database()
      .ref('students')
      // .equalTo(e.data)
      .child(e.data)
      .once('value',function(snapshot){
    // alert(e.data)
    // firebase.database().ref('student/${e.data}').once('value',function(snapshot){
      if(!snapshot.exists()){
        // alert("present");
        // <HomeScreen/>
        // this.jump();
        // {()=>this.jump}
    //   this.props.navigation.navigate('HomeScreen')
      alert("You are not a Registered Student");
      }

      
      else
      {
        that.props.navigation.navigate('HomeScreen',{
            paramKey:"`${e.data}`"
            // paramKey:`${e.data}`
        })
        //   this.setState({
        //       jumping:true
        //   })
        // alert("not")
      }
    })
    // this.jump()
    // this.props.navigation.navigate('HomeScreen')
    // alert("yo")
  };
//  jump(){
//     //  {this.state.jumping?alert('hii'):alert('qq')}

//     if(this.jumping==true){
//         alert('true')
//     }
//     // alert('hii')
//     // this.props.navigation.navigate('HomeScreen');
// }
  render() {
    return (
      <QRCodeScanner
        onRead={this.onSuccess}
        flashMode={RNCamera.Constants.FlashMode.off}
        topContent={
          <Text style={styles.centerText}>
            {/* Go to{' '} */}
            <Text style={styles.textBold}>Scan your i card </Text>
            jo gle me latka hua hai usme jo qr code hai.
          </Text>
        }
        bottomContent={
          <TouchableOpacity style={styles.buttonTouchable}>
            <Text style={styles.buttonText}>OK. Got it!</Text>
          </TouchableOpacity>
        }
      />
    );
  }
}

const styles = StyleSheet.create({
  centerText: {
    flex: 1,
    fontSize: 18,
    padding: 32,
    color: '#777'
  },
  textBold: {
    fontWeight: '500',
    color: '#000'
  },
  buttonText: {
    fontSize: 21,
    color: 'rgb(0,122,255)'
  },
  buttonTouchable: {
    padding: 16
  }
});

export default Login;