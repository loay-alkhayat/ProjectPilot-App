import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';
import '../../parameters/invitation_params/reject_student_join_request_param.dart';
import '../../repositories/invitation_repos/reject_student_join_request_repo.dart';

class RejectStudentJoinRequestUseCase extends BaseUseCase<
    ApproveAndRejectStudentJoinRequestEntity,
    RejectStudentJoinRequestParameters> {
  final RejectStudentJoinRequestRepository rejectStudentJoinRequestRepository;

  RejectStudentJoinRequestUseCase(this.rejectStudentJoinRequestRepository);

  @override
  Future<Either<Failure, ApproveAndRejectStudentJoinRequestEntity>> call(
      RejectStudentJoinRequestParameters parameters) async {
    return await rejectStudentJoinRequestRepository
        .rejectStudentJoinRequest(parameters);
  }
}
