import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { House } from '../../../components/house/house';
import { MaterialIcons } from '@expo/vector-icons';
import { money } from '../../../components/utils/format';

type Props = {
  house: House;
};

export default function Item({ house }: Props) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>{house.name}</Text>
      <View style={styles.location}>
        <MaterialIcons name='location-on' size={24} color={'#fff'} />
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
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    paddingTop: 10,
    marginVertical: 8,
    backgroundColor: '#607D8B',
    borderRadius: 10,
  },
  title: {
    fontSize: 14,
    color: colors.light,
  },
  location: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 5,
  },
  locationText: {
    color: colors.light,
    marginLeft: 5,
  },
  goal: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  moneyValue: {
    color: '#A5D6A7',
    fontSize: 16,
    fontWeight: 'bold',
  },
  moneyLabel: {
    color: colors.dim,
  },
});
