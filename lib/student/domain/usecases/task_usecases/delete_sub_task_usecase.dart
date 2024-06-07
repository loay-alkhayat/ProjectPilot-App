import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../entities/task_entities/delete_sub_task_entity.dart';
import '../../parameters/tasks_params/delete_sub_task_param.dart';
import '../../repositories/task_repos/delete_sub_task_repo.dart';

class DeleteSubTaskUseCase
    extends BaseUseCase<DeleteSubTaskEntity, DeleteSubTaskParameters> {
  final DeleteSubTaskRepository deleteSubTaskRepository;

  DeleteSubTaskUseCase(this.deleteSubTaskRepository);

  @override
  Future<Either<Failure, DeleteSubTaskEntity>> call(
      DeleteSubTaskParameters parameters) async {
    return await deleteSubTaskRepository.deleteSubTask(parameters);
  }
}
