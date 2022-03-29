import { async } from '@firebase/util';
import { createUserWithEmailAndPassword } from 'firebase/auth';
import { auth } from '../firebase/config';

export async function login(email: string, password: string) {
  return await createUserWithEmailAndPassword(auth, email, password);
}

export async function getCurrentUser() {
  return await auth.currentUser;
}
