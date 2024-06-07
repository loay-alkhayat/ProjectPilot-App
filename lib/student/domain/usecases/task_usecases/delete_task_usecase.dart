import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/repositories/task_repos/delete_task_repo.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/task_entities/delete_task_entity.dart';
import '../../parameters/tasks_params/delete_task_param.dart';

class DeleteTaskUseCase
    extends BaseUseCase<DeleteTaskEntity, DeleteTaskParameters> {
  final DeleteTaskRepository deleteTaskRepository;

  DeleteTaskUseCase(this.deleteTaskRepository);

  @override
  Future<Either<Failure, DeleteTaskEntity>> call(
      DeleteTaskParameters parameters) async {
    return await deleteTaskRepository.deleteTask(parameters);
  }
}
