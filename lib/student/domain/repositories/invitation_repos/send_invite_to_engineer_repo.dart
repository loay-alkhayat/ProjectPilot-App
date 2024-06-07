import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/send_invite_to_engineer_entity.dart';
import '../../parameters/invitation_params/send_invite_to_engineer_param.dart';

abstract class SendInviteToEngineerRepository {
  Future<Either<Failure, SendInviteToEngineerEntity>> sendInviteToEngineer(
      SendInviteToEngineerParameters parameters);
}
