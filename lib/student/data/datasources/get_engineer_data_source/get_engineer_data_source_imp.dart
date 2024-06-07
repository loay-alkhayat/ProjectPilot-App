import 'package:dio/dio.dart';
import 'package:projectpilot/core/extensions/dio_exception_type_extension.dart';
import 'package:projectpilot/student/data/datasources/get_engineer_data_source/get_engineer_data_source.dart';
import 'package:projectpilot/student/data/models/supervisors_models/engineer_model.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/error_message_model.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/parameters/search_engineers_param.dart';

class EngineerDataSourceImp implements EngineerDataSource {
  @override
  Future<EngineerModel> getEngineers(
      SearchEngineersParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getEngineers,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return EngineerModel.fromJson(response.data);
    } on DioException catch (error) {
      logger.d(
          "==================== Dio Exception ====================== \n ${error.toString()} \n ${error.response?.data}");
      if (error.isForbidden) {
        throw const ForbiddenException();
      }
      if (error.isBadRequest) {
        throw const BadRequestException();
      } else if (error.isUnAuthorized) {
        throw const UnAuthorizedException();
      } else if (error.isInternalServerError) {
        throw const InternalServerErrorException();
      } else if (error.isNoInternetConnection) {
        throw const NoInternetConnectionException();
      } else if (error.isNotFound) {
        throw const NotFoundException();
      } else if (error.isNoContent) {
        throw const NoContentException();
      }
      if (error.response != null) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
            error.response?.data,
          ),
        );
      } else {
        throw UnknownException();
      }
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
