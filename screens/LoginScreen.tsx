import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  TextInput,
  Touchable,
  TouchableOpacity,
  View,
} from 'react-native';
import React, { useEffect } from 'react';
import { createUserWithEmailAndPassword, getAuth } from 'firebase/auth';
import { auth } from '../components/firebase/config';
import { login } from '../components/user/user-service';
import { NavigationProp, ParamListBase } from '@react-navigation/native';

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

  return (
    <KeyboardAvoidingView style={styles.container}>
      <Text>LoginScreen</Text>
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
      <View style={styles.buttonContainer}>
        <TouchableOpacity onPress={handleLogin}>
          <Text style={styles.button}>Login</Text>
        </TouchableOpacity>
        <TouchableOpacity>
          <Text style={[styles.button, styles.buttonOutline]}>Register</Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  inputContainer: {},
  input: {},
  buttonContainer: {},
  button: {},
  buttonOutline: {},
});
