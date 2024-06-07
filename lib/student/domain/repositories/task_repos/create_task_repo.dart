import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/task_entities/creat_task_entity.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';

import '../../../../core/errors/failures.dart';

abstract class CreateTaskRepository {
  Future<Either<Failure, CreateTaskEntity>> createTask(
      CreateTaskParameters parameters);
}
