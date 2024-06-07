import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/team_entities/get_teams_entity.dart';
import '../../parameters/search_team_param.dart';
import '../../repositories/team_repos/get_teams_repo.dart';

class GetTeamsUseCase
    extends BaseUseCase<GetTeamsEntity, SearchTeamParameters> {
  final GetTeamsRepository getTeamsRepository;

  GetTeamsUseCase(this.getTeamsRepository);

  @override
  Future<Either<Failure, GetTeamsEntity>> call(
      SearchTeamParameters parameters) async {
    return await getTeamsRepository.getTeams(parameters);
  }
}
