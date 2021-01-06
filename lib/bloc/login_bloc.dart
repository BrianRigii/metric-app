import 'package:school/helpers/auth_manager.dart';
import 'package:school/tools/bloc_provider.dart';
import 'package:school/ui/screens/splash_screen.dart';

class LoginBloc extends Bloc {
  void login({email, password}) {
    authManager.login(email: email, password: password).then((value) {
      print(authManager.isLoggedIn);
      popAndNavigate(screen: SplashScreen());
    });
  }
}
