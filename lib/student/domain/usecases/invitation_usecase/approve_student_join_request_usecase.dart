import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';
import '../../parameters/invitation_params/approve_student_join_request_param.dart';
import '../../repositories/invitation_repos/approve_student_join_request_repo.dart';

class ApproveStudentJoinRequestUseCase extends BaseUseCase<
    ApproveAndRejectStudentJoinRequestEntity,
    ApproveStudentJoinRequestParameters> {
  final ApproveStudentJoinRequestRepository approveStudentJoinRequestRepository;

  ApproveStudentJoinRequestUseCase(this.approveStudentJoinRequestRepository);

  @override
  Future<Either<Failure, ApproveAndRejectStudentJoinRequestEntity>> call(
      ApproveStudentJoinRequestParameters parameters) async {
    return await approveStudentJoinRequestRepository
        .approveStudentJoinRequest(parameters);
  }
}
