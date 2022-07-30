importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyD_UEiQrmke--tMlRIl3lg8WggWNvVtiIs",
    authDomain: "ecommerce-app-b4734.firebaseapp.com",
    projectId: "ecommerce-app-b4734",
    storageBucket: "ecommerce-app-b4734.appspot.com",
    messagingSenderId: "486482974238",
    appId: "1:486482974238:web:494e6a1dea7b6a95c2400f",
    measurementId: "G-5G4KY84282"
  });
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});

const app = initializeApp(firebaseConfig);