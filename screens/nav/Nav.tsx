import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React from 'react';
import { FontAwesome5 } from '@expo/vector-icons';
import colors from '../utils/colors';

const inactive = colors.dim;
const active = colors.light;

export default function Nav() {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={[styles.button]}>
        <FontAwesome5 name='home' size={20} color={active} />
        <Text style={[styles.buttonText, { color: active }]}>Home</Text>
      </TouchableOpacity>
      <TouchableOpacity style={[styles.button]}>
        <FontAwesome5 name='search' size={20} color={inactive} />
        <Text style={[styles.buttonText, { color: inactive }]}>Search</Text>
      </TouchableOpacity>
      <TouchableOpacity style={[styles.button]}>
        <FontAwesome5 name='map-marked' size={20} color={inactive} />
        <Text style={[styles.buttonText, { color: inactive }]}>Map</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 10,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: colors.darker,
  },
  button: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 10,
    paddingVertical: 5,
  },
  buttonText: {
    color: colors.light,
    fontSize: 12,
    marginTop: 5,
  },
});
