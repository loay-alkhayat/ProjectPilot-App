import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../models/task_models/get_student_tasks_model.dart';

abstract class GetStudentTasksDataSource {
  Future<GetStudentTasksModel> getStudentTasks(NoParameters parameters);
}
