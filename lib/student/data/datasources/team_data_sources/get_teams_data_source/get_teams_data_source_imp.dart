import 'package:dio/dio.dart';
import 'package:projectpilot/student/domain/parameters/search_team_param.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../../core/functions/functions.dart';
import '../../../models/team_models/get_teams_model.dart';
import '../get_teams_data_source/get_teams_data_source.dart';

class GetTeamsDataSourceImp implements GetTeamsDataSource {
  @override
  Future<GetTeamsModel> getTeams(SearchTeamParameters parameters) async {
    try {
      final response = await DioServices()
          .get(url: ApiUrls.getTeams, data: parameters.toJson());
      logger.d(response.data);
      return GetTeamsModel.fromJson(response.data);
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
