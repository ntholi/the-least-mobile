import { StatusBar, StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../utils/colors';
import { LinearGradient } from 'expo-linear-gradient';

export default function HouseScreen({ route, navigation }: any) {
  const { name } = route.params.house;
  return (
    <>
      <StatusBar backgroundColor={'#43A047'} />
      <View style={styles.container}>
        <LinearGradient
          colors={['#66BB6A', colors.dark]}
          style={styles.linearGradient}
        >
          <Text style={styles.houseName}>{name}</Text>
        </LinearGradient>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.dark,
  },
  linearGradient: {
    height: '30%',
    justifyContent: 'flex-end',
    paddingLeft: 10,
  },
  houseName: {
    fontSize: 30,
    color: colors.light,
  },
});
