import 'package:school/api/api.dart';
import 'package:school/models/unit_model.dart';
import 'package:school/tools/manager.dart';

class StudentHomeManager extends Manager {
  static StudentHomeManager instance;
  factory StudentHomeManager() => instance ??= StudentHomeManager._instance();
  StudentHomeManager._instance();

  List<UnitModel> units = [];
  List<UnitModel> todaysClasses = [];

  bool _isloadingUnits = false;
  bool get isloadingUnits => _isloadingUnits;

  set setloadUnits(bool val) {
    _isloadingUnits = val;
    notifyChanges();
  }

  Future loadUnits() {
    setloadUnits = true;
    print('fetching units');
    return api.getUnits().then((response) {
      var payload = response.data;
      units = [];
      saveUnits(payload);
    }).catchError((error) {
      print('Error occured while loading Units $error');
      throw error;
    });
  }

  void saveUnits(payload) {
    payload.forEach((unit) {
      units.add(UnitModel.fromMap(unit));
      setloadUnits = false;
    });
  }

  Future loadTodaysClasses() {
    return api.getTodaysClasses().then((response) {
      var payload = response.data;
      todaysClasses = [];
      saveTodaysClasses(payload);
    }).catchError((error) {
      print(error);
      throw error;
    });
  }

  saveTodaysClasses(payload) {
    payload.forEach((unit) {
      print(unit);
      todaysClasses.add(UnitModel.fromMap(unit));
      print('todays classes saved');
    });
  }
}

var studentHomeManager = StudentHomeManager();
