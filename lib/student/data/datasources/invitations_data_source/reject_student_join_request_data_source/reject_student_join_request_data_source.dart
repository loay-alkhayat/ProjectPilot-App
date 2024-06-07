import '../../../../domain/parameters/invitation_params/reject_student_join_request_param.dart';
import '../../../models/invitation_models/approve_and_reject_student_join_request_model.dart';

abstract class RejectStudentJoinRequestDataSource {
  Future<AproveAndRejectStudentJoinRequestModel> rejectStudentJoinRequest(
      RejectStudentJoinRequestParameters parameters);
}
