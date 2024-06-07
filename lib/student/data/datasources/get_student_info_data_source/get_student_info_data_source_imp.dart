import 'package:dio/dio.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../core/functions/functions.dart';
import '../../models/student_models/get_student_info_model.dart';
import 'get_student_info_data_source.dart';

class GetStudentInfoDataSourceImp implements GetStudentInfoDataSource {
  @override
  Future<GetStudentInfoModel> getStudentInfo() async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getStudentProfile,
      );
      logger.d(response.data);
      return GetStudentInfoModel.fromJson(response.data);
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
