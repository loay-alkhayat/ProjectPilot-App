import 'package:dio/dio.dart';
import 'package:projectpilot/core/extensions/dio_exception_type_extension.dart';

import '../../../../../../../core/constants/apis_url.dart';
import '../../../../../../../core/errors/error_message_model.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../../../../../../core/services/dio_services.dart';
import '../../../../domain/parameters/login_parameters.dart';
import '../../../models/auth_models/user_model.dart';
import 'auth_data_source.dart';

class AuthDataSourceImp implements AuthDataSource {
  @override
  Future<StudentModel> login(LoginParameters parameters) async {
    try {
      final response = await DioServices()
          .post(url: ApiUrls.login, data: parameters.toJson(), headers: {});
      logger.d(response.data);

      return StudentModel.fromJson(response.data);
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
