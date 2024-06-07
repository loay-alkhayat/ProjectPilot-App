import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_supervisor_entity.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';
import 'package:projectpilot/student/domain/repositories/supervisors_repos/get_supervisor_repository.dart';

import '../../../../../../core/errors/failures.dart';

class SupervisorsUseCase
    extends BaseUseCase<SupervisorEntity, SearchSupervisorsParameters> {
  final SupervisorRepository supervisorRepository;

  SupervisorsUseCase(this.supervisorRepository);

  @override
  Future<Either<Failure, SupervisorEntity>> call(parameters) async {
    return await supervisorRepository.getSupervisors(parameters);
  }
}
