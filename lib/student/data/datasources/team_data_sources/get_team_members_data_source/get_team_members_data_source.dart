import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/data/models/team_models/get_team_members_model.dart';

abstract class GetTeamMembersDataSource {
  Future<GetTeamMembersModel> getTeamMembers(NoParameters parameters);
}
