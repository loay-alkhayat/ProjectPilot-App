import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/send_join_team_request_entity.dart';
import '../../parameters/send_join_request_param.dart';

abstract class SendJoinRequestRepository {
  Future<Either<Failure, SendJoinRequestEntity>> sendJoinRequest(
      SendJoinRequestParameters parameters);
}
