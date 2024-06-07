import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/team_entities/create_team_entity.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/create_team_repository.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';

class CreateTeamUseCase
    extends BaseUseCase<CreateTeamEntity, CreateTeamParameters> {
  final CreatTeamRepository creatTeamRepository;

  CreateTeamUseCase(this.creatTeamRepository);

  @override
  Future<Either<Failure, CreateTeamEntity>> call(
      CreateTeamParameters parameters) async {
    return await creatTeamRepository.createTeam(parameters);
  }
}
