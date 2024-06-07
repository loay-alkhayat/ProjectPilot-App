import 'package:projectpilot/student/data/models/invitation_models/send_invite_model.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_student_parameters.dart';

abstract class SendInviteDataSource {
  Future<SendInviteModel> sendInvite(SendInviteParameters parameters);
}
