import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getStorage } from 'firebase/storage';
import { getAuth } from 'firebase/auth';

const firebaseConfig = {
  apiKey: 'AIzaSyCOo2yNZ-4x8GZ0ZjNBtnq009ZWUxxQdww',
  authDomain: 'the-least.firebaseapp.com',
  projectId: 'the-least',
  storageBucket: 'the-least.appspot.com',
  messagingSenderId: '848730782552',
  appId: '1:848730782552:web:496b09914e0d622e3d432d',
};

const firebaseApp = initializeApp(firebaseConfig);

console.log(firebaseApp);

export const db = getFirestore(firebaseApp);
export const storage = getStorage(firebaseApp);
export const auth = getAuth(firebaseApp);
