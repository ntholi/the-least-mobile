import { StyleSheet, Text, View } from 'react-native';
import React from 'react';
import colors from '../../utils/colors';
import { money } from '../../../components/utils/format';

type Props = {
  donated: number;
  target: number;
};

export default function Progress({ donated, target }: Props) {
  const percent = (donated / target) * 100;
  return (
    <View style={styles().container}>
      <View style={styles(percent ?? 1).progressBar}>
        <View style={styles(percent ?? 1).progress} />
      </View>
      <View style={styles().goal}>
        <View>
          <Text style={[{ color: colors.primary200 }]}>{money(0)}</Text>
          <Text style={styles().moneyLabel}>Donated</Text>
        </View>
        <View>
          <Text style={[{ color: '#B0BEC5' }]}>{money(0)}</Text>
          <Text style={[styles().moneyLabel]}>Target</Text>
        </View>
      </View>
    </View>
  );
}

const styles = (percent?: number) =>
  StyleSheet.create({
    container: {
      marginTop: 10,
    },
    progressBar: {
      height: 10,
      width: '100%',
      borderRadius: 3,
      backgroundColor: '#424242',
    },
    progress: {
      width: `${percent}%`,
      height: '99%',
      borderRadius: 3,
      backgroundColor: colors.primary,
    },
    goal: {
      flexDirection: 'row',
      justifyContent: 'space-between',
      marginTop: 10,
    },
    moneyLabel: {
      color: colors.dim,
      fontSize: 10,
    },
  });
