import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/tasks_params/create_sub_task_param.dart';
import '../../../models/task_models/create_sub_task_model.dart';
import 'create_sub_task_data_source.dart';

class CreateSubTaskDataSourceImp implements CreateSubTaskDataSuorce {
  @override
  Future<CreateSubTaskModel> createSubTask(
      CreateSubTaskParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.createSubTask,
        data: parameters.toJson(),
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return CreateSubTaskModel.fromJson(response.data);
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
