import '../../../../domain/parameters/tasks_params/get_task_by_id_param.dart';
import '../../../models/task_models/get_task_by_id_model.dart';

abstract class GetTaskByIdDataSource {
  Future<GetTaskByIdModel> getTaskById(GetTaskByIDParameters parameters);
}
