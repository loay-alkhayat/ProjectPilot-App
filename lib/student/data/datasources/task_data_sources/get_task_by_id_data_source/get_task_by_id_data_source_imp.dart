import 'package:dio/dio.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_task_by_id_param.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../models/task_models/get_task_by_id_model.dart';
import 'get_task_by_id_data_source.dart';

class GetTaskByIdDataSourceImp implements GetTaskByIdDataSource {
  @override
  Future<GetTaskByIdModel> getTaskById(GetTaskByIDParameters parameters) async {
    try {
      final response = await DioServices()
          .get(url: "${ApiUrls.getTaskByID}${parameters.taskID}");
      logger.d(response.data);
      return GetTaskByIdModel.fromJson(response.data);
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
