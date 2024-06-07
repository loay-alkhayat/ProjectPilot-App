import '../../../../domain/parameters/tasks_params/complete_sub_task_param.dart';
import '../../../models/task_models/complete_sub_task_model.dart';

abstract class CompleteSubTaskDataSuorce {
  Future<CompleteSubTaskModel> completeSubTask(
      CompleteSubTaskParameters parameters);
}
