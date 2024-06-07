import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/send_invite_to_supervisor_entity.dart';
import '../../parameters/invitation_params/send_invite_to_supervisor_param.dart';

abstract class SendInviteToSupervisorRepository {
  Future<Either<Failure, SendInviteToSuperVisorEntity>> sendInviteToSuperVisor(
      SendInviteToSuperVisorParameters parameters);
}
