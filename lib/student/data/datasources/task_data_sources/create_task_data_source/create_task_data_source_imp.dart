import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/data/models/task_models/create_task_model.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/tasks_params/create_task_parameters.dart';
import 'create_task_data_source.dart';

class CreateTaskDataSourceImp implements CreateTaskDataSuorce {
  @override
  Future<CreateTaskModel> createTask(CreateTaskParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.createTask,
        data: parameters.toJson(),
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return CreateTaskModel.fromJson(response.data);
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
