import 'package:school/helpers/auth_manager.dart';
import 'package:school/tools/bloc_provider.dart';
import 'package:school/ui/screens/login_screen.dart';
import 'package:school/ui/widgets/app_drawer.dart';

class AppDrawerBloc extends Bloc {
  void logOutBtnFunc() {
    popAndNavigate(screen: LoginScreen());
    authManager.logOut();
  }
}
