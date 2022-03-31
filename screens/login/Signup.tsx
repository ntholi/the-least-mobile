import {
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from 'react-native';
import React from 'react';
import { loginStyles } from './Login';
import User from '../../components/user/user';
import { signup } from '../../components/user/user-service';

export default function Signup() {
  const [email, setEmail] = React.useState('');
  const [names, setNames] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [passwordConfirm, setConfirmPassword] = React.useState('');

  async function handleSignup() {
    const user: User = {
      id: '',
      email,
      password,
      names,
    };
    try {
      await signup(user);
    } catch (err: any) {
      console.error(err);
      alert(err.message);
    }
  }

  return (
    <>
      <View style={loginStyles.inputContainer}>
        <TextInput
          style={loginStyles.input}
          placeholder='Names'
          textContentType='name'
          value={names}
          onChangeText={(text) => setNames(text.trim())}
        />
        <TextInput
          style={loginStyles.input}
          placeholder='Email'
          textContentType='emailAddress'
          value={email}
          onChangeText={(text) => setEmail(text.trim())}
        />
        <TextInput
          style={loginStyles.input}
          placeholder='Password'
          textContentType='password'
          secureTextEntry
          value={password}
          onChangeText={(text) => setPassword(text.trim())}
        />

        <TextInput
          style={loginStyles.input}
          placeholder='Confirm Password'
          textContentType='password'
          secureTextEntry
          value={passwordConfirm}
          onChangeText={(text) => setConfirmPassword(text.trim())}
        />
      </View>
      <TouchableOpacity
        onPress={handleSignup}
        style={loginStyles.buttonContainer}
      >
        <Text style={loginStyles.button}>Sign Up</Text>
      </TouchableOpacity>
    </>
  );
}

const styles = StyleSheet.create({});
