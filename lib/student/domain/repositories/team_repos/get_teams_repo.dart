import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/team_entities/get_teams_entity.dart';
import '../../parameters/search_team_param.dart';

abstract class GetTeamsRepository {
  Future<Either<Failure, GetTeamsEntity>> getTeams(
      SearchTeamParameters parameters);
}
