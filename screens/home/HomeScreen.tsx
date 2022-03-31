import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../utils/colors';
import Header from './header/Header';

export default function HomeScreen() {
  return (
    <View style={styles.container}>
      <Header />
      <Text></Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.dark,
  },
});
