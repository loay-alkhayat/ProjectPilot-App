import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/tasks_params/delete_task_param.dart';
import '../../../models/task_models/delete_task_model.dart';
import 'delete_task_data_source.dart';

class DeleteTaskDataSourceImp implements DeleteTaskDataSource {
  @override
  Future<DeleteTaskModel> deleteTask(DeleteTaskParameters parameters) async {
    try {
      final response = await DioServices().deleteData(
        url: "${ApiUrls.deleteTask}${parameters.taskID}",
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return DeleteTaskModel.fromJson(response.data);
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
