import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';
import '../../parameters/invitation_params/approve_team_join_request_parameters.dart';

abstract class ApproveTeamJoinRequestRepository {
  Future<Either<Failure, ApproveAndRejectTeamJoinRequestEntity>>
      approveTeamJoinRequest(ApproveTeamJoinRequestParameters parameters);
}
