import '../../../../domain/parameters/tasks_params/create_sub_task_param.dart';
import '../../../models/task_models/create_sub_task_model.dart';

abstract class CreateSubTaskDataSuorce {
  Future<CreateSubTaskModel> createSubTask(CreateSubTaskParameters parameters);
}
