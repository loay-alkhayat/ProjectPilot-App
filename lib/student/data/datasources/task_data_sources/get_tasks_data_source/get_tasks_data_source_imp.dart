import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/models/task_models/get_tasks_model.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import 'get_tasks_data_source.dart';

class GetTasksDataSourceImp implements GetTasksDataSource {
  @override
  Future<GetTasksModel> getTasks(GetTaskParameters parameters) async {
    try {
      final response = await DioServices()
          .get(url: ApiUrls.getTasks, data: parameters.toJson());
      logger.d(response.data);
      return GetTasksModel.fromJson(response.data);
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
