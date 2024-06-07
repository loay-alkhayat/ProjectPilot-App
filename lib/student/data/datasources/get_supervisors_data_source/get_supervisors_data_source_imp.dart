import 'package:dio/dio.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';

import '../../../../core/constants/apis_url.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/services/dio_services.dart';
import '../../models/supervisors_models/supervisor_model.dart';
import 'get_supervisors_data_source.dart';

class SupervisorDataSourceImp implements SupervisorDataSource {
  @override
  Future<SupervisorModel> getSupervisors(
      SearchSupervisorsParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getSupervisors,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return SupervisorModel.fromJson(response.data);
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
