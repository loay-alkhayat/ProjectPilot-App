import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_student_tasks_entity.dart';
import '../../repositories/task_repos/get_student_tasks_repo.dart';

class GetStudentTasksUseCase
    extends BaseUseCase<GetStudentTasksEntity, NoParameters> {
  final GetStudentTasksRepository getStudentTasksRepository;

  GetStudentTasksUseCase(this.getStudentTasksRepository);

  @override
  Future<Either<Failure, GetStudentTasksEntity>> call(parameters) async {
    return await getStudentTasksRepository.getStudentTasks(parameters);
  }
}
