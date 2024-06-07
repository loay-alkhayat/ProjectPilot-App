import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/send_invite_to_engineer_data_source/send_invite_to_engineer_data_source.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/invitation_params/send_invite_to_engineer_param.dart';
import '../../../models/invitation_models/send_invite_to_engineer_model.dart';

class SendInviteToEngineerDataSourceImp
    implements SendInviteToEngineerDataSource {
  @override
  Future<SendInviteToEngineerModel> sendInviteToEngineer(
      SendInviteToEngineerParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.sendInvitationFromLeaderToEngineer,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return SendInviteToEngineerModel.fromJson(response.data);
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
