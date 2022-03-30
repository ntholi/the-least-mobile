import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
  ActivityIndicator,
} from 'react-native';
import React, { useEffect } from 'react';
import { auth } from '../../components/firebase/config';
import { login } from '../../components/user/user-service';
import { NavigationProp, ParamListBase } from '@react-navigation/native';
import { useFonts } from 'expo-font';
import Nav from './Nav';
import LoadingScreen from '../utils/LoadingScreen';
import Logo from '../utils/Logo';
import colors from '../utils/colors';

type Props = {
  navigation: NavigationProp<ParamListBase>;
};

export default function LoginScreen({ navigation }: Props) {
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
      if (user) {
        navigation.navigate('Home');
      }
    });
    return unsubscribe;
  }, []);

  async function handleLogin() {
    try {
      const user = login(email, password);
    } catch (error: any) {
      alert(error.message);
    }
  }

  let [fontsLoaded] = useFonts({
    Righteous: require('../../assets/fonts/Righteous-Regular.ttf'),
  });

  if (!fontsLoaded) {
    return <LoadingScreen />;
  }

  return (
    <KeyboardAvoidingView style={styles.container}>
      <Logo style={styles.logo} />
      <Nav />
      <View style={styles.inputContainer}>
        <TextInput
          style={styles.input}
          placeholder='Email'
          value={email}
          onChangeText={(text) => setEmail(text.trim())}
        />
        <TextInput
          style={styles.input}
          placeholder='Password'
          secureTextEntry
          value={password}
          onChangeText={(text) => setPassword(text.trim())}
        />
      </View>
      <TouchableOpacity onPress={handleLogin} style={styles.buttonContainer}>
        <Text style={styles.button}>Login</Text>
      </TouchableOpacity>
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
  inputContainer: {
    width: '70%',
    marginTop: 20,
  },
  input: {
    borderColor: '#ccc',
    borderWidth: 1,
    paddingHorizontal: 15,
    paddingVertical: 5,
    marginBottom: 10,
    borderRadius: 20,
    backgroundColor: '#fff',
  },
  buttonContainer: {
    marginTop: 20,
    width: '70%',
  },
  button: {
    width: '100%',
    textAlign: 'center',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 20,
    backgroundColor: colors.primary,
    color: '#fff',
  },
});
