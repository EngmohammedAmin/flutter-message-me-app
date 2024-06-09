// import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.6.0/firebase-app.js';
// import { getFirestore } from 'https://www.gstatic.com/firebasejs/9.6.0/firebase-firestore.js';
import firebase from 'firebase/app';

// Import the Firebase services you need
import 'firebase/auth';
import 'firebase/firestore';
// Your Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyCFPI2ekejHA7XoKSrFV_PaV09nT8lLkEc",
    authDomain: "messageme-app-270eb.firebaseapp.com",
    projectId: "messageme-app-270eb",
    storageBucket: "messageme-app-270eb.appspot.com",
    messagingSenderId: "493900881295",
    appId: "1:493900881295:web:edf595fd3f046db0cc7ffa"
    // ... other Firebase configuration options
};

// Initialize Firebase
// const firebaseApp = initializeApp(firebaseConfig);
// const firestore = getFirestore(firebaseApp);
firebase.initializeApp(firebaseConfig);

// Export the necessary Firebase services
export const auth = firebase.auth();
export const firestore = firebase.firestore();
// Your JavaScript code here