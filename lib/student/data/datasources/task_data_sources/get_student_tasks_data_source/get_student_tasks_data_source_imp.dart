import 'package:dio/dio.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../models/task_models/get_student_tasks_model.dart';
import 'get_student_tasks_data_source.dart';

class GetStudentTasksDataSourceImp implements GetStudentTasksDataSource {
  @override
  Future<GetStudentTasksModel> getStudentTasks(NoParameters parameters) async {
    try {
      final response = await DioServices().get(url: ApiUrls.getStudentTasks);
      logger.d(response.data);
      return GetStudentTasksModel.fromJson(response.data);
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
