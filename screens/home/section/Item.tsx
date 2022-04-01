import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { House } from '../../../components/house/house';

type Props = {
  house: House;
};

export default function Item({ house }: Props) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>{house.name}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    marginVertical: 8,
    color: colors.light,
  },
  title: {
    fontSize: 24,
    color: colors.light,
  },
});
