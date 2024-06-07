import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../entities/task_entities/create_sub_task_entity.dart';
import '../../parameters/tasks_params/create_sub_task_param.dart';
import '../../repositories/task_repos/create_sub_task_repo.dart';

class CreateSubTaskUseCase
    extends BaseUseCase<CreateSubTaskEntity, CreateSubTaskParameters> {
  final CreateSubTaskRepository createSubTaskRepository;

  CreateSubTaskUseCase(this.createSubTaskRepository);

  @override
  Future<Either<Failure, CreateSubTaskEntity>> call(
      CreateSubTaskParameters parameters) async {
    return await createSubTaskRepository.createSubTask(parameters);
  }
}
