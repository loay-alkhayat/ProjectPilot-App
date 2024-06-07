import 'package:projectpilot/student/data/models/task_models/get_tasks_model.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';

abstract class GetTasksDataSource {
  Future<GetTasksModel> getTasks(GetTaskParameters parameters);
}
