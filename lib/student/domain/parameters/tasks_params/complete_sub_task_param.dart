class CompleteSubTaskParameters {
  final int subTaskID;

  CompleteSubTaskParameters({required this.subTaskID});

  Map<String, dynamic> toJson() => {
        'subtask_id': subTaskID,
      };
}
