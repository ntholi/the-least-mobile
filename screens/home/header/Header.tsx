import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import AvatarWrapper from './AvatarWrapper';
import Filter from './Filter';

export default function Header() {
  return (
    <View style={styles.container}>
      <AvatarWrapper />
      <Filter />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 15,
    paddingTop: 40,
    borderBottomColor: '#080808',
    borderBottomWidth: 2,
    elevation: 2,
  },
});
