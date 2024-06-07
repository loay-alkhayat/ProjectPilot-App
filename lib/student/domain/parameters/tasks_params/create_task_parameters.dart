class CreateTaskParameters {
  final String taskTitle;
  final String taskDescription;
  int? id;
  final int duration;

  CreateTaskParameters(
      {required this.taskTitle,
      required this.taskDescription,
      this.id,
      required this.duration});

  Map<String, dynamic> toJson() => {
        'title': taskTitle,
        'description': taskDescription,
        'id': id,
        'duration': duration
      };
}
