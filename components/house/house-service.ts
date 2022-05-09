import { collection, getDocs } from 'firebase/firestore';
import { firestore } from '../firebase/config';
import { House } from './house';

export async function getHouses() {
  const snapshot = await getDocs(collection(firestore, 'houses'));
  const houses: House[] = [];
  snapshot.forEach((doc) => {
    const house = doc.data() as House;
    house.id = doc.id;
    houses.push(house);
  });
  return houses;
}
