import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_task_by_id_entity.dart';
import '../../parameters/tasks_params/get_task_by_id_param.dart';

abstract class GetTaskByIdRepository {
  Future<Either<Failure, GetTaskByIdEntity>> getTaskById(
      GetTaskByIDParameters parameters);
}
