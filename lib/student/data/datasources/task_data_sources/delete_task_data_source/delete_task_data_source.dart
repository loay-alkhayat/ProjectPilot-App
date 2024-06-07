import '../../../../domain/parameters/tasks_params/delete_task_param.dart';
import '../../../models/task_models/delete_task_model.dart';

abstract class DeleteTaskDataSource {
  Future<DeleteTaskModel> deleteTask(DeleteTaskParameters parameters);
}
