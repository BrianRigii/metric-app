import 'package:school/api/dio_api.dart';
import 'package:school/config.dart';

class Api extends DioApi {
  Api(String apiUrl) : super(apiUrl);

  Future login(email, password) {
    return dio.post('/api/login', data: {'email': email, 'password': password});
  }

  Future getUnits() {
    return dio.get('/api/units');
  }

  Future getTodaysClasses() {
    return dio.get('/api/todaysunits');
  }
}

var api = Api(config.apiUrl);
