import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_tasks_entity.dart';

abstract class GetTasksRepository {
  Future<Either<Failure, GetTasksEntity>> getTasks(
      GetTaskParameters parameters);
}
