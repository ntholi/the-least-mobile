import { StatusBar } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LoginScreen from './screens/login/LoginScreen';
import HomeScreen from './screens/home/HomeScreen';
import HouseScreen from './screens/house/HouseScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <>
      <StatusBar backgroundColor={'#000'} />
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            options={{ headerShown: false }}
            name='Login'
            component={LoginScreen}
          />
          <Stack.Screen
            options={{ headerShown: false }}
            name='Home'
            component={HomeScreen}
          />
          <Stack.Screen
            options={{ headerShown: false }}
            name='House'
            component={HouseScreen}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </>
  );
}
