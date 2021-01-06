import 'package:prefs/prefs.dart';
import 'package:school/helpers/auth_manager.dart';
import 'package:school/tools/bloc_provider.dart';
import 'package:school/ui/screens/login_screen.dart';

import 'package:school/ui/screens/student_home.dart';
import 'package:school/ui/widgets/tabscreen.dart';

class SplashScreenBloc extends Bloc {
  void initializeManagers() async {
    await Prefs.init();
    authManager.init();
    loginscreencheck();

    if (authManager.isLoggedIn) {}
  }

  void initState() {
    super.initState();
    print('initstate');
    initializeManagers();
  }

  void loginscreencheck() {
    print('checking screens');
    if (authManager.isLoggedIn) {
      popAndNavigate(screen: TabScreen());
    } else {
      popAndNavigate(screen: LoginScreen());
    }
  }

  void logout() {
    authManager.logOut();
    popAndNavigate(screen: LoginScreen());
    showToast('Logged Out');
  }
}
