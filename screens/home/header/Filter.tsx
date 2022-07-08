import {
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { NavigationProp, ParamListBase } from '@react-navigation/native';
import { FontAwesome5 } from '@expo/vector-icons';
import colors from '../../utils/colors';

type Props = {
  navigation: NavigationProp<ParamListBase>;
};

export default function Filter({ navigation }: Props) {
  return (
    <ScrollView style={styles.container} horizontal={true}>
      <TouchableOpacity
        style={styles.donateBtn}
        onPress={() => navigation.navigate('Donate')}
      >
        <FontAwesome5 name='money-bill' size={18} color='white' />
        <Text style={[styles.buttonText, { marginLeft: 6 }]}>Donate</Text>
      </TouchableOpacity>
      <View style={styles.line} />
      <TouchableOpacity style={[styles.button, styles.activeButton]}>
        <Text style={[styles.buttonText, styles.activeText]}>All</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Favorites</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Near You</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Critical</Text>
      </TouchableOpacity>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    marginTop: 30,
  },
  line: {
    borderEndWidth: 1,
    borderColor: '#555',
    marginRight: 10,
  },
  donateBtn: {
    flexDirection: 'row',
    paddingVertical: 10,
    paddingHorizontal: 15,
    backgroundColor: '#333',
    borderRadius: 5,
    marginRight: 10,
  },
  button: {
    paddingVertical: 9,
    paddingHorizontal: 14,
    borderColor: colors.light,
    borderWidth: 1,
    borderRadius: 20,
    marginRight: 10,
  },
  buttonText: {
    color: colors.light,
    fontSize: 13,
  },
  activeButton: {
    backgroundColor: colors.light,
  },
  activeText: {
    color: colors.darker,
  },
});
