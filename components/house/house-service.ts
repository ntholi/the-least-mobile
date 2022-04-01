import { collection, getDocs } from 'firebase/firestore';
import { firestore } from '../firebase/config';
import { House } from './house';

export async function getHouses() {
  const snapshot = await getDocs(collection(firestore, 'houses'));
  const houses: House[] = [];
  snapshot.forEach((doc) => {
    houses.push(doc.data() as House);
  });
  return houses;
}
