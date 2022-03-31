import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';

export default function Filter() {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={[styles.button, styles.active]}>
        <Text style={styles.buttonText}>All</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Favorites</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Near You</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Critical</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    marginTop: 40,
  },
  button: {
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: colors.dim,
    borderRadius: 20,
    marginRight: 10,
  },
  buttonText: {
    color: colors.light,
    fontSize: 12,
  },
  active: {
    backgroundColor: colors.primary,
    borderBottomColor: colors.primary,
  },
});
