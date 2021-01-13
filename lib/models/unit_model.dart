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

  factory UnitModel.fromMap(unit) {
    return UnitModel(
        code: unit['code'],
        name: unit['name'],
        courseName: unit['course']['name'],
        examDate: unit['exam_date'],
        lecturer: unit['lecturer']['name'],
        room: unit['room'],
        nextCat: unit['next_cat'],
        nextClass: unit['next_class']);
  }
}
