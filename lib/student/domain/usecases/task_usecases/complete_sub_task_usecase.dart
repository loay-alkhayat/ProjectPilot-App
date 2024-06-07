import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../entities/task_entities/complete_sub_task_entity.dart';
import '../../parameters/tasks_params/complete_sub_task_param.dart';
import '../../repositories/task_repos/complete_sub_task_repo.dart';

class CompleteSubTaskUseCase
    extends BaseUseCase<CompleteSubTaskEntity, CompleteSubTaskParameters> {
  final CompleteSubTaskRepository completeSubTaskRepository;

  CompleteSubTaskUseCase(this.completeSubTaskRepository);

  @override
  Future<Either<Failure, CompleteSubTaskEntity>> call(
      CompleteSubTaskParameters parameters) async {
    return await completeSubTaskRepository.completeSubTask(parameters);
  }
}
