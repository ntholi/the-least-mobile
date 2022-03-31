import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../utils/colors';
import Header from './header/Header';
import Nav from '../nav/Nav';

export default function HomeScreen() {
  return (
    <View style={styles.container}>
      <Header />
      <Text></Text>
      <Nav />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    backgroundColor: colors.dark,
  },
});
