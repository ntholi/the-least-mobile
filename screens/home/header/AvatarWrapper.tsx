import { Image, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React, { useEffect, useState } from 'react';
import colors from '../../utils/colors';
import { FontAwesome } from '@expo/vector-icons';
import { auth } from '../../../components/firebase/config';
import { UserInfo } from 'firebase/auth';

function getFirstName(displayName: string | null | undefined) {
  if (displayName) {
    const name = displayName.split(' ');
    return name[0];
  }
  return '';
}

export default function AvatarWrapper() {
  const [user, setUser] = useState<UserInfo | null>(null);
  useEffect(() => {
    return auth.onAuthStateChanged(setUser);
  }, []);
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button}>
        <FontAwesome name='money' size={20} color={'white'} />
        <Text style={styles.buttonText}>Donate Now</Text>
      </TouchableOpacity>

      <TouchableOpacity style={styles.avatar}>
        <Text style={styles.avatarText}>{getFirstName(user?.displayName)}</Text>
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
    paddingHorizontal: 10,
    paddingVertical: 8,
    borderRadius: 5,
    backgroundColor: '#455A64',
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
