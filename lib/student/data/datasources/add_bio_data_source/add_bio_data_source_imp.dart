import 'package:dio/dio.dart';
import 'package:projectpilot/core/extensions/dio_exception_type_extension.dart';
import 'package:projectpilot/student/data/datasources/add_bio_data_source/add_bio_data_source.dart';
import 'package:projectpilot/student/data/models/student_models/bio_model.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/error_message_model.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';

class BioDataSourceImp implements BioDataSource {
  @override
  Future<BioModel> addBio(BioParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.addBio,
        data: parameters.toJson(),
      );
      logger.d(response.data);
      return BioModel.fromJson(response.data);
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
