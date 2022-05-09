import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../utils/colors';
import { Header } from 'react-native/Libraries/NewAppScreen';
import Nav from '../nav/Nav';

export default function DonateScreen() {
  return (
    <View style={styles.container}>
      <Header />
      <Text>Hello World</Text>
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
