import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';
import '../../parameters/invitation_params/approve_team_join_request_parameters.dart';
import '../../repositories/invitation_repos/approve_team_join_request_repository.dart';

class ApproveTeamJoinRequestUseCase extends BaseUseCase<
    ApproveAndRejectTeamJoinRequestEntity, ApproveTeamJoinRequestParameters> {
  final ApproveTeamJoinRequestRepository approveTeamJoinRequestRepository;

  ApproveTeamJoinRequestUseCase(this.approveTeamJoinRequestRepository);

  @override
  Future<Either<Failure, ApproveAndRejectTeamJoinRequestEntity>> call(
      ApproveTeamJoinRequestParameters parameters) async {
    return await approveTeamJoinRequestRepository
        .approveTeamJoinRequest(parameters);
  }
}
