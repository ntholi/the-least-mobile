import {
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from 'react-native';
import React from 'react';
import { login } from '../../components/user/user-service';
import colors from '../utils/colors';

export default function Login() {
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');

  async function handleLogin() {
    try {
      const user = login(email, password);
    } catch (error: any) {
      alert(error.message);
    }
  }

  return (
    <>
      <View style={loginStyles.inputContainer}>
        <TextInput
          style={loginStyles.input}
          placeholder='Email'
          value={email}
          onChangeText={(text) => setEmail(text.trim())}
        />
        <TextInput
          style={loginStyles.input}
          placeholder='Password'
          secureTextEntry
          value={password}
          onChangeText={(text) => setPassword(text.trim())}
        />
      </View>
      <TouchableOpacity
        onPress={handleLogin}
        style={loginStyles.buttonContainer}
      >
        <Text style={loginStyles.button}>Sign In</Text>
      </TouchableOpacity>
    </>
  );
}

export const loginStyles = StyleSheet.create({
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
    textTransform: 'uppercase',
    color: '#fff',
  },
});
