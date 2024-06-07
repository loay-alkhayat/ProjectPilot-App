import '../../../../domain/parameters/invitation_params/send_invite_to_supervisor_param.dart';
import '../../../models/invitation_models/send_invite_to_supervisor_model.dart';

abstract class SendInviteToSupervisorDataSource {
  Future<SendInviteToSupervisorModel> sendInviteToSuperVisor(
      SendInviteToSuperVisorParameters parameters);
}
