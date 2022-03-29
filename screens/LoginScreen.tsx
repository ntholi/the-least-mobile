import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  TextInput,
  Touchable,
  TouchableOpacity,
  View,
} from 'react-native';
import React from 'react';
import { createUserWithEmailAndPassword, getAuth } from 'firebase/auth';
import { auth } from '../components/firebase/config';

export default function LoginScreen() {
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [error, setError] = React.useState('');

  async function handleLogin() {
    try {
      console.log(`logins with '${email}' and '${password}'`);
      const user = await createUserWithEmailAndPassword(auth, email, password);
      console.log('user', user.user.uid);
    } catch (error: any) {
      console.log('Error=>', error);
      setError(error.message);
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
