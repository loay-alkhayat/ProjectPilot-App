import 'package:projectpilot/student/data/models/team_models/create_team_model.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';

abstract class CreateTeamDataSource {
  Future<CreateTeamModel> createTeam(CreateTeamParameters parameters);
}
