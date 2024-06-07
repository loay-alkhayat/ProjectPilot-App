import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/task_entities/complete_sub_task_entity.dart';
import '../../parameters/tasks_params/complete_sub_task_param.dart';

abstract class CompleteSubTaskRepository {
  Future<Either<Failure, CompleteSubTaskEntity>> completeSubTask(
      CompleteSubTaskParameters parameters);
}
