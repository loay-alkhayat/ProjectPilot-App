import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/get_team_join_requests.dart';
import '../../repositories/invitation_repos/get_team_join_requests.dart';

class GetTeamJoinRequestUseCase
    extends BaseUseCase<GetTeamJoinRequestEntity, NoParameters> {
  final GetTeamJoinRequestRepository getTeamJoinRequestRepository;

  GetTeamJoinRequestUseCase(this.getTeamJoinRequestRepository);

  @override
  Future<Either<Failure, GetTeamJoinRequestEntity>> call(parameters) async {
    return await getTeamJoinRequestRepository.getTeamJoinRequest();
  }
}
