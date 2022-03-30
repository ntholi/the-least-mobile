import { StatusBar } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import HomeScreen from './screens/HomeScreen';
import LoginScreen from './screens/login/LoginScreen';

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
          <Stack.Screen name='Home' component={HomeScreen} />
        </Stack.Navigator>
      </NavigationContainer>
    </>
  );
}
