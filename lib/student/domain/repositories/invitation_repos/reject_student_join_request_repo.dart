import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';
import '../../parameters/invitation_params/reject_student_join_request_param.dart';

abstract class RejectStudentJoinRequestRepository {
  Future<Either<Failure, ApproveAndRejectStudentJoinRequestEntity>>
      rejectStudentJoinRequest(RejectStudentJoinRequestParameters parameters);
}
