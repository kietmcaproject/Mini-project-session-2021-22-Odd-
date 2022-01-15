import firebase from 'firebase/app'
import 'firebase/auth'

const firebaseConfig = {
  apiKey: "AIzaSyDy_jAyI6LOiFBqCa11EOnhlJ0K_pc6TTk",
  authDomain: "navykart.firebaseapp.com",
  projectId: "navykart",
  storageBucket: "navykart.appspot.com",
  messagingSenderId: "698305334130",
  appId: "1:698305334130:web:bde026ef6457c994d72beb"
};

const fire = firebase.initializeApp(firebaseConfig);
  
export default fire;