class UnitModel {
  final String name;
  final String code;
  final String room;
  final String nextClass;
  final DateTime nextCat;
  final DateTime examDate;
  final String lecturer;
  final String courseName;

  UnitModel(
      {this.name,
      this.code,
      this.room,
      this.nextClass,
      this.nextCat,
      this.examDate,
      this.lecturer,
      this.courseName});

  factory UnitModel.fromMap(payload) {
    return UnitModel(
        code: payload['code'],
        name: payload['name'],
        courseName: payload['course']['name'],
        examDate: payload['exam_date'],
        lecturer: payload['lecturer']['name'],
        room: payload['room'],
        nextCat: payload['next_cat'],
        nextClass: payload['next_class']);
  }
}
