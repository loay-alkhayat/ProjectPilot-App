import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/task_entities/get_task_by_id_entity.dart';
import '../../parameters/tasks_params/get_task_by_id_param.dart';
import '../../repositories/task_repos/get_task_by_id_repo.dart';

class GetTaskByIdUseCase
    extends BaseUseCase<GetTaskByIdEntity, GetTaskByIDParameters> {
  final GetTaskByIdRepository getTaskByIdRepository;

  GetTaskByIdUseCase(this.getTaskByIdRepository);

  @override
  Future<Either<Failure, GetTaskByIdEntity>> call(
      GetTaskByIDParameters parameters) async {
    return await getTaskByIdRepository.getTaskById(parameters);
  }
}
