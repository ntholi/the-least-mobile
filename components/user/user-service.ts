import {
  createUserWithEmailAndPassword,
  deleteUser,
  updateProfile,
} from 'firebase/auth';
import { doc, setDoc } from 'firebase/firestore';
import { auth, firestore } from '../firebase/config';
import User from './user';

export async function login(email: string, password: string) {
  return await createUserWithEmailAndPassword(auth, email, password);
}

export async function signup(user: User) {
  const userInfo = await createProfile(user.email, user.password, user.names);
  try {
    await setDoc(doc(firestore, 'users', userInfo.uid), {
      email: user.email,
      names: user.names,
    });
  } catch (error) {
    deleteUser(userInfo);
    throw error;
  }
}

export async function getCurrentUser() {
  return await auth.currentUser;
}

async function createProfile(email: string, password: string, names: string) {
  const response = await createUserWithEmailAndPassword(auth, email, password);
  const userInfo = response.user;
  await updateProfile(userInfo, {
    displayName: names,
  });
  return userInfo;
}
