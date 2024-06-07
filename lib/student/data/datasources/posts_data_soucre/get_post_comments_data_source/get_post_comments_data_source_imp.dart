import 'package:dio/dio.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../../core/functions/functions.dart';
import '../../../models/posts_models/get_post_comments_model.dart';
import 'get_post_comments_data_source.dart';

class GetPostCommentsDataSourceImp implements GetPostCommentsDataSource {
  @override
  Future<GetPostCommentsModel> getPostComments(
      GetPostCommentsParameters parameters) async {
    try {
      final response = await DioServices().get(
        url: "${ApiUrls.getPostComments}${parameters.toString()}",
      );
      logger.d(response.data);
      return GetPostCommentsModel.fromJson(response.data);
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
