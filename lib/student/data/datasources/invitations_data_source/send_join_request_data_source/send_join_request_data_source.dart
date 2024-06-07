import '../../../../domain/parameters/send_join_request_param.dart';
import '../../../models/invitation_models/send_join_request_model.dart';

abstract class SendJoinRequestDataSource {
  Future<SendJoinRequestModel> sendJoinRequest(
      SendJoinRequestParameters parameters);
}
