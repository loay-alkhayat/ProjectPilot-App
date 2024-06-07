import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';

import '../../../../../core/constants/apis_url.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../domain/parameters/posts_params/create_post_param.dart';
import '../../models/posts_models/create_post_model.dart';
import 'create_post_data_source.dart';

class CreatePostDataSourceImp implements CreatePostDataSource {
  @override
  Future<CreatePostModel> createPost(CreatePostParameters parameters) async {
    try {
      final response = await DioServices().post(
        url: ApiUrls.createPost,
        data: parameters.toJson(),
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return CreatePostModel.fromJson(response.data);
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
