import { Text, StyleSheet, View } from 'react-native';
import React, { Component } from 'react';
import colors from './colors';

type Props = {
  style?: any;
};
export default function Logo({ style }: Props) {
  return (
    <View style={[styles.container, style]}>
      <Text style={styles.the}>The</Text>
      <Text style={styles.least}>Least</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#212121',
  },
  the: {
    fontSize: 50,
    color: '#fff',
    fontWeight: 'bold',
  },
  least: {
    fontSize: 50,
    color: colors.primary,
    fontWeight: 'bold',
  },
});
