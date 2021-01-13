import 'package:school/api/api.dart';
import 'package:school/tools/manager.dart';
import 'package:school/models/user_account_model.dart';
import 'package:dio/dio.dart';
import 'package:prefs/prefs.dart';

class AuthManager extends Manager {
  String get accessToken => Prefs.getString('accesstoken');
  String get role => Prefs.getString('role');
  String get userName => Prefs.getString('username');
  int get userId => Prefs.getInt('userid');
  String get userEmail => Prefs.getString('useremail');
  int get usertype => Prefs.getInt('userType');
  String get regNum => Prefs.getString('regNum');
  int get classId => Prefs.getInt('class_id');

  bool _deactivated = true;
  bool get deactivated => _deactivated;

  bool get isLoggedIn {
    if (accessToken != null && accessToken != "") {
      return true;
    } else {
      return false;
    }
  }

  Future login({String email, String password}) async {
    return api
        .login(email, password)
        .then(
          _onLoginResponse,
        )
        .catchError((error) {
      print('Error Occurred Loggin In : $error');
      throw error;
    });
  }

  _onLoginResponse(response) async {
    if (response.data['user'] == null) {
      throw DioError(response: response);
    }
    var payload = response.data;
    await authManager.setUserAccount(UserAccount.fromMap(payload));
  }

  Future<bool> setUserAccount(UserAccount useraccount) async {
    print('setting user up');
    return await Prefs?.setString('accesstoken', useraccount.accesstoken) &&
        await Prefs?.setString('username', useraccount.username) &&
        await Prefs?.setInt('userid', useraccount.userid) &&
        await Prefs?.setString('useremail', useraccount.email) &&
        await Prefs?.setInt('role', useraccount.userole) &&
        await Prefs?.setInt("usertype", useraccount.usertype) &&
        await Prefs?.setString('regNum', useraccount.regNum) &&
        await Prefs?.setInt('class_id', useraccount.classId);
  }

  Future<bool> logOut() async {
    return await Prefs.remove('accesstoken') &&
        await Prefs.remove('username') &&
        await Prefs.remove('userid') &&
        await Prefs.remove('useremail') &&
        await Prefs.remove('role');
  }
}

var authManager = AuthManager();
