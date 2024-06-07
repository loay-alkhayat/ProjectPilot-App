import '../../../../domain/parameters/tasks_params/delete_sub_task_param.dart';
import '../../../models/task_models/delete_sub_task_model.dart';

abstract class DeleteSubTaskDataSuorce {
  Future<DeleteSubTaskModel> deleteSubTask(DeleteSubTaskParameters parameters);
}
