import 'package:dio/dio.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../core/functions/functions.dart';
import '../../models/student_models/get_student_by_id_model.dart';
import 'get_student_by_id_data_source.dart';

class GetStudentByIdDataSourceImp implements GetStudentByIdDataSource {
  @override
  Future<GetStudentByIdModel> getStudentById(
      GetStudentByIdParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: "${ApiUrls.getStudentByID}${parameters.studentID}",
      );
      logger.d(response.data);
      return GetStudentByIdModel.fromJson(response.data);
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
