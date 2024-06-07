import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/get_team_join_requests.dart';

abstract class GetTeamJoinRequestRepository {
  Future<Either<Failure, GetTeamJoinRequestEntity>> getTeamJoinRequest();
}
