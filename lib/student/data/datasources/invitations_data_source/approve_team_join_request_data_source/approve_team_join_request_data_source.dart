import '../../../../domain/parameters/invitation_params/approve_team_join_request_parameters.dart';
import '../../../models/invitation_models/approve_and_reject_team_join_request_model.dart';

abstract class ApproveTeamJoinRequestDataSource {
  Future<AproveAndRejectTeamJoinRequestModel> approveTeamJoinRequest(
      ApproveTeamJoinRequestParameters parameters);
}
