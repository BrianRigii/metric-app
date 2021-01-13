class TaskModel {
  final String description;
  final String dueDate;
  final int status;
  final String createdAt;
  final String type;

  TaskModel(
      this.description, this.dueDate, this.status, this.createdAt, this.type);

  factory TaskModel.fromMap(task) => TaskModel(task["description"],
      task["due_date"], task['status'], task['created_at'], task['type']);
}
