import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/models/team_models/create_team_model.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../../core/functions/functions.dart';
import 'creat_team_data_source.dart';

class CreatTeamDataSourceImp implements CreateTeamDataSource {
  @override
  Future<CreateTeamModel> createTeam(CreateTeamParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.createTeam,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return CreateTeamModel.fromJson(response.data);
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
