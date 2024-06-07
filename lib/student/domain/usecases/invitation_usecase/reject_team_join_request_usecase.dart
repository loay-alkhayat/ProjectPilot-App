import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';
import '../../parameters/invitation_params/reject_team_join_request_parameters.dart';
import '../../repositories/invitation_repos/reject_team_join_request_repository.dart';

class RejectTeamJoinRequestUseCase extends BaseUseCase<
    ApproveAndRejectTeamJoinRequestEntity, RejectTeamJoinRequestParameters> {
  final RejectTeamJoinRequestRepository rejectTeamJoinRequestRepository;

  RejectTeamJoinRequestUseCase(this.rejectTeamJoinRequestRepository);

  @override
  Future<Either<Failure, ApproveAndRejectTeamJoinRequestEntity>> call(
      RejectTeamJoinRequestParameters parameters) async {
    return await rejectTeamJoinRequestRepository
        .rejectTeamJoinRequest(parameters);
  }
}
