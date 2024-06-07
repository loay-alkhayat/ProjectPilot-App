import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/task_entities/delete_task_entity.dart';
import '../../parameters/tasks_params/delete_task_param.dart';

abstract class DeleteTaskRepository {
  Future<Either<Failure, DeleteTaskEntity>> deleteTask(
      DeleteTaskParameters parameters);
}
