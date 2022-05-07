import { FlatList, RefreshControl, StyleSheet } from 'react-native';
import React, { useEffect, useState } from 'react';
import colors from '../../utils/colors';
import Item from './Item';
import { getHouses } from '../../../components/house/house-service';
import { House } from '../../../components/house/house';
import LoadingScreen from '../../utils/LoadingScreen';
import { NavigationProp, ParamListBase } from '@react-navigation/native';

type Props = {
  navigation: NavigationProp<ParamListBase>;
};

// const wait = (timeout: number) => {
//   return new Promise((resolve) => setTimeout(resolve, timeout));
// };

export default function Section({ navigation }: Props) {
  const [houses, setHouses] = useState<House[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = React.useState(false);

  // const onRefresh = React.useCallback(() => {
  //   setRefreshing(true);
  //   wait(2000).then(() => setRefreshing(false));
  // }, []);

  function renderItem({ item }: { item: House }) {
    return <Item house={item} navigation={navigation} />;
  }

  const refreshControl = (
    <RefreshControl
      refreshing={refreshing}
      onRefresh={() => setRefreshing(true)}
    />
  );

  useEffect(() => {
    getHouses()
      .then(setHouses)
      .finally(() => {
        setLoading(false);
        setRefreshing(false);
      });
  }, [refreshing]);

  if (loading) {
    return <LoadingScreen />;
  }

  return (
    <FlatList
      contentContainerStyle={styles.contentContainer}
      data={houses}
      renderItem={renderItem}
      keyExtractor={(item) => item.id}
      refreshControl={refreshControl}
    />
  );
}

const styles = StyleSheet.create({
  contentContainer: {
    paddingVertical: 20,
    paddingHorizontal: 20,
  },
  container: {
    flex: 1,
    justifyContent: 'space-between',
    backgroundColor: colors.dark,
  },
});
