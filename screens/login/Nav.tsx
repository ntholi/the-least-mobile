import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import colors from '../utils/colors';

type Props = {
  showSignup: boolean;
  setShowSignup: (showSignup: boolean) => void;
};

export default function Nav({ showSignup, setShowSignup }: Props) {
  return (
    <View style={styles.nav}>
      <TouchableOpacity onPress={() => setShowSignup(false)}>
        <Text style={[styles.navText, !showSignup && styles.active]}>
          Sing In
        </Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={() => setShowSignup(true)}>
        <Text style={[styles.navText, showSignup && styles.active]}>
          Sign Up
        </Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  nav: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '60%',
  },
  navText: {
    color: colors.light,
    textTransform: 'uppercase',
    fontSize: 16,
    marginVertical: 15,
  },
  active: {
    borderBottomColor: colors.primary,
    borderBottomWidth: 2,
  },
});
