import { StyleSheet, Text, View } from 'react-native';
import React, { useEffect } from 'react';
import { getCurrentUser } from '../components/user/user-service';
import { User } from 'firebase/auth';

export default function HomeScreen() {
  const [user, setUser] = React.useState<User | null>(null);
  useEffect(() => {
    getCurrentUser().then(setUser);
  }, []);

  return (
    <View>
      <Text>{user?.email}</Text>
    </View>
  );
}

const styles = StyleSheet.create({});
