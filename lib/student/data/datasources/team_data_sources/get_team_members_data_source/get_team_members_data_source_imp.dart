import 'package:dio/dio.dart';
import 'package:projectpilot/core/constants/apis_url.dart';
import 'package:projectpilot/core/errors/exceptions.dart';
import 'package:projectpilot/core/services/dio_services.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/get_team_members_data_source/get_team_members_data_source.dart';
import 'package:projectpilot/student/data/models/team_models/get_team_members_model.dart';

import '../../../../../core/functions/functions.dart';

class GetTeamMembersDataSourceImp implements GetTeamMembersDataSource {
  @override
  Future<GetTeamMembersModel> getTeamMembers(NoParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getTeamMembers,
      );
      logger.d(response.data);
      return GetTeamMembersModel.fromJson(response.data);
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
