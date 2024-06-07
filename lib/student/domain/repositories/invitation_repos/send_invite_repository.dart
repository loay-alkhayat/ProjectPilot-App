import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_from_leader_entity.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_student_parameters.dart';

import '../../../../../../core/errors/failures.dart';

abstract class SendInviteRepository {
  Future<Either<Failure, SendInviteEntity>> sendInvite(
      SendInviteParameters parameters);
}
