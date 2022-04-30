import { Text, StyleSheet, View } from 'react-native';
import React, { Component } from 'react';
import colors from './colors';

type Props = {
  style?: any;
  size?: number;
};

const fontFamily = 'Righteous';

export default function Logo({ style, size }: Props) {
  return (
    <View style={[styles(size).container, style]}>
      <Text style={styles(size).the}>The</Text>
      <Text style={styles(size).least}>Least</Text>
    </View>
  );
}

const styles = (size: number = 40) =>
  StyleSheet.create({
    container: {
      flexDirection: 'row',
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: colors.dark,
    },
    the: {
      fontSize: size,
      color: '#fff',
      fontFamily: fontFamily,
    },
    least: {
      fontSize: size,
      color: colors.primary,
      fontFamily: fontFamily,
    },
  });
