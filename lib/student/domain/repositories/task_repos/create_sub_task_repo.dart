import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/task_entities/create_sub_task_entity.dart';
import '../../parameters/tasks_params/create_sub_task_param.dart';

abstract class CreateSubTaskRepository {
  Future<Either<Failure, CreateSubTaskEntity>> createSubTask(
      CreateSubTaskParameters parameters);
}
