import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/get_team_by_id_data_source/get_team_by_id_data_source.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/get_team_by_id_param.dart';
import '../../../models/team_models/get_team_by_id_model.dart';

class GetTeamByIdDataSourceImp implements GetTeamByIdDataSource {
  @override
  Future<GetTeamByIdModel> getTeamById(GetTeamByIdParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: "${ApiUrls.getTeamById}${parameters.teamID}",
      );
      logger.d(response.data);
      return GetTeamByIdModel.fromJson(response.data);
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
