import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../utils/colors';

export default function HouseScreen({ route, navigation }: any) {
  const { name } = route.params.house;
  return (
    <View style={styles.container}>
      <Text style={styles.houseName}>{name}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignContent: 'center',
    backgroundColor: colors.dark,
  },
  houseName: {
    fontSize: 30,
    color: colors.light,
  },
});
