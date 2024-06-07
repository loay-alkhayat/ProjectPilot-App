import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_student_tasks_entity.dart';

abstract class GetStudentTasksRepository {
  Future<Either<Failure, GetStudentTasksEntity>> getStudentTasks(
      NoParameters parameters);
}
