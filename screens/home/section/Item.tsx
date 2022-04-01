import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';

type Props = {
  title: string;
};

export default function Item({ title }: Props) {
  return (
    <View style={styles.item}>
      <Text style={styles.title}>{title}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  item: {
    padding: 20,
    marginVertical: 8,
    color: colors.light,
  },
  title: {
    fontSize: 24,
    color: colors.light,
  },
});
