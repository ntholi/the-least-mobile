import { StyleSheet, View } from 'react-native';
import React from 'react';
import TopSection from './TopSection';
import Filter from './Filter';
import colors from '../../utils/colors';

type Props = {
  navigation: NavigationProp<ParamListBase>;
};

export default function Header({ navigation }): Props {
  return (
    <View style={styles.container}>
      <TopSection />
      <Filter navigation={navigation} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 15,
    paddingTop: 20,
    elevation: 5,
    borderBottomColor: colors.darker,
    borderBottomWidth: 2,
  },
});
