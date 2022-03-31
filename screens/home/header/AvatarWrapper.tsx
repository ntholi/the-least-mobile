import { Image, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { FontAwesome } from '@expo/vector-icons';

export default function AvatarWrapper() {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button}>
        <FontAwesome name='money' size={20} color={'white'} />
        <Text style={styles.buttonText}>Donate Now</Text>
      </TouchableOpacity>

      <TouchableOpacity style={styles.avatar}>
        <Text style={styles.avatarText}>Thabo</Text>
        <Image
          source={require('../../../assets/images/avatar.jpg')}
          style={styles.avatarImage}
        />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  button: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: colors.dim,
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 5,
  },
  buttonText: {
    color: colors.light,
    marginLeft: 10,
    fontSize: 12,
  },
  avatar: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatarImage: {
    width: 39,
    height: 39,
    borderRadius: 20,
    justifyContent: 'center',
  },
  avatarText: {
    color: colors.light,
    fontSize: 16,
    marginRight: 10,
  },
});
