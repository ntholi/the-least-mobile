import { ScrollView, StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import Item from './Item';

const DATA = [
  {
    title: 'Main dishes',
    data: ['Pizza', 'Burger', 'Risotto'],
  },
  {
    title: 'Sides',
    data: ['French Fries', 'Onion Rings', 'Fried Shrimps'],
  },
  {
    title: 'Drinks',
    data: ['Water', 'Coke', 'Beer'],
  },
  {
    title: 'Desserts',
    data: ['Cheese Cake', 'Ice Cream'],
  },
];

export default function Section() {
  return (
    <View>
      <ScrollView contentContainerStyle={styles.contentContainer}>
        {DATA.map((item, index) => (
          <Item title={item.title} />
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  contentContainer: {
    paddingVertical: 20,
  },
  container: {
    flex: 1,
    justifyContent: 'space-between',
    backgroundColor: colors.dark,
  },
});
