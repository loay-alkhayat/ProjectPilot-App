import '../../../../domain/parameters/invitation_params/send_invite_to_engineer_param.dart';
import '../../../models/invitation_models/send_invite_to_engineer_model.dart';

abstract class SendInviteToEngineerDataSource {
  Future<SendInviteToEngineerModel> sendInviteToEngineer(
      SendInviteToEngineerParameters parameters);
}
