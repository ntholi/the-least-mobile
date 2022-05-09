import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { House } from '../../../components/house/house';
import { MaterialIcons, MaterialCommunityIcons } from '@expo/vector-icons';
import { NavigationProp, ParamListBase } from '@react-navigation/native';
import { LinearGradient } from 'expo-linear-gradient';
import Progress from './Progress';

type Props = {
  house: House;
  navigation: NavigationProp<ParamListBase>;
};

export default function Item({ house, navigation }: Props) {
  function handlePress() {
    navigation.navigate('House', { house });
  }

  return (
    <TouchableOpacity onPress={handlePress}>
      <LinearGradient style={styles.container} colors={['#212121', '#212121']}>
        <View style={styles.icon}>
          <MaterialCommunityIcons
            name='folder-home-outline'
            size={40}
            color={getColor()}
          />
        </View>
        <View style={styles.content}>
          <View>
            <Text style={styles.title}>{house.name}</Text>
            <View style={styles.location}>
              <MaterialIcons
                name='location-on'
                size={15}
                color={colors.light}
              />
              <Text style={styles.locationText}>{house.address}</Text>
            </View>
          </View>
          <Progress donated={house.donated} target={house.target} />
        </View>
      </LinearGradient>
    </TouchableOpacity>
  );
}

const getColor = () => {
  const colorList = ['#CFD8DC'];
  const random = Math.floor(Math.random() * colorList.length);
  return colorList[random];
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    marginVertical: 8,
    backgroundColor: colors.overlay,
    borderRadius: 10,
    elevation: 5,
  },
  icon: {
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 20,
    backgroundColor: '#191919',
  },
  content: {
    flex: 1,
    padding: 20,
    paddingTop: 10,
    justifyContent: 'space-between',
  },
  title: {
    color: colors.light,
    fontSize: 18,
    letterSpacing: 1,
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
});
