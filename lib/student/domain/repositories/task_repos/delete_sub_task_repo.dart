import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/task_entities/delete_sub_task_entity.dart';
import '../../parameters/tasks_params/delete_sub_task_param.dart';

abstract class DeleteSubTaskRepository {
  Future<Either<Failure, DeleteSubTaskEntity>> deleteSubTask(
      DeleteSubTaskParameters parameters);
}
