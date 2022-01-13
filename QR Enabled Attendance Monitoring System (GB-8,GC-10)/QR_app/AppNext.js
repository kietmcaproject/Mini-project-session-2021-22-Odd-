// import React ,{useState,useEffect} from 'react';
// import {
//     SafeAreaView,
//     StyleSheet,
//     View,
//     Text,
// } from 'react-native';

// const App=()=>{
// const [currentDate,setCurrentdate] = useState('');

// useEffect(()=>{
//     var date = new Date().getDate();
//     var month = new Date().getMonth();
//     var year = new Date().getFullYear();

//     setCurrentdate(
//         date+'/'+month+'/'+year
//     );
// },[]);
// return(
//     <SafeAreaView>
//         <Text>
//             {currentDate}
//         </Text>
//     </SafeAreaView>
// );
// };

// export default App;


























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
class AppNext extends Component {
  constructor(props){
      super(props);
      this.state={
          today:"",
          student:"",
          // stu:this.props.navigation.getParam('stu'),
      }
  }
  componentDidMount=()=>{
    // const {navigation} = this.props;
    // const text = navigation.getParam('student','student')
    // // const text = this.props.navigation.getParam('student');
    // this.setState({student:text});
    // alert(this.state.student);
        var date = new Date().getDate();
    var month = new Date().getMonth()+1;
    var year = new Date().getFullYear();

    this.setState({
        today:`${year}-${month}-0${date}`
    })
  }
    onSuccess = e => {
    alert(e.data)
    // alert(this.state.today)
       const that = this;
    const firebaseConfig = {
      apiKey: "AIzaSyDgAlDW1KNoOx2Az2mFNiuZuuVeXEGtKO4",
      authDomain: "arproject-c8e53.firebaseapp.com",
      projectId: "arproject-c8e53",
      storageBucket: "arproject-c8e53.appspot.com",
      messagingSenderId: "535590209950",
      appId: "1:535590209950:web:04925bc916e9a222206e8f",
      measurementId: "G-KXGPWXVD64"
    };
    // var me = this.state.my;
    //  var me = "Type";
    //  firebase.initializeApp(firebaseConfig);
    //  var database = firebase.database()
    //    .ref('2021-12-05')
    //    // .equalTo(e.data)
    //    .child("lec1")
    //    .once('value',function(snapshot){
    //  // alert(e.data)
    //  // firebase.database().ref('student/${e.data}').once('value',function(snapshot){
    //    if(snapshot.exists()){
    //      alert("present");
        
       
       
    //    }
    //    else
    //    {
    //      alert("not")
    //    }
    //  })
     


    // var me= "Type";
    firebase.initializeApp(firebaseConfig);
    var databas = firebase.database()
      .ref(`${this.state.today}/${e.data}`)
    // .ref('2021-12-05/lec1')
      // .equalTo(e.data)
      .child("2023MCA1078")
      .once('value',function(snapshot){
    // alert(e.data)
    // firebase.database().ref('student/${e.data}').once('value',function(snapshot){
      if(snapshot.exists()){
        // alert("present");
        // var p  ="Date";
        var db = firebase.database().ref(`${that.state.today}/${e.data}`)
        db.update({'2023MCA1078':"Present"});
        // databas.update({me:'p'})
        // <HomeScreen/>
    //   this.props.navigation.navigate('HomeScreen')
      alert("Attdence Marked");
      }
      else
      {
        alert("some thing error")
        
      }
    })
   
  };

  render() {
    return (
      <QRCodeScanner
        onRead={this.onSuccess}
        flashMode={RNCamera.Constants.FlashMode.off}
        topContent={
          <Text style={styles.centerText}>
            Go to{' '}
            <Text style={styles.textBold}>Scan the QR code</Text> on
            your computer or Projector bla bla ....
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
// export default App;
// AppRegistry.registerComponent('default', () => ScanScreen);
class HomeScreen extends Component{
  render(){
    return(
      <View>
        <Text>home screen</Text>
      </View>
    )
  }
}




// import { NavigationContainer } from '@react-navigation/native';
// import {createNativeStackNavigator} from '@react-navigation/native-stack';

// const Stack = createNativeStackNavigator();

// function App(){
//   return(
//     <NavigationContainer>
//       <Stack.Navigator initialRouteName="Login">
//         <Stack.Screen name="Login" component={Login}/>
//         <Stack.Screen name="HomeScreen" component={HomeScreen}/>
//       </Stack.Navigator>
//     </NavigationContainer>
//   )
// }

export default AppNext;


