import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_tasks_entity.dart';
import '../../repositories/task_repos/get_tasks_repo.dart';

class GetTasksUseCase extends BaseUseCase<GetTasksEntity, GetTaskParameters> {
  final GetTasksRepository getTasksRepository;

  GetTasksUseCase(this.getTasksRepository);

  @override
  Future<Either<Failure, GetTasksEntity>> call(
      GetTaskParameters parameters) async {
    return await getTasksRepository.getTasks(parameters);
  }
}
