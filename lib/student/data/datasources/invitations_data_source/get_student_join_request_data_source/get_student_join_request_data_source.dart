import '../../../models/invitation_models/get_student_join_request_model.dart';

abstract class GetStudentJoinRequestDataSource {
  Future<GetStudentJoinRequestModel> getStudentJoinRequest();
}
