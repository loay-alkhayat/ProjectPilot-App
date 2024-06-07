import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/reject_team_join_request_data_source/reject_team_join_request_data_source.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/invitation_params/reject_team_join_request_parameters.dart';
import '../../../models/invitation_models/approve_and_reject_team_join_request_model.dart';

class RejectTeamJoinRequestDataSourceImp
    implements RejectTeamJoinRequestDataSource {
  @override
  Future<AproveAndRejectTeamJoinRequestModel> rejectTeamJoinRequest(
      RejectTeamJoinRequestParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.rejectStudentInTeamRequest,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return AproveAndRejectTeamJoinRequestModel.fromJson(response.data);
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
