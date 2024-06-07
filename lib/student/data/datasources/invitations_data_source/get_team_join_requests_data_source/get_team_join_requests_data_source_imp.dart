import 'package:dio/dio.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../../core/functions/functions.dart';
import '../../../models/invitation_models/get_team_join_requests_model.dart';
import 'get_team_join_requests_data_source.dart';

class GetTeamJoinRequestDataSourceImp implements GetTeamJoinRequestDataSource {
  @override
  Future<GetTeamJoinRequestModel> getTeamJoinRequest() async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getTeamJoinRequest,
      );
      logger.d(response.data);
      return GetTeamJoinRequestModel.fromJson(response.data);
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
