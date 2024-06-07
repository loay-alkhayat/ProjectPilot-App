import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/send_invite_to_supervisor_data_source/send_invite_to_supervisor_data_source.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/invitation_params/send_invite_to_supervisor_param.dart';
import '../../../models/invitation_models/send_invite_to_supervisor_model.dart';

class SendInviteToSupervisorDataSourceImp
    implements SendInviteToSupervisorDataSource {
  @override
  Future<SendInviteToSupervisorModel> sendInviteToSuperVisor(
      SendInviteToSuperVisorParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.sendInvitationFromLeaderToSupervisor,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return SendInviteToSupervisorModel.fromJson(response.data);
    } on DioException catch (error) {
      logger.d(
          "==================== Dio Exception ====================== \n ${error.toString()} \n ${error.response?.data}");
      throw Functions.exceptionsType(error);
    } catch (error) {
      logger.d(
          "================== Exception ======================  \n ${error.toString()} \n ${error.runtimeType}");
      if (error is TypeError) {
        throw ParsingException(parsingMessage: error.toString());
      }
      rethrow;
    }
  }
}
