import 'package:school/helpers/student_home_manager.dart';
import 'package:school/tools/bloc_provider.dart';

class StudentHomeBloc extends Bloc {
  @override
  void initState() {
    super.initState();
    studentHomeManager.loadUnits().then((response) {
      showToast("Found SomeUnits sire");
    });

    studentHomeManager.loadTodaysClasses().catchError((error) {
      showToast('couldnt find todays classes');
    });
  }
}
