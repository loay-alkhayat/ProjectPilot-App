import '../../../../domain/parameters/search_team_param.dart';
import '../../../models/team_models/get_teams_model.dart';

abstract class GetTeamsDataSource {
  Future<GetTeamsModel> getTeams(SearchTeamParameters parameters);
}
