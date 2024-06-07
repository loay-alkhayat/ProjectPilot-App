import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_engineer_entity.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../parameters/search_engineers_param.dart';
import '../../repositories/supervisors_repos/get_engineer_repository.dart';

class EngineersUseCase
    extends BaseUseCase<EngineerEntity, SearchEngineersParameters> {
  final EngineerRepository engineerRepository;

  EngineersUseCase(this.engineerRepository);

  @override
  Future<Either<Failure, EngineerEntity>> call(parameters) async {
    return await engineerRepository.getEngineers(parameters);
  }
}
