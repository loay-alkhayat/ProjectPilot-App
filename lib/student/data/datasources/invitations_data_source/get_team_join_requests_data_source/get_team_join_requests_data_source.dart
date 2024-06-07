import '../../../models/invitation_models/get_team_join_requests_model.dart';

abstract class GetTeamJoinRequestDataSource {
  Future<GetTeamJoinRequestModel> getTeamJoinRequest();
}
