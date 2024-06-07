class CreateSubTaskParameters {
  final String subTaskTitle;
  final String subTaskDescription;
  final int taskID;
  final int studentID;
  final int durationOftask;

  CreateSubTaskParameters(
      {required this.subTaskTitle,
      required this.taskID,
      required this.studentID,
      required this.durationOftask,
      required this.subTaskDescription});

  Map<String, dynamic> toJson() => {
        'title': subTaskTitle,
        'description': subTaskDescription,
        'task_id': taskID,
        'student_id': studentID,
        'duration': durationOftask,
      };
}
