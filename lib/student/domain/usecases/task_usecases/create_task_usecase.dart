import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/task_entities/creat_task_entity.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';
import 'package:projectpilot/student/domain/repositories/task_repos/create_task_repo.dart';

class CreateTaskUseCase
    extends BaseUseCase<CreateTaskEntity, CreateTaskParameters> {
  final CreateTaskRepository createTaskRepository;

  CreateTaskUseCase(this.createTaskRepository);

  @override
  Future<Either<Failure, CreateTaskEntity>> call(
      CreateTaskParameters parameters) async {
    return await createTaskRepository.createTask(parameters);
  }
}
