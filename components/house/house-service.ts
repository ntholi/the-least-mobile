import { House } from './house';

export function getAllHouses(): Promise<House[]> {
  return fetch('/api/houses').then((res) => res.json());
}
