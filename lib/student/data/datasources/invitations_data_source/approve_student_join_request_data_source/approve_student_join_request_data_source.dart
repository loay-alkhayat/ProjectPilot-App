import '../../../../domain/parameters/invitation_params/approve_student_join_request_param.dart';
import '../../../models/invitation_models/approve_and_reject_student_join_request_model.dart';

abstract class ApproveStudentJoinRequestDataSource {
  Future<AproveAndRejectStudentJoinRequestModel> approveStudentJoinRequest(
      ApproveStudentJoinRequestParameters parameters);
}
