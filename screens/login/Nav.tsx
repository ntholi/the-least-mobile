import {
  KeyboardAvoidingView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from 'react-native';
import colors from '../../components/ui/colors';

export default function Nav() {
  return (
    <View style={styles.nav}>
      <TouchableOpacity>
        <Text style={[styles.navText, styles.active]}>Sing In</Text>
      </TouchableOpacity>
      <TouchableOpacity>
        <Text style={styles.navText}>Sign Up</Text>
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
    color: colors.white,
    textTransform: 'uppercase',
    fontSize: 16,
    marginVertical: 15,
  },
  active: {
    borderBottomColor: colors.primary,
    borderWidth: 2,
  },
});
