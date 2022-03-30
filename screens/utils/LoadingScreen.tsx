import { ActivityIndicator, StyleSheet, View } from 'react-native';
import React from 'react';
import colors from './colors';

export default function LoadingScreen() {
  return (
    <View style={styles.container}>
      <ActivityIndicator size='large' color={colors.primary} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.dark,
  },
});
