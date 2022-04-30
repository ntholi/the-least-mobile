import { Image, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React, { useEffect, useState } from 'react';
import colors from '../../utils/colors';
import { auth } from '../../../components/firebase/config';
import { UserInfo } from 'firebase/auth';
import Logo from '../../utils/Logo';

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
      <Logo size={20} />

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
    backgroundColor: colors.primary200,
  },
  buttonText: {
    color: colors.darker,
    marginLeft: 10,
    fontSize: 12,
  },
  avatar: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatarImage: {
    width: 28,
    height: 28,
    borderRadius: 20,
    justifyContent: 'center',
  },
  avatarText: {
    color: colors.light,
    fontSize: 16,
    marginRight: 10,
  },
});
