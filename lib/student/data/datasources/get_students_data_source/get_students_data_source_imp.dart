import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/get_students_data_source/get_students_data_source.dart';
import 'package:projectpilot/student/data/models/student_models/get_students_model.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../core/functions/functions.dart';

class GetStudentsDataSourceImp implements GetStudentsDataSource {
  @override
  Future<GetStudentsModel> getStudents(
      SearchStudentsParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getStudents,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return GetStudentsModel.fromJson(response.data);
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
