import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/models/invitation_models/send_join_request_model.dart';
import 'package:projectpilot/student/domain/parameters/send_join_request_param.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import 'send_join_request_data_source.dart';

class SendJoinRequestDataSourceImp implements SendJoinRequestDataSource {
  @override
  Future<SendJoinRequestModel> sendJoinRequest(
      SendJoinRequestParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.sendJoinRequestToTeam,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return SendJoinRequestModel.fromJson(response.data);
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
