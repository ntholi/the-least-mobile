import { KeyboardAvoidingView, StyleSheet } from 'react-native';
import React, { useEffect } from 'react';
import { auth } from '../../components/firebase/config';
import { NavigationProp, ParamListBase } from '@react-navigation/native';
import { useFonts } from 'expo-font';
import Nav from './Nav';
import LoadingScreen from '../utils/LoadingScreen';
import Logo from '../utils/Logo';
import Login from './Login';
import Signup from './Signup';

type Props = {
  navigation: NavigationProp<ParamListBase>;
};

export default function LoginScreen({ navigation }: Props) {
  const [showSignup, setShowSignup] = React.useState(false);

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
      if (user) {
        navigation.navigate('Home');
      }
    });
    return unsubscribe;
  }, []);

  let [fontsLoaded] = useFonts({
    Righteous: require('../../assets/fonts/Righteous-Regular.ttf'),
  });

  if (!fontsLoaded) {
    return <LoadingScreen />;
  }

  return (
    <KeyboardAvoidingView style={styles.container}>
      <Logo style={styles.logo} />
      <Nav showSignup={showSignup} setShowSignup={setShowSignup} />
      {showSignup ? <Signup /> : <Login />}
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    paddingTop: '50%',
    backgroundColor: '#212121',
  },
  logo: {
    marginBottom: 20,
  },
});
