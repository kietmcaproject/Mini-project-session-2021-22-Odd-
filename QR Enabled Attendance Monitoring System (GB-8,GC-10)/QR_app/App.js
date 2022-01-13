// 'use strict';

import React, { Component } from 'react';

// import {
//   AppRegistry,
//   StyleSheet,
//   Text,
//   TouchableOpacity,
//   Linking
// } from 'react-native';
// import firebase from "firebase/compat";
// import QRCodeScanner from 'react-native-qrcode-scanner';
// import { RNCamera } from 'react-native-camera';
// // import database from "./fb1";
// class Login extends Component {
//   onSuccess = e => {
//     // alert(e.data)
//     const firebaseConfig = {
//       apiKey: "AIzaSyDgAlDW1KNoOx2Az2mFNiuZuuVeXEGtKO4",
//       authDomain: "arproject-c8e53.firebaseapp.com",
//       projectId: "arproject-c8e53",
//       storageBucket: "arproject-c8e53.appspot.com",
//       messagingSenderId: "535590209950",
//       appId: "1:535590209950:web:04925bc916e9a222206e8f",
//       measurementId: "G-KXGPWXVD64"
//     };
  
//     firebase.initializeApp(firebaseConfig);
//     var database = firebase.database()
//       .ref('students')
//       // .equalTo(e.data)
//       .child(e.data)
//       .once('value',function(snapshot){
//     // alert(e.data)
//     // firebase.database().ref('student/${e.data}').once('value',function(snapshot){
//       if(snapshot.exists()){
//         alert("present");
//         // <HomeScreen/>
//       this.props.navigation.navigate('HomeScreen')
//       alert("2");
//       }
//       else
//       {
//         alert("not")
//       }
//     })
//     // // Linking.openURL(e.data).catch(err =>
//     // //   console.error('An error occured', err)
//     // // );
// //     let rootRef = firebase.database().ref();

// // rootRef
// //   .child('students')
// //   // .orderByChild('username')
// //   .equalTo(e.data)
// //   .once('value')
// //   .then(snapshot => {
// //     if (snapshot.exists()) {
// //       let userData = snapshot.val();
// //       console.log(userData);
// //       alert('username is taken');
// //       return userData;
// //     } else {
// //       console.log('not found');
// //       firebase
// //         .auth()
// //         .createUserWithEmailAndPassword("pop@gmail.com", "password")
// //         .then(async user => {
// //           console.log('Data created', user);
// //         });
// //     }
// // });
// // alert("ok")
//   };

//   render() {
//     return (
//       <QRCodeScanner
//         onRead={this.onSuccess}
//         flashMode={RNCamera.Constants.FlashMode.off}
//         topContent={
//           <Text style={styles.centerText}>
//             Go to{' '}
//             <Text style={styles.textBold}>wikipedia.org/wiki/QR_code</Text> on
//             your computer and scan the QR code.
//           </Text>
//         }
//         bottomContent={
//           <TouchableOpacity style={styles.buttonTouchable}>
//             <Text style={styles.buttonText}>OK. Got it!</Text>
//           </TouchableOpacity>
//         }
//       />
//     );
//   }
// }

// const styles = StyleSheet.create({
//   centerText: {
//     flex: 1,
//     fontSize: 18,
//     padding: 32,
//     color: '#777'
//   },
//   textBold: {
//     fontWeight: '500',
//     color: '#000'
//   },
//   buttonText: {
//     fontSize: 21,
//     color: 'rgb(0,122,255)'
//   },
//   buttonTouchable: {
//     padding: 16
//   }
// });
// export default App;
// AppRegistry.registerComponent('default', () => ScanScreen);
// class HomeScreen extends Component{
//   render(){
//     return(
//       <View>
//         <Text>home screen</Text>
//       </View>
//     )
//   }
// }
import AppNext from './AppNext.js';
import Login from './Login.js';



import { NavigationContainer } from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

function App(){
  return(
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login">
        <Stack.Screen name="Login" component={Login}/>
        <Stack.Screen name="HomeScreen" component={AppNext}/>
      </Stack.Navigator>
    </NavigationContainer>
  )
}

export default App;


