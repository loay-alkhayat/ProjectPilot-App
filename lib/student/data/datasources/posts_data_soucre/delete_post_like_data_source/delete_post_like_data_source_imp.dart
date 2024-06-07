import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/data/datasources/posts_data_soucre/delete_post_like_data_source/delete_post_like_data_source.dart';
import 'package:projectpilot/student/data/models/posts_models/add_comment_model.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/dio_services.dart';

class DeletePostLikeDataSourceImp implements DeletePostLikeDataSource {
  @override
  Future<AddCommentOrLikeModel> deleteLike(UnLikeParameters parameters) async {
    try {
      final response = await DioServices().deleteData(
        url: "${ApiUrls.addLike}${parameters.toString()}",
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return AddCommentOrLikeModel.fromJson(response.data);
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
