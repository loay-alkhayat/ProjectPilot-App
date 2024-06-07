import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';

import '../../../models/task_models/create_task_model.dart';

abstract class CreateTaskDataSuorce {
  Future<CreateTaskModel> createTask(CreateTaskParameters parameters);
}
