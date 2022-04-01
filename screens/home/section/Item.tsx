import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { House } from '../../../components/house/house';
import { MaterialIcons } from '@expo/vector-icons';
import { money } from '../../../components/utils/format';
import { NavigationProp, ParamListBase } from '@react-navigation/native';

type Props = {
  house: House;
  navigation: NavigationProp<ParamListBase>;
};

export default function Item({ house, navigation }: Props) {
  function handlePress() {
    navigation.navigate('House', { house });
  }
  return (
    <TouchableOpacity style={styles.container} onPress={handlePress}>
      <Text style={styles.title}>{house.name}</Text>
      <View style={styles.location}>
        <MaterialIcons name='location-on' size={15} color={'#fff'} />
        <Text style={styles.locationText}>{house.address}</Text>
      </View>
      <View style={styles.goal}>
        <View>
          <Text style={styles.moneyValue}>{money(0)}</Text>
          <Text style={styles.moneyLabel}>Donated</Text>
        </View>
        <View>
          <Text style={styles.moneyValue}>{money(0)}</Text>
          <Text style={styles.moneyLabel}>Target</Text>
        </View>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    paddingTop: 10,
    marginVertical: 8,
    backgroundColor: '#455A64',
    borderRadius: 10,
  },
  title: {
    color: colors.light,
    textTransform: 'uppercase',
  },
  location: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 5,
  },
  locationText: {
    color: colors.light,
    marginLeft: 3,
    fontSize: 12,
  },
  goal: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  moneyValue: {
    color: colors.primary,
    fontSize: 16,
  },
  moneyLabel: {
    color: colors.dim,
    fontSize: 12,
    // fontWeight: 'bold',
  },
});
